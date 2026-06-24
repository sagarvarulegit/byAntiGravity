import 'package:flutter/material.dart';
import '../models.dart';
import '../theme.dart';
import '../widgets/mastery_radial_gauge.dart';
import '../widgets/weekly_consistency_chart.dart';
import '../services/database_service.dart';

class ProgressView extends StatefulWidget {
  final UserState userState;

  const ProgressView({
    super.key,
    required this.userState,
  });

  @override
  State<ProgressView> createState() => _ProgressViewState();
}

class _ProgressViewState extends State<ProgressView> {
  late final DatabaseService _dbService;
  late Future<Map<String, dynamic>> _dataFuture;

  @override
  void initState() {
    super.initState();
    _dbService = SupabaseDatabaseService();
    _dataFuture = _loadData();
  }

  Future<Map<String, dynamic>> _loadData() async {
    final results = await Future.wait([
      _dbService.fetchSyllabus(),
      _dbService.fetchCompletedLessonIds(),
      _dbService.fetchWeeklyActivity(),
    ]);

    return {
      'subjects': results[0] as List<Subject>,
      'completedLessonIds': results[1] as List<String>,
      'weeklyMinutes': results[2] as List<double>,
    };
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return FutureBuilder<Map<String, dynamic>>(
      future: _dataFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.purple),
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
                  side: BorderSide(color: isDark ? AppColors.borderDark : AppColors.borderLight),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.error_outline_rounded, color: AppColors.orange, size: 48),
                      const SizedBox(height: 16),
                      Text(
                        "Failed to load metrics: ${snapshot.error}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _dataFuture = _loadData();
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

        final data = snapshot.data ?? {};
        final List<Subject> subjects = data['subjects'] as List<Subject>? ?? [];
        final List<String> completedLessonIds = data['completedLessonIds'] as List<String>? ?? [];
        final List<double> weeklyMinutes = data['weeklyMinutes'] as List<double>? ?? [20.0, 45.0, 30.0, 90.0, 120.0, 70.0, 150.0];

        // Recompute average mastery (Weighted Board Readiness Index) dynamically
        double totalMastery = 0;
        int subjectCount = 0;
        for (final subject in subjects) {
          int totalLessons = 0;
          int completedLessons = 0;
          for (final chapter in subject.chapters) {
            for (final lesson in chapter.lessons) {
              totalLessons++;
              if (completedLessonIds.contains(lesson.id)) {
                completedLessons++;
              }
            }
          }
          final double masteryVal = totalLessons > 0
              ? (completedLessons / totalLessons) * 100.0
              : 0.0;
          totalMastery += masteryVal;
          subjectCount++;
        }
        final double avgMastery = subjectCount > 0 ? totalMastery / subjectCount : 0.0;

        return SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Radial Summary board
              Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(color: isDark ? AppColors.borderDark : AppColors.borderLight),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Syllabus Mastery Distribution",
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              "Overall metrics computed from dynamic quizzes and video study hours.",
                              style: TextStyle(color: Colors.grey, fontSize: 12),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text(
                                  "${avgMastery.toInt()}%",
                                  style: const TextStyle(
                                    fontSize: 44,
                                    fontWeight: FontWeight.w800,
                                    color: AppColors.purple,
                                    fontFamily: 'Outfit',
                                  ),
                                ),
                                const SizedBox(width: 12),
                                const Text(
                                  "Weighted Board\nReadiness Index",
                                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, height: 1.2),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      MasteryRadialGauge(percentage: avgMastery, size: 130),
                    ],
                  ),
                ),
              ),
              
              const SizedBox(height: 24),

              // Side-by-side components
              GridView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 24,
                  mainAxisSpacing: 24,
                  childAspectRatio: 1.15,
                ),
                children: [
                  // Topic Breakdown
                  Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: BorderSide(color: isDark ? AppColors.borderDark : AppColors.borderLight),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Topic Wise Mastery Analysis",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          const SizedBox(height: 20),
                          Expanded(
                            child: ListView(
                              physics: const AlwaysScrollableScrollPhysics(),
                              children: _buildTopicMasteryBars(subjects, completedLessonIds),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Study Consistency Line Chart
                  Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: BorderSide(color: isDark ? AppColors.borderDark : AppColors.borderLight),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Weekly Study Consistency",
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                decoration: BoxDecoration(
                                  color: AppColors.orangeLight,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Text(
                                  "+200 Streak XP Active",
                                  style: TextStyle(color: AppColors.orange, fontSize: 8.5, fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 12),
                          Expanded(
                            child: WeeklyConsistencyChart(
                              weeklyMinutes: weeklyMinutes,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: _buildChartLabels(weeklyMinutes),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  List<Widget> _buildTopicMasteryBars(List<Subject> subjects, List<String> completedLessonIds) {
    final List<Widget> bars = [];
    for (final subject in subjects) {
      for (final chapter in subject.chapters) {
        int total = chapter.lessons.length;
        int completed = 0;
        for (final lesson in chapter.lessons) {
          if (completedLessonIds.contains(lesson.id)) {
            completed++;
          }
        }
        final double masteryVal = total > 0 ? completed / total : 0.0;
        
        Color color = AppColors.purple;
        if (subject.name.toLowerCase().contains('science')) {
          color = AppColors.blue;
        } else if (subject.name.toLowerCase().contains('social')) {
          color = AppColors.orange;
        }
        
        final String cleanTitle = chapter.title.contains(': ') 
            ? chapter.title.split(': ').last 
            : chapter.title;

        bars.add(_buildTopicProgressBar(
          "$cleanTitle (${subject.name})",
          masteryVal,
          color,
        ));
      }
    }
    return bars;
  }

  Widget _buildTopicProgressBar(String title, double value, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title, 
                  style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 8),
              Text("${(value * 100).toInt()}% Mastery", style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 6),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: value,
              backgroundColor: Colors.grey.withOpacity(0.1),
              valueColor: AlwaysStoppedAnimation(color),
              minHeight: 6,
            ),
          )
        ],
      ),
    );
  }

  List<Widget> _buildChartLabels(List<double> minutes) {
    final today = DateTime.now();
    final List<String> weekdays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    final List<Widget> widgets = [];
    
    final indices = [0, 2, 4, 6];
    for (final index in indices) {
      if (index < minutes.length) {
        final date = today.subtract(Duration(days: 6 - index));
        final String dayName = weekdays[date.weekday - 1];
        final int mins = minutes[index].toInt();
        widgets.add(Text(
          "$dayName (${mins}m)",
          style: const TextStyle(color: Colors.grey, fontSize: 8.5),
        ));
      }
    }
    return widgets;
  }
}
