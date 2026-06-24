import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../theme.dart';

class MasteryRadialGauge extends StatefulWidget {
  final double percentage;
  final double size;

  const MasteryRadialGauge({
    super.key,
    required this.percentage,
    this.size = 120.0,
  });

  @override
  State<MasteryRadialGauge> createState() => _MasteryRadialGaugeState();
}

class _MasteryRadialGaugeState extends State<MasteryRadialGauge> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _animation = Tween<double>(begin: 0.0, end: widget.percentage).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
    );
    _controller.forward();
  }

  @override
  void didUpdateWidget(covariant MasteryRadialGauge oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.percentage != widget.percentage) {
      _animation = Tween<double>(begin: _animation.value, end: widget.percentage).animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
      );
      _controller.forward(from: 0.0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return SizedBox(
          width: widget.size,
          height: widget.size,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CustomPaint(
                painter: RadialGaugePainter(
                  percentage: _animation.value,
                  brightness: Theme.of(context).brightness,
                ),
                child: Container(),
              ),
              Text(
                "${_animation.value.toInt()}%",
                style: TextStyle(
                  fontFamily: 'Outfit',
                  fontSize: widget.size * 0.2,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      },
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
