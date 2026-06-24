import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../models.dart';
import '../theme.dart';
import '../services/database_service.dart';

class DashboardView extends StatefulWidget {
  final DatabaseService dbService;
  final UserState userState;
  final List<Subject> subjects;
  final Function(String) onSubjectSelected;
  final VoidCallback onUpgradeClicked;
  final Function(String subjectId, String lessonId)? onContinueLesson;

  const DashboardView({
    super.key,
    required this.dbService,
    required this.userState,
    required this.subjects,
    required this.onSubjectSelected,
    required this.onUpgradeClicked,
    this.onContinueLesson,
  });

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  late Future<List<dynamic>> _dashboardDataFuture;

  @override
  void initState() {
    super.initState();
    _dashboardDataFuture = Future.wait([
      widget.dbService.fetchCompletedLessonIds(),
      widget.dbService.fetchQuizAttemptHistory(),
      widget.dbService.fetchTotalStudyTime(),
      widget.dbService.fetchLastAccessedLesson(),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: _dashboardDataFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          final isDark = Theme.of(context).brightness == Brightness.dark;
          final double screenWidth = MediaQuery.of(context).size.width;
          return Shimmer.fromColors(
            baseColor: isDark ? Colors.grey[800]! : Colors.grey[300]!,
            highlightColor: isDark ? Colors.grey[700]! : Colors.grey[100]!,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Streak Banner Shimmer
                  Container(
                    width: double.infinity,
                    height: 180,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Continue Learning Card Shimmer
                  Container(
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  const SizedBox(height: 32),
                  // Stats Cards Row Shimmer
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Container(
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Container(
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  // Subject Cards Title Shimmer
                  Container(
                    width: 180,
                    height: 24,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Grid of Subject Cards Shimmer
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: screenWidth > 900 ? 3 : (screenWidth > 600 ? 2 : 1),
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: screenWidth > 900 ? 0.95 : (screenWidth > 600 ? 1.2 : 1.5),
                    ),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        }

        if (snapshot.hasError) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(color: Theme.of(context).brightness == Brightness.dark ? AppColors.borderDark : AppColors.borderLight),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.error_outline_rounded, color: AppColors.orange, size: 48),
                      const SizedBox(height: 16),
                      Text("Failed to load dashboard data: ${snapshot.error}", textAlign: TextAlign.center),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _dashboardDataFuture = Future.wait([
                              widget.dbService.fetchCompletedLessonIds(),
                              widget.dbService.fetchQuizAttemptHistory(),
                              widget.dbService.fetchTotalStudyTime(),
                              widget.dbService.fetchLastAccessedLesson(),
                            ]);
                          });
                        },
                        style: ElevatedButton.styleFrom(backgroundColor: AppColors.purple),
                        child: const Text("Retry", style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }

        final data = snapshot.data;
        final List<String> completedLessonIds = (data != null && data.isNotEmpty) ? data[0] as List<String> : [];
        final Map<String, QuizAttempt> quizAttempts = (data != null && data.length > 1) ? data[1] as Map<String, QuizAttempt> : {};
        final int totalStudyTimeSecs = (data != null && data.length > 2) ? data[2] as int : 0;
        final Map<String, dynamic>? lastAccessedData = (data != null && data.length > 3) ? data[3] as Map<String, dynamic>? : null;

        Lesson? lastLesson;
        Subject? lastSubject;
        Chapter? lastChapter;
        if (lastAccessedData != null) {
          final String? lessonId = lastAccessedData['lesson_id'] as String?;
          if (lessonId != null) {
            for (final subject in widget.subjects) {
              for (final chapter in subject.chapters) {
                for (final lesson in chapter.lessons) {
                  if (lesson.id == lessonId) {
                    lastLesson = lesson;
                    lastSubject = subject;
                    lastChapter = chapter;
                    break;
                  }
                }
                if (lastLesson != null) break;
              }
              if (lastLesson != null) break;
            }
          }
        }
        final double totalStudyTimeHours = totalStudyTimeSecs / 3600.0;

        // Calculate Syllabus Coverage
        int totalLessons = 0;
        int completedLessonsCount = 0;
        for (final subject in widget.subjects) {
          for (final chapter in subject.chapters) {
            for (final lesson in chapter.lessons) {
              totalLessons++;
              if (completedLessonIds.contains(lesson.id)) {
                completedLessonsCount++;
              }
            }
          }
        }
        final double syllabusCoverage = totalLessons > 0 ? (completedLessonsCount / totalLessons) * 100.0 : 0.0;

        // Calculate Average Quiz Score
        double sumScore = 0.0;
        final int attemptCount = quizAttempts.length;
        if (attemptCount > 0) {
          for (final attempt in quizAttempts.values) {
            sumScore += attempt.scorePercentage;
          }
        }
        final double avgQuizScore = attemptCount > 0 ? (sumScore / attemptCount) : 0.0;

        final isDark = Theme.of(context).brightness == Brightness.dark;
        final double screenWidth = MediaQuery.of(context).size.width;
        final int crossAxisCount = screenWidth > 900 ? 3 : (screenWidth > 600 ? 2 : 1);
        final double childAspectRatio = screenWidth > 900 ? 0.95 : (screenWidth > 600 ? 1.2 : 1.5);

        return RefreshIndicator(
          onRefresh: () async {
            setState(() {
              _dashboardDataFuture = Future.wait([
                widget.dbService.fetchCompletedLessonIds(),
                widget.dbService.fetchQuizAttemptHistory(),
                widget.dbService.fetchTotalStudyTime(),
                widget.dbService.fetchLastAccessedLesson(),
              ]);
            });
            await _dashboardDataFuture;
          },
          color: AppColors.purple,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Dynamic Streak Banner
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24.0),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      AppColors.purple,
                      Color(0xFF8B5CF6),
                      AppColors.orange,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.purple.withOpacity(0.25),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    )
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text(
                              "STUDY STREAK ACTIVE",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            widget.userState.streak == 0
                                ? "🔥 Start Your Study Streak Today!"
                                : "🔥 ${widget.userState.streak}-Day Daily Streak!",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Outfit',
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            widget.userState.streak == 0
                                ? "Unlock chapter animations and finish your first textbook quiz today to ignite your learning streak."
                                : "You're in the top 10% of class 10 learners this week. Complete today's lesson to keep the flame alive.",
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 13,
                              height: 1.4,
                            ),
                          ),
                          const SizedBox(height: 16),
                          // Progress Bar
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: LinearProgressIndicator(
                              value: syllabusCoverage / 100.0,
                              backgroundColor: Colors.white24,
                              valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                              minHeight: 8,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            widget.userState.streak == 0
                                ? "Welcome! Complete a lesson today to reach your first milestone!"
                                : "Last study: Yesterday. Complete a lesson today to keep your streak alive!",
                            style: const TextStyle(color: Colors.white60, fontSize: 11),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Icon(
                      Icons.emoji_events_rounded,
                      size: 90,
                      color: Colors.white24,
                    ),
                  ],
                ),
              ),

              // 📚 Start Learning Section
              const SizedBox(height: 28),
              Text(
                "📚 Start Learning",
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Outfit',
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "Select a subject to browse chapters and notes",
                style: TextStyle(
                  color: isDark ? Colors.grey[400] : Colors.grey[600],
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 16),
              ...widget.subjects.map((sub) {
                final double masteryVal = widget.userState.subjectMastery[sub.id] ?? 0.0;
                Color accentColor = AppColors.purple;
                Color bgColor = AppColors.purpleLight;
                IconData icon = Icons.abc_rounded;
                if (sub.name.toLowerCase().contains('science')) {
                  accentColor = AppColors.blue;
                  bgColor = AppColors.blueLight;
                  icon = Icons.science_rounded;
                } else if (sub.name.toLowerCase().contains('social')) {
                  accentColor = AppColors.orange;
                  bgColor = AppColors.orangeLight;
                  icon = Icons.public_rounded;
                } else {
                  icon = Icons.calculate_rounded;
                }
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: BorderSide(
                        color: isDark ? AppColors.borderDark : AppColors.borderLight,
                      ),
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(16),
                      onTap: () => widget.onSubjectSelected(sub.id),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: [
                            Container(
                              width: 52,
                              height: 52,
                              decoration: BoxDecoration(
                                color: isDark ? accentColor.withOpacity(0.15) : bgColor,
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: Icon(icon, color: accentColor, size: 26),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    sub.name,
                                    style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Outfit',
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    "${sub.chaptersCount} chapters · ${masteryVal.toInt()}% mastery",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: isDark ? Colors.grey[400] : Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                              decoration: BoxDecoration(
                                color: accentColor.withOpacity(0.12),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Browse",
                                    style: TextStyle(
                                      color: accentColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  Icon(Icons.arrow_forward_ios, color: accentColor, size: 12),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
              const SizedBox(height: 8),

              if (lastLesson != null && lastSubject != null && lastChapter != null) ...[
                const SizedBox(height: 24),
                _buildContinueLearningCard(
                  context,
                  lesson: lastLesson,
                  subject: lastSubject,
                  chapter: lastChapter,
                  completed: lastAccessedData!['completed'] as bool? ?? false,
                  watchTimeSeconds: lastAccessedData['watch_time_seconds'] as int? ?? 0,
                ),
              ],

              const SizedBox(height: 32),

              // Mini Stats Grid
              Row(
                children: [
                  Expanded(
                    child: _buildStatCard(
                      context,
                      icon: Icons.school_rounded,
                      color: AppColors.purple,
                      lightColor: AppColors.purpleLight,
                      value: "${syllabusCoverage.toStringAsFixed(0)}%",
                      label: "Syllabus Covered",
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildStatCard(
                      context,
                      icon: Icons.check_circle_rounded,
                      color: AppColors.green,
                      lightColor: AppColors.greenLight,
                      value: avgQuizScore == 0.0 ? "--" : "${avgQuizScore.toStringAsFixed(0)}%",
                      label: "Avg Quiz Score",
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildStatCard(
                      context,
                      icon: Icons.alarm_rounded,
                      color: AppColors.orange,
                      lightColor: AppColors.orangeLight,
                      value: "${totalStudyTimeHours.toStringAsFixed(1)}h",
                      label: "Study Time (Week)",
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 32),

              // Subject catalog Tracker section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      "CBSE Class 10 Syllabus Tracker",
                      style: Theme.of(context).textTheme.headlineMedium,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    "Select a subject to start",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
              
              const SizedBox(height: 20),

              // Subject Grid
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: childAspectRatio,
                ),
                itemCount: widget.subjects.length,
                itemBuilder: (context, index) {
                  final sub = widget.subjects[index];
                  final double masteryVal = widget.userState.subjectMastery[sub.id] ?? 0.0;
                  
                  Color accentColor = AppColors.purple;
                  Color bgAccentColor = AppColors.purpleLight;
                  if (sub.name.toLowerCase().contains('science')) {
                    accentColor = AppColors.blue;
                    bgAccentColor = AppColors.blueLight;
                  } else if (sub.name.toLowerCase().contains('social')) {
                    accentColor = AppColors.orange;
                    bgAccentColor = AppColors.orangeLight;
                  }

                  return Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: BorderSide(
                        color: isDark ? AppColors.borderDark : AppColors.borderLight,
                      ),
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(16),
                      onTap: () => widget.onSubjectSelected(sub.id),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 44,
                                  height: 44,
                                  decoration: BoxDecoration(
                                    color: isDark ? accentColor.withOpacity(0.15) : bgAccentColor,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Icon(
                                    _getSubjectIcon(sub.name),
                                    color: accentColor,
                                    size: 22,
                                  ),
                                ),
                                Text(
                                  "${sub.chaptersCount} Chapters",
                                  style: const TextStyle(color: Colors.grey, fontSize: 11, fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Text(
                              sub.name,
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Outfit'),
                            ),
                            const SizedBox(height: 4),
                            Expanded(
                              child: Text(
                                sub.description,
                                style: const TextStyle(color: Colors.grey, fontSize: 12),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Mastery: ${masteryVal.toInt()}%",
                                      style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      masteryVal > 75 ? "On Track" : "High Priority",
                                      style: TextStyle(
                                        color: masteryVal > 75 ? AppColors.green : AppColors.orange,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 6),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: LinearProgressIndicator(
                                    value: masteryVal / 100,
                                    backgroundColor: isDark ? Colors.white10 : Colors.black.withOpacity(0.05),
                                    valueColor: AlwaysStoppedAnimation<Color>(accentColor),
                                    minHeight: 6,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),);
      },
    );
  }

  Widget _buildContinueLearningCard(
    BuildContext context, {
    required Lesson lesson,
    required Subject subject,
    required Chapter chapter,
    required bool completed,
    required int watchTimeSeconds,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    Color subjectColor = AppColors.purple;
    Color subjectBgColor = AppColors.purpleLight;
    if (subject.name.toLowerCase().contains('science')) {
      subjectColor = AppColors.blue;
      subjectBgColor = AppColors.blueLight;
    } else if (subject.name.toLowerCase().contains('social')) {
      subjectColor = AppColors.orange;
      subjectBgColor = AppColors.orangeLight;
    }

    int durationSeconds = 0;
    if (lesson.duration.isNotEmpty) {
      final parts = lesson.duration.split(':');
      if (parts.length == 2) {
        final mins = int.tryParse(parts[0]) ?? 0;
        final secs = int.tryParse(parts[1]) ?? 0;
        durationSeconds = mins * 60 + secs;
      }
    }
    final double progress = durationSeconds > 0 ? (watchTimeSeconds / durationSeconds).clamp(0.0, 1.0) : 0.0;
    final int progressPct = (progress * 100).round();

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: isDark ? subjectColor.withOpacity(0.3) : subjectColor.withOpacity(0.2),
          width: 1.5,
        ),
      ),
      color: isDark ? AppColors.cardDark : Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: isDark ? subjectColor.withOpacity(0.15) : subjectBgColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "CONTINUE WHERE YOU LEFT OFF",
                    style: TextStyle(
                      color: subjectColor,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                      fontFamily: 'Outfit',
                    ),
                  ),
                ),
                const Spacer(),
                if (completed)
                  const Row(
                    children: [
                      Icon(Icons.check_circle_rounded, color: AppColors.green, size: 16),
                      SizedBox(width: 4),
                      Text(
                        "Completed",
                        style: TextStyle(color: AppColors.green, fontSize: 11, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                else if (lesson.type == LessonType.video && progressPct > 0)
                  Text(
                    "$progressPct% Completed",
                    style: TextStyle(
                      color: isDark ? AppColors.textDarkSecondary : AppColors.textLightSecondary,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: isDark ? Colors.white10 : Colors.black.withOpacity(0.03),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    lesson.type == LessonType.video ? Icons.play_circle_fill_rounded : Icons.description_rounded,
                    color: subjectColor,
                    size: 28,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        lesson.title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Outfit',
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "${subject.name} • ${chapter.title}",
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    widget.onContinueLesson?.call(subject.id, lesson.id);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: subjectColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        completed ? "Review" : "Resume",
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, fontFamily: 'Outfit'),
                      ),
                      const SizedBox(width: 6),
                      const Icon(Icons.arrow_forward_rounded, size: 14),
                    ],
                  ),
                ),
              ],
            ),
            if (lesson.type == LessonType.video && !completed && progressPct > 0) ...[
              const SizedBox(height: 16),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: LinearProgressIndicator(
                  value: progress,
                  backgroundColor: isDark ? Colors.white10 : Colors.black.withOpacity(0.05),
                  valueColor: AlwaysStoppedAnimation<Color>(subjectColor),
                  minHeight: 6,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(
    BuildContext context, {
    required IconData icon,
    required Color color,
    required Color lightColor,
    required String value,
    required String label,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: BorderSide(
          color: isDark ? AppColors.borderDark : AppColors.borderLight,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: isDark ? color.withOpacity(0.15) : lightColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: color, size: 18),
            ),
            const SizedBox(height: 12),
            Text(
              value,
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w800, fontFamily: 'Outfit'),
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getSubjectIcon(String name) {
    final lower = name.toLowerCase();
    if (lower.contains('math')) {
      return Icons.calculate_rounded;
    } else if (lower.contains('science')) {
      return Icons.science_rounded;
    } else if (lower.contains('social')) {
      return Icons.public_rounded;
    }
    return Icons.book_rounded;
  }
}
