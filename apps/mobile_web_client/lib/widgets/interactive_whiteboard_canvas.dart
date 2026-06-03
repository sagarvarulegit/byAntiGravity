import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../models.dart';
import '../theme.dart';

class InteractiveWhiteboardCanvas extends StatefulWidget {
  final VideoType videoType;
  final bool isPlaying;

  const InteractiveWhiteboardCanvas({
    super.key,
    required this.videoType,
    required this.isPlaying,
  });

  @override
  State<InteractiveWhiteboardCanvas> createState() => _InteractiveWhiteboardCanvasState();
}

class _InteractiveWhiteboardCanvasState extends State<InteractiveWhiteboardCanvas>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    );
    if (widget.isPlaying) {
      _controller.repeat();
    }
  }

  @override
  void didUpdateWidget(covariant InteractiveWhiteboardCanvas oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isPlaying) {
      _controller.repeat();
    } else {
      _controller.stop();
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
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: WhiteboardPainter(
            videoType: widget.videoType,
            progress: _controller.value,
            brightness: Theme.of(context).brightness,
          ),
          child: Container(),
        );
      },
    );
  }
}

class WhiteboardPainter extends CustomPainter {
  final VideoType videoType;
  final double progress;
  final Brightness brightness;

  WhiteboardPainter({
    required this.videoType,
    required this.progress,
    required this.brightness,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double width = size.width;
    final double height = size.height;
    
    // Blackboard overlay grid
    final paintGrid = Paint()
      ..color = brightness == Brightness.dark
          ? Colors.white.withOpacity(0.04)
          : Colors.black.withOpacity(0.02)
      ..strokeWidth = 1.0;
    
    const double gridSize = 30.0;
    for (double x = 0; x < width; x += gridSize) {
      canvas.drawLine(Offset(x, 0), Offset(x, height), paintGrid);
    }
    for (double y = 0; y < height; y += gridSize) {
      canvas.drawLine(Offset(0, y), Offset(width, y), paintGrid);
    }

    final double angle = progress * 2 * math.pi;

    if (videoType == VideoType.mathGraph) {
      // Draw Cartesian coordinate axes
      final paintAxis = Paint()
        ..color = brightness == Brightness.dark
            ? Colors.white.withOpacity(0.3)
            : Colors.black.withOpacity(0.2)
        ..strokeWidth = 2.0;

      canvas.drawLine(Offset(width / 2, 20), Offset(width / 2, height - 20), paintAxis);
      canvas.drawLine(Offset(20, height / 2), Offset(width - 20, height / 2), paintAxis);

      // Draw Sine Oscillation graph (Manim style)
      final paintGraph = Paint()
        ..color = AppColors.purple
        ..strokeWidth = 3.5
        ..style = PaintingStyle.stroke;

      final path = Path();
      bool first = true;
      for (double x = 30; x < width - 30; x++) {
        final double mathX = (x - width / 2) / 35.0;
        final double mathY = math.sin(mathX + angle) * 1.8 * math.cos(mathX * 0.5);
        final double screenY = height / 2 - mathY * 35.0;

        if (first) {
          path.moveTo(x, screenY);
          first = false;
        } else {
          path.lineTo(x, screenY);
        }
      }
      canvas.drawPath(path, paintGraph);

      // Interactive nodes / intercepts
      final paintNode = Paint()
        ..color = AppColors.orange
        ..style = PaintingStyle.fill;
      canvas.drawCircle(Offset(width / 2 + 50, height / 2), 6.0, paintNode);

      final textPainter = TextPainter(
        text: TextSpan(
          text: "f(x) = sin(x) • cos(0.5x)",
          style: TextStyle(
            color: brightness == Brightness.dark ? Colors.white70 : Colors.black87,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      textPainter.paint(canvas, Offset(width / 2 + 10, 45));

    } else if (videoType == VideoType.scienceAtom) {
      final double centerX = width / 2;
      final double centerY = height / 2;

      // Draw Electron Orbits
      final paintOrbit = Paint()
        ..color = brightness == Brightness.dark
            ? Colors.white.withOpacity(0.15)
            : Colors.black.withOpacity(0.1)
        ..strokeWidth = 2.0
        ..style = PaintingStyle.stroke;

      // First Orbit path
      canvas.save();
      canvas.translate(centerX, centerY);
      canvas.rotate(math.pi / 4);
      canvas.drawOval(Rect.fromCenter(center: Offset.zero, width: 220, height: 80), paintOrbit);
      canvas.restore();

      // Second Orbit path
      canvas.save();
      canvas.translate(centerX, centerY);
      canvas.rotate(-math.pi / 4);
      canvas.drawOval(Rect.fromCenter(center: Offset.zero, width: 220, height: 80), paintOrbit);
      canvas.restore();

      // Draw Nucleus Protons and Neutrons
      final paintNucleusOrange = Paint()..color = AppColors.orange;
      final paintNucleusPurple = Paint()..color = AppColors.purple;

      canvas.drawCircle(Offset(centerX - 8, centerY - 6), 10.0, paintNucleusOrange);
      canvas.drawCircle(Offset(centerX + 8, centerY + 6), 10.0, paintNucleusOrange);
      canvas.drawCircle(Offset(centerX + 6, centerY - 8), 10.0, paintNucleusPurple);
      canvas.drawCircle(Offset(centerX - 6, centerY + 8), 10.0, paintNucleusPurple);

      // Draw Orbiting Electrons
      final double eX1 = centerX + math.cos(angle) * 110 * math.cos(math.pi / 4) - math.sin(angle) * 40 * math.sin(math.pi / 4);
      final double eY1 = centerY + math.cos(angle) * 110 * math.sin(math.pi / 4) + math.sin(angle) * 40 * math.cos(math.pi / 4);

      final double eX2 = centerX + math.cos(-angle * 1.3) * 110 * math.cos(-math.pi / 4) - math.sin(-angle * 1.3) * 40 * math.sin(-math.pi / 4);
      final double eY2 = centerY + math.cos(-angle * 1.3) * 110 * math.sin(-math.pi / 4) + math.sin(-angle * 1.3) * 40 * math.cos(-math.pi / 4);

      final paintElectron = Paint()..color = AppColors.blue;
      canvas.drawCircle(Offset(eX1, eY1), 6.0, paintElectron);
      canvas.drawCircle(Offset(eX2, eY2), 6.0, paintElectron);

      final textPainter = TextPainter(
        text: TextSpan(
          text: "Oxygen Atom: 8 Electrons (Interactive)",
          style: TextStyle(
            color: brightness == Brightness.dark ? Colors.white70 : Colors.black87,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      textPainter.paint(canvas, const Offset(20, 20));

    } else if (videoType == VideoType.scienceCircuit) {
      final paintWire = Paint()
        ..color = brightness == Brightness.dark ? Colors.white70 : Colors.black87
        ..strokeWidth = 3.0
        ..style = PaintingStyle.stroke;

      // Draw wire contours
      final pathWire = Path();
      pathWire.addRect(Rect.fromLTRB(60, 40, width - 60, height - 40));
      canvas.drawPath(pathWire, paintWire);

      // Cover battery and resistor spots
      final paintErase = Paint()
        ..color = brightness == Brightness.dark ? AppColors.cardDark : AppColors.cardLight;
      canvas.drawRect(Rect.fromCenter(center: Offset(width / 2, 40), width: 80, height: 10), paintErase);
      canvas.drawRect(Rect.fromCenter(center: Offset(width / 2, height - 40), width: 80, height: 10), paintErase);

      // Draw Resistor zig-zag
      final paintRes = Paint()
        ..color = AppColors.purple
        ..strokeWidth = 3.0
        ..style = PaintingStyle.stroke;
      
      final resPath = Path()
        ..moveTo(width / 2 - 40, 40)
        ..lineTo(width / 2 - 30, 30)
        ..lineTo(width / 2 - 18, 50)
        ..lineTo(width / 2 - 6, 30)
        ..lineTo(width / 2 + 6, 50)
        ..lineTo(width / 2 + 18, 30)
        ..lineTo(width / 2 + 30, 50)
        ..lineTo(width / 2 + 40, 40);
      canvas.drawPath(resPath, paintRes);

      // Draw battery symbol
      final paintBatt = Paint()
        ..color = AppColors.orange
        ..strokeWidth = 3.0;

      final double battY = height - 40;
      canvas.drawLine(Offset(width / 2 - 20, battY), Offset(width / 2 + 20, battY), paintBatt);
      canvas.drawLine(Offset(width / 2 - 12, battY - 10), Offset(width / 2 - 12, battY + 10), paintBatt);
      canvas.drawLine(Offset(width / 2 - 4, battY - 5), Offset(width / 2 - 4, battY + 5), paintBatt);
      canvas.drawLine(Offset(width / 2 + 4, battY - 10), Offset(width / 2 + 4, battY + 10), paintBatt);
      canvas.drawLine(Offset(width / 2 + 12, battY - 5), Offset(width / 2 + 12, battY + 5), paintBatt);

      // Flowing electron dot indicator
      final paintFlow = Paint()..color = AppColors.green;
      final double flowLength = (width - 120) * 2 + (height - 80) * 2;
      final double flowDist = (progress * flowLength) % flowLength;
      
      Offset dotPos = const Offset(60, 40);
      
      // Calculate dot position around circuit border
      final double segTop = width - 120;
      final double segRight = height - 80;
      final double segBottom = width - 120;
      
      if (flowDist < segTop) {
        dotPos = Offset(60 + flowDist, 40);
      } else if (flowDist < segTop + segRight) {
        dotPos = Offset(width - 60, 40 + (flowDist - segTop));
      } else if (flowDist < segTop + segRight + segBottom) {
        dotPos = Offset(width - 60 - (flowDist - segTop - segRight), height - 40);
      } else {
        dotPos = Offset(60, height - 40 - (flowDist - segTop - segRight - segBottom));
      }
      
      canvas.drawCircle(dotPos, 6.0, paintFlow);

      // Labeling Text
      final textPainter = TextPainter(
        text: TextSpan(
          text: "I = V/R = 2 Amperes (Ohm's Law)",
          style: TextStyle(
            color: AppColors.green,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      textPainter.paint(canvas, const Offset(30, 20));

    } else {
      // Social Map Outline & Pins
      final paintContour = Paint()
        ..color = brightness == Brightness.dark ? Colors.white10 : Colors.black12
        ..strokeWidth = 2.0
        ..style = PaintingStyle.stroke;
      
      final contourPath = Path()
        ..moveTo(80, 80)
        ..quadraticBezierTo(180, 50, 240, 110)
        ..quadraticBezierTo(320, 170, 240, 220)
        ..quadraticBezierTo(160, 200, 80, 80);
      canvas.drawPath(contourPath, paintContour);

      // Locations
      final pins = [
        {"x": 120.0, "y": 90.0, "name": "Champaran (1917)"},
        {"x": 170.0, "y": 140.0, "name": "Kheda (1917)"},
        {"x": 220.0, "y": 180.0, "name": "Dandi (1930)"}
      ];

      for (int i = 0; i < pins.length; i++) {
        final pin = pins[i];
        final double pinX = pin["x"] as double;
        final double pinY = pin["y"] as double;
        final String pinName = pin["name"] as String;
        
        final double pulseRadius = 5.0 + 3.0 * math.sin(angle * 2 + i);
        
        final paintPin = Paint()..color = AppColors.orange;
        canvas.drawCircle(Offset(pinX, pinY), pulseRadius, paintPin);

        final textPainter = TextPainter(
          text: TextSpan(
            text: pinName,
            style: TextStyle(
              color: brightness == Brightness.dark ? Colors.white60 : Colors.black54,
              fontSize: 10,
            ),
          ),
          textDirection: TextDirection.ltr,
        );
        textPainter.layout();
        textPainter.paint(canvas, Offset(pinX + 10, pinY - 5));
      }
    }
  }

  @override
  bool shouldRepaint(covariant WhiteboardPainter oldDelegate) => true;
}
