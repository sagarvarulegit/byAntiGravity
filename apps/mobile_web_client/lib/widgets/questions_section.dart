import 'package:flutter/material.dart';
import '../theme.dart';

class QuestionAnswerPair {
  final String question;
  final String answer;
  const QuestionAnswerPair({required this.question, required this.answer});
}

class QuestionsSection extends StatelessWidget {
  final String title;
  final List<QuestionAnswerPair> qaPairs;
  final Widget Function(String, [TextStyle?]) buildMathText;

  const QuestionsSection({
    super.key,
    required this.title,
    required this.qaPairs,
    required this.buildMathText,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final Color badgeBg = isDark ? AppColors.purpleDark : AppColors.purpleLight;
    final Color badgeText = isDark ? const Color(0xFFFCE7F3) : AppColors.purpleDark;
    
    final Color containerBg = isDark ? const Color(0xFF1E1B4B) : const Color(0xFFFAF5FF); // NCERT premium soft indigo tint
    final Color containerBorder = isDark ? AppColors.purpleDark.withValues(alpha: 0.3) : AppColors.purple.withValues(alpha: 0.25);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: containerBg,
        border: Border.all(color: containerBorder, width: 1.5),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.25 : 0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
            decoration: BoxDecoration(
              color: isDark ? AppColors.purpleDark.withValues(alpha: 0.3) : AppColors.purpleLight.withValues(alpha: 0.7),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(14.5),
                topRight: Radius.circular(14.5),
              ),
              border: Border(
                bottom: BorderSide(
                  color: isDark ? AppColors.purpleDark.withValues(alpha: 0.5) : AppColors.purple.withValues(alpha: 0.15),
                  width: 1,
                ),
              ),
            ),
            child: Row(
              children: [
                const Text('❓', style: TextStyle(fontSize: 16)),
                const SizedBox(width: 8),
                Text(
                  title.toUpperCase(),
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: isDark ? const Color(0xFFFCE7F3) : AppColors.purpleDark,
                    fontFamily: 'Outfit',
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ),
          
          // Q&A List
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(qaPairs.length, (index) {
                final pair = qaPairs[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (index > 0) ...[
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 14.0),
                        child: Divider(
                          color: isDark ? Colors.white10 : Colors.black12,
                          height: 1,
                        ),
                      ),
                    ],
                    // Question block
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          margin: const EdgeInsets.only(top: 1, right: 8),
                          decoration: BoxDecoration(
                            color: badgeBg,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            "Q${index + 1}",
                            style: TextStyle(
                              fontFamily: 'Outfit',
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: badgeText,
                            ),
                          ),
                        ),
                        Expanded(
                          child: buildMathText(
                            pair.question,
                            TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13.5,
                              color: isDark ? AppColors.textDarkPrimary : AppColors.textLightPrimary,
                              height: 1.4,
                              fontFamily: 'Outfit',
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    // Answer block
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: isDark ? const Color(0xFF0F172A) : Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: isDark ? Colors.white10 : Colors.black12,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Answer",
                                style: TextStyle(
                                  fontFamily: 'Outfit',
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: isDark ? AppColors.green : const Color(0xFF059669),
                                ),
                              ),
                              const SizedBox(width: 4),
                              Icon(
                                Icons.check_circle_outline_rounded,
                                size: 12,
                                color: isDark ? AppColors.green : const Color(0xFF059669),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          buildMathText(
                            pair.answer,
                            TextStyle(
                              fontSize: 13,
                              color: isDark ? AppColors.textDarkSecondary : AppColors.textLightSecondary,
                              height: 1.5,
                              fontFamily: 'Georgia',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
