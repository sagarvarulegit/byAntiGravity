import 'dart:math';
import 'package:flutter/material.dart';

/// A full-screen confetti burst overlay.
///
/// Shows 50 colored particles (squares and circles) in NCERT theme colors
/// that burst from the bottom-center, spread outward, fall with gravity,
/// and fade out over a 1.5-second animation.
class ConfettiOverlay extends StatefulWidget {
  /// Called when the confetti animation completes.
  final VoidCallback? onComplete;

  const ConfettiOverlay({super.key, this.onComplete});

  @override
  State<ConfettiOverlay> createState() => _ConfettiOverlayState();
}

class _ConfettiOverlayState extends State<ConfettiOverlay>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final List<_ConfettiParticle> _particles;

  static const _ncertColors = [
    Color(0xFFBE185D), // NCERT Magenta
    Color(0xFF0284C7), // NCERT Sky Blue
    Color(0xFFEA580C), // NCERT Orange
    Color(0xFF10B981), // Green
    Color(0xFFFBBF24), // Gold
    Color(0xFF831843), // Deep Magenta
    Color(0xFF7C3AED), // Violet
    Color(0xFFF43F5E), // Rose
  ];

  @override
  void initState() {
    super.initState();

    final rng = Random();
    _particles = List.generate(50, (_) => _ConfettiParticle(rng));

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          widget.onComplete?.call();
        }
      });

    // Auto-play
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          return CustomPaint(
            size: MediaQuery.of(context).size,
            painter: _ConfettiPainter(
              particles: _particles,
              progress: _controller.value,
              colors: _ncertColors,
            ),
          );
        },
      ),
    );
  }
}

/// Pre-computed random parameters for a single confetti particle.
class _ConfettiParticle {
  /// Horizontal velocity factor in [-1, 1] range, biased outward.
  final double vx;

  /// Upward launch speed factor in [0.5, 1.0].
  final double vy;

  /// Rotation speed in radians/sec.
  final double spin;

  /// Particle size in logical pixels.
  final double size;

  /// Index into the color palette.
  final int colorIndex;

  /// true = circle, false = square
  final bool isCircle;

  _ConfettiParticle(Random rng)
      : vx = (rng.nextDouble() * 2 - 1) * 1.0,
        vy = 0.5 + rng.nextDouble() * 0.5,
        spin = (rng.nextDouble() - 0.5) * 10,
        size = 4 + rng.nextDouble() * 6,
        colorIndex = rng.nextInt(8),
        isCircle = rng.nextBool();
}

class _ConfettiPainter extends CustomPainter {
  final List<_ConfettiParticle> particles;
  final double progress;
  final List<Color> colors;

  /// Gravity acceleration (pixels per normalized-time²).
  static const double _gravity = 800;

  /// Horizontal spread (pixels at max velocity).
  static const double _spreadX = 300;

  /// Upward launch impulse (pixels).
  static const double _launchY = 600;

  _ConfettiPainter({
    required this.particles,
    required this.progress,
    required this.colors,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final originX = size.width / 2;
    final originY = size.height; // bottom-center

    // Fade out during the last 40% of animation
    final opacity = progress > 0.6
        ? ((1.0 - progress) / 0.4).clamp(0.0, 1.0)
        : 1.0;

    for (final p in particles) {
      final t = progress;

      // Physics: x = vx * t, y = -vy * t + 0.5 * g * t²
      final px = originX + p.vx * _spreadX * t;
      final py = originY - p.vy * _launchY * t + 0.5 * _gravity * t * t;

      // Skip particles that have fallen below the screen
      if (py > size.height + 20) continue;

      final paint = Paint()
        ..color = colors[p.colorIndex].withValues(alpha: opacity)
        ..style = PaintingStyle.fill;

      canvas.save();
      canvas.translate(px, py);
      canvas.rotate(p.spin * t);

      if (p.isCircle) {
        canvas.drawCircle(Offset.zero, p.size / 2, paint);
      } else {
        canvas.drawRect(
          Rect.fromCenter(center: Offset.zero, width: p.size, height: p.size),
          paint,
        );
      }

      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(_ConfettiPainter oldDelegate) =>
      oldDelegate.progress != progress;
}
