import 'package:flutter/material.dart';
import '../theme.dart';

/// Model representing a single comic strip panel conversation step.
class ComicPanel {
  final String speaker; // Expected to be 'Priya' or 'Rahul'
  final String text;

  ComicPanel({
    required this.speaker,
    required this.text,
  });
}

/// A reusable widget presenting a comic-style visual chapter recap.
class ComicRecap extends StatelessWidget {
  final List<ComicPanel> panels;
  final Widget rememberThis;

  const ComicRecap({
    super.key,
    required this.panels,
    required this.rememberThis,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: isDark ? AppColors.cardDark : AppColors.cardLight,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isDark ? AppColors.borderDark : AppColors.borderLight,
          width: 2.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(isDark ? 0.25 : 0.08),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header of the Comic Strip
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: AppColors.purple,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  "RECAP COMIC",
                  style: TextStyle(
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Colors.white,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Container(
                  height: 3,
                  decoration: BoxDecoration(
                    color: AppColors.purple.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(1.5),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Dialog Panels List
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: panels.length,
            separatorBuilder: (context, index) => const SizedBox(height: 24),
            itemBuilder: (context, index) {
              final panel = panels[index];
              final isPriya = panel.speaker.trim().toLowerCase() == 'priya';

              // Bubbles styling
              final Color bubbleBgColor = isPriya
                  ? (isDark ? AppColors.purpleDark.withOpacity(0.4) : AppColors.purpleLight)
                  : (isDark ? AppColors.blueDark.withOpacity(0.4) : AppColors.blueLight);

              final Color bubbleBorderColor = isPriya
                  ? (isDark ? AppColors.purple.withOpacity(0.8) : AppColors.purple.withOpacity(0.4))
                  : (isDark ? AppColors.blue.withOpacity(0.8) : AppColors.blue.withOpacity(0.4));

              final Color bubbleTextColor = isPriya
                  ? (isDark ? AppColors.textDarkPrimary : AppColors.textLightPrimary)
                  : (isDark ? AppColors.textDarkPrimary : AppColors.textLightPrimary);

              return _buildPanelRow(
                context: context,
                panel: panel,
                isPriya: isPriya,
                bubbleBgColor: bubbleBgColor,
                bubbleBorderColor: bubbleBorderColor,
                bubbleTextColor: bubbleTextColor,
                index: index,
              );
            },
          ),

          const SizedBox(height: 20),

          // "Remember This!" callout section
          _buildRememberThisBox(context, rememberThis),
        ],
      ),
    );
  }

