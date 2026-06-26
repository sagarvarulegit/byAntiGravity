import 'package:flutter/material.dart';
import '../theme.dart';

class InteractiveExample extends StatefulWidget {
  final String title;
  final Widget questionWidget;
  final Widget solutionWidget;

  const InteractiveExample({
    super.key,
    required this.title,
    required this.questionWidget,
    required this.solutionWidget,
  });

  @override
  State<InteractiveExample> createState() => _InteractiveExampleState();
}

class _InteractiveExampleState extends State<InteractiveExample> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: isDark ? AppColors.cardDark : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark ? AppColors.borderDark : AppColors.borderLight,
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header & Question
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.blue.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        widget.title,
                        style: const TextStyle(
                          color: AppColors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          fontFamily: 'Outfit',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                widget.questionWidget,
              ],
            ),
          ),
          
          // Divider
          Divider(
            height: 1,
            color: isDark ? AppColors.borderDark : AppColors.borderLight,
          ),

          // Interactive Solution Toggle
          Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              tilePadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
              onExpansionChanged: (expanded) {
                setState(() {
                  _isExpanded = expanded;
                });
              },
              title: Text(
                _isExpanded ? "Hide Solution" : "Show Solution",
                style: const TextStyle(
                  color: AppColors.purple,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  fontFamily: 'Outfit',
                ),
              ),
              leading: Icon(
                _isExpanded ? Icons.visibility_off_rounded : Icons.visibility_rounded,
                color: AppColors.purple,
              ),
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: isDark ? Colors.black12 : AppColors.bgLight,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                  ),
                  child: widget.solutionWidget,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
