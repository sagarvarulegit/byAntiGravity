import 'package:flutter/material.dart';
import '../models.dart';
import '../theme.dart';

class DashboardView extends StatelessWidget {
  final UserState userState;
  final List<Subject> subjects;
  final Function(String) onSubjectSelected;
  final VoidCallback onUpgradeClicked;

  const DashboardView({
    super.key,
    required this.userState,
    required this.subjects,
    required this.onSubjectSelected,
    required this.onUpgradeClicked,
  });

  double get _averageMastery {
    if (userState.subjectMastery.isEmpty) return 0.0;
    double sum = 0.0;
    userState.subjectMastery.forEach((key, val) => sum += val);
    return sum / userState.subjectMastery.length;
  }

  double get _averageQuizScore {
    if (userState.quizHighScores.isEmpty) return 0.0;
    double sum = 0.0;
    userState.quizHighScores.forEach((key, val) => sum += val);
    return sum / userState.quizHighScores.length;
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final double screenWidth = MediaQuery.of(context).size.width;
    final int crossAxisCount = screenWidth > 900 ? 3 : (screenWidth > 600 ? 2 : 1);
    final double childAspectRatio = screenWidth > 900 ? 0.95 : (screenWidth > 600 ? 1.2 : 1.5);

    return SingleChildScrollView(
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
                        userState.streak == 0
                            ? "🔥 Start Your Study Streak Today!"
                            : "🔥 ${userState.streak}-Day Daily Streak!",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Outfit',
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        userState.streak == 0
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
                          value: _averageMastery / 100.0,
                          backgroundColor: Colors.white24,
                          valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                          minHeight: 8,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        userState.streak == 0
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
                  value: "${_averageMastery.toStringAsFixed(0)}%",
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
                  value: _averageQuizScore == 0.0 ? "--" : "${_averageQuizScore.toStringAsFixed(0)}%",
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
                  value: "${(_averageMastery * 0.2).toStringAsFixed(1)}h",
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
            itemCount: subjects.length,
            itemBuilder: (context, index) {
              final sub = subjects[index];
              final double masteryVal = userState.subjectMastery[sub.id] ?? 0.0;
              
              Color accentColor = AppColors.purple;
              Color bgAccentColor = AppColors.purpleLight;
              if (sub.id == 'science') {
                accentColor = AppColors.blue;
                bgAccentColor = AppColors.blueLight;
              } else if (sub.id == 'social') {
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
                  onTap: () => onSubjectSelected(sub.id),
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
                                _getSubjectIcon(sub.id),
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

  IconData _getSubjectIcon(String subId) {
    switch (subId) {
      case 'maths':
        return Icons.calculate_rounded;
      case 'science':
        return Icons.science_rounded;
      case 'social':
        return Icons.public_rounded;
      default:
        return Icons.book_rounded;
    }
  }
}
