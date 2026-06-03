import 'package:flutter/material.dart';
import '../models.dart';
import '../theme.dart';
import '../widgets/mastery_radial_gauge.dart';
import '../widgets/weekly_consistency_chart.dart';

class ProgressView extends StatelessWidget {
  final UserState userState;

  const ProgressView({
    super.key,
    required this.userState,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    // Average mastery
    double totalMastery = 0;
    for (var v in userState.subjectMastery.values) {
      totalMastery += v;
    }
    final double avgMastery = userState.subjectMastery.isNotEmpty
        ? totalMastery / userState.subjectMastery.length
        : 65.0;

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
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            _buildTopicProgressBar("Quadratic Equations (Maths)", 0.90, AppColors.purple),
                            _buildTopicProgressBar("Chemical Reactions (Science)", 0.45, AppColors.blue),
                            _buildTopicProgressBar("Nationalism in India (Social)", 0.80, AppColors.orange),
                            _buildTopicProgressBar("Light & Optics (Science)", 0.60, AppColors.blue),
                          ],
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
                      const Expanded(
                        child: WeeklyConsistencyChart(
                          weeklyMinutes: [20, 45, 30, 90, 120, 70, 150],
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Mon (20m)", style: TextStyle(color: Colors.grey, fontSize: 8.5)),
                          Text("Wed (30m)", style: TextStyle(color: Colors.grey, fontSize: 8.5)),
                          Text("Fri (120m)", style: TextStyle(color: Colors.grey, fontSize: 8.5)),
                          Text("Sun (150m)", style: TextStyle(color: Colors.grey, fontSize: 8.5)),
                        ],
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
              Text(title, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600)),
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
}