  Widget _buildPanelRow({
    required BuildContext context,
    required ComicPanel panel,
    required bool isPriya,
    required Color bubbleBgColor,
    required Color bubbleBorderColor,
    required Color bubbleTextColor,
    required int index,
  }) {
    final avatar = _buildAvatar(context, isPriya: isPriya);

    final bubble = Flexible(
      child: CustomPaint(
        painter: SpeechBubblePainter(
          color: bubbleBgColor,
          borderColor: bubbleBorderColor,
          isLeft: isPriya,
        ),
        child: Padding(
          padding: isPriya
              ? const EdgeInsets.fromLTRB(16 + 10, 12, 16, 12)
              : const EdgeInsets.fromLTRB(16, 12, 16 + 10, 12),
          child: Text(
            panel.text,
            style: TextStyle(
              fontFamily: 'Georgia',
              fontSize: 14.5,
              height: 1.35,
              color: bubbleTextColor,
            ),
          ),
        ),
      ),
    );

    return Column(
      crossAxisAlignment: isPriya ? CrossAxisAlignment.start : CrossAxisAlignment.end,
      children: [
        // Small comic panel index badge
        Padding(
          padding: EdgeInsets.only(
            left: isPriya ? 56 : 0,
            right: isPriya ? 0 : 56,
            bottom: 4,
          ),
          child: Text(
            "PANEL ${index + 1}",
            style: const TextStyle(
              fontFamily: 'Outfit',
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: isPriya ? MainAxisAlignment.start : MainAxisAlignment.end,
          children: [
            if (isPriya) ...[
              avatar,
              const SizedBox(width: 8),
              bubble,
              const SizedBox(width: 32), // Right spacing to keep bubble within bounds
            ] else ...[
              const SizedBox(width: 32), // Left spacing to keep bubble within bounds
              bubble,
              const SizedBox(width: 8),
              avatar,
            ],
          ],
        ),
      ],
    );
  }

  Widget _buildAvatar(BuildContext context, {required bool isPriya}) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final color = isPriya ? AppColors.purple : AppColors.blue;
    final initial = isPriya ? 'P' : 'R';
    final name = isPriya ? 'Priya' : 'Rahul';

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            border: Border.all(
              color: isDark ? Colors.white24 : Colors.black87,
              width: 2.0,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.12),
                blurRadius: 4,
                offset: const Offset(1, 2),
              ),
            ],
          ),
          child: Center(
            child: Text(
              initial,
              style: const TextStyle(
                fontFamily: 'Outfit',
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          name,
          style: TextStyle(
            fontFamily: 'Outfit',
            fontSize: 11,
            fontWeight: FontWeight.bold,
            color: isDark ? AppColors.textDarkSecondary : AppColors.textLightSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildRememberThisBox(BuildContext context, Widget child) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final bgColor = isDark ? AppColors.orangeDark.withOpacity(0.35) : AppColors.orangeLight;
    final borderColor = AppColors.orange;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: borderColor,
          width: 2.0,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.orange.withOpacity(isDark ? 0.08 : 0.12),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                "📌",
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(width: 8),
              Text(
                "REMEMBER THIS!",
                style: TextStyle(
                  fontFamily: 'Outfit',
                  fontSize: 14.5,
                  fontWeight: FontWeight.bold,
                  color: isDark ? AppColors.orange : AppColors.orangeDark,
                  letterSpacing: 1.1,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          child,
        ],
      ),
    );
  }
}

/// A CustomPainter that draws a speech bubble background with a small triangular tail
/// pointing to the left or right avatar.
class SpeechBubblePainter extends CustomPainter {
  final Color color;
  final Color borderColor;
  final bool isLeft;

  SpeechBubblePainter({
    required this.color,
    required this.borderColor,
    required this.isLeft,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    final path = Path();
    const double radius = 14.0; // corner radius
    const double arrowWidth = 10.0;
    const double arrowHeight = 10.0;
    const double arrowY = 12.0; // vertical position of arrow tail

    if (isLeft) {
      // Left side bubble (arrow points left to speaker)
      path.moveTo(arrowWidth + radius, 0);
      path.lineTo(size.width - radius, 0);
      path.quadraticBezierTo(size.width, 0, size.width, radius);
      path.lineTo(size.width, size.height - radius);
      path.quadraticBezierTo(size.width, size.height, size.width - radius, size.height);
      path.lineTo(arrowWidth + radius, size.height);
      path.quadraticBezierTo(arrowWidth, size.height, arrowWidth, size.height - radius);

      // Left-facing arrow pointing to the avatar
      path.lineTo(arrowWidth, arrowY + arrowHeight);
      path.lineTo(0, arrowY + arrowHeight / 2);
      path.lineTo(arrowWidth, arrowY);

      path.lineTo(arrowWidth, radius);
      path.quadraticBezierTo(arrowWidth, 0, arrowWidth + radius, 0);
    } else {
      // Right side bubble (arrow points right to speaker)
      path.moveTo(radius, 0);
      path.lineTo(size.width - arrowWidth - radius, 0);
      path.quadraticBezierTo(size.width - arrowWidth, 0, size.width - arrowWidth, radius);

      // Right-facing arrow pointing to the avatar
      path.lineTo(size.width - arrowWidth, arrowY);
      path.lineTo(size.width, arrowY + arrowHeight / 2);
      path.lineTo(size.width - arrowWidth, arrowY + arrowHeight);

      path.lineTo(size.width - arrowWidth, size.height - radius);
      path.quadraticBezierTo(size.width - arrowWidth, size.height, size.width - arrowWidth - radius, size.height);
      path.lineTo(radius, size.height);
      path.quadraticBezierTo(0, size.height, 0, size.height - radius);
      path.lineTo(0, radius);
      path.quadraticBezierTo(0, 0, radius, 0);
    }
    path.close();

    canvas.drawPath(path, paint);
    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(covariant SpeechBubblePainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.borderColor != borderColor ||
        oldDelegate.isLeft != isLeft;
  }
}
