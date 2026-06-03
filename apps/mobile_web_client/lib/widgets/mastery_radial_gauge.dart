import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../theme.dart';

class MasteryRadialGauge extends StatelessWidget {
  final double percentage;
  final double size;

  const MasteryRadialGauge({
    super.key,
    required this.percentage,
    this.size = 120.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            painter: RadialGaugePainter(
              percentage: percentage,
              brightness: Theme.of(context).brightness,
            ),
            child: Container(),
          ),
          Text(
            "${percentage.toInt()}%",
            style: TextStyle(
              fontFamily: 'Outfit',
              fontSize: size * 0.2,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class RadialGaugePainter extends CustomPainter {
  final double percentage;
  final Brightness brightness;

  RadialGaugePainter({
    required this.percentage,
    required this.brightness,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double centerX = size.width / 2;
    final double centerY = size.height / 2;
    final double radius = math.min(centerX, centerY) - 8;

    final paintBg = Paint()
      ..color = brightness == Brightness.dark
          ? Colors.white.withOpacity(0.06)
          : Colors.black.withOpacity(0.04)
      ..strokeWidth = size.width * 0.08
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(Offset(centerX, centerY), radius, paintBg);

    final paintProgress = Paint()
      ..color = AppColors.purple
      ..strokeWidth = size.width * 0.08
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final double sweepAngle = 2 * math.pi * (percentage / 100.0);

    canvas.drawArc(
      Rect.fromCircle(center: Offset(centerX, centerY), radius: radius),
      -math.pi / 2, // Start from 12 o'clock
      sweepAngle,
      false,
      paintProgress,
    );
  }

  @override
  bool shouldRepaint(covariant RadialGaugePainter oldDelegate) => true;
}
