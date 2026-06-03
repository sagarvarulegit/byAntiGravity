import 'package:flutter/material.dart';
import '../theme.dart';

class WeeklyConsistencyChart extends StatelessWidget {
  final List<double> weeklyMinutes;

  const WeeklyConsistencyChart({
    super.key,
    required this.weeklyMinutes,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: ChartPainter(
        data: weeklyMinutes,
        brightness: Theme.of(context).brightness,
      ),
      child: Container(
        height: 180,
      ),
    );
  }
}

class ChartPainter extends CustomPainter {
  final List<double> data;
  final Brightness brightness;

  ChartPainter({
    required this.data,
    required this.brightness,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double width = size.width;
    final double height = size.height;

    // Boundary check
    if (data.isEmpty) return;

    final double maxVal = data.reduce((curr, next) => curr > next ? curr : next);
    final double maxAxisY = maxVal > 0 ? maxVal * 1.2 : 100.0;

    // Draw Grid Lines
    final gridPaint = Paint()
      ..color = brightness == Brightness.dark ? Colors.white10 : Colors.black.withOpacity(0.05)
      ..strokeWidth = 1.0;
    
    for (int i = 1; i <= 3; i++) {
      final double gridY = height * (i / 4.0);
      canvas.drawLine(Offset(0, gridY), Offset(width, gridY), gridPaint);
    }

    // Prepare path points
    final List<Offset> points = [];
    final double segmentWidth = width / (data.length - 1);

    for (int i = 0; i < data.length; i++) {
      final double x = i * segmentWidth;
      // Invert Y axis for screen space
      final double y = height - (data[i] / maxAxisY) * (height - 30) - 10;
      points.add(Offset(x, y));
    }

    // Draw Area Fill Gradient Path
    final fillPath = Path()
      ..moveTo(0, height);
    for (var pt in points) {
      fillPath.lineTo(pt.dx, pt.dy);
    }
    fillPath.lineTo(width, height);
    fillPath.close();

    final fillPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          AppColors.purple.withOpacity(0.2),
          AppColors.purple.withOpacity(0.0),
        ],
      ).createShader(Rect.fromLTRB(0, 0, width, height));

    canvas.drawPath(fillPath, fillPaint);

    // Draw Smooth Line Path
    final linePath = Path()
      ..moveTo(points[0].dx, points[0].dy);
    
    for (int i = 0; i < points.length - 1; i++) {
      final p1 = points[i];
      final p2 = points[i + 1];
      final controlPoint1 = Offset(p1.dx + segmentWidth / 2, p1.dy);
      final controlPoint2 = Offset(p2.dx - segmentWidth / 2, p2.dy);
      linePath.cubicTo(controlPoint1.dx, controlPoint1.dy, controlPoint2.dx, controlPoint2.dy, p2.dx, p2.dy);
    }

    final linePaint = Paint()
      ..color = AppColors.purple
      ..strokeWidth = 3.5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawPath(linePath, linePaint);

    // Draw Data Point Nodes
    final nodePaintInner = Paint()
      ..color = brightness == Brightness.dark ? AppColors.cardDark : AppColors.cardLight
      ..style = PaintingStyle.fill;

    final nodePaintOuter = Paint()
      ..color = AppColors.purple
      ..strokeWidth = 3.0
      ..style = PaintingStyle.stroke;

    for (var pt in points) {
      canvas.drawCircle(pt, 5.0, nodePaintInner);
      canvas.drawCircle(pt, 5.0, nodePaintOuter);
    }
  }

  @override
  bool shouldRepaint(covariant ChartPainter oldDelegate) => true;
}
