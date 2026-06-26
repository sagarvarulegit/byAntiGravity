import 'package:flutter/material.dart';
import '../theme.dart';

class QuestionCard extends StatelessWidget {
  final Widget questionWidget;
  final Widget answerWidget;

  const QuestionCard({
    super.key,
    required this.questionWidget,
    required this.answerWidget,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E293B) : const Color(0xFFF8F9FA),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDark ? AppColors.borderDark : AppColors.borderLight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Question Header Area
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                questionWidget,
              ],
            ),
          ),
          
          // Soft Divider
          Divider(
            height: 1,
            color: isDark ? Colors.white10 : Colors.black12,
          ),
          
          // Answer Area
          Padding(
            padding: const EdgeInsets.all(16),
            child: answerWidget,
          ),
        ],
      ),
    );
  }
}
