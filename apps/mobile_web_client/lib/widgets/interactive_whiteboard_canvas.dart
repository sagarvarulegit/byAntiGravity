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

    } else if (videoType == VideoType.socialMap) {
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
    } else if (videoType == VideoType.scienceCombination) {
      final bool isDark = brightness == Brightness.dark;
      final cx = width / 2;
      final cy = height / 2;

      // Beaker outline
      final beakerPaint = Paint()
        ..color = isDark ? Colors.white24 : Colors.black12
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2;
      final beakerW = 90.0;
      final beakerH = 100.0;
      final beakerLeft = cx - beakerW / 2;
      final beakerTop = cy - beakerH / 2 + 10;
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(beakerLeft, beakerTop, beakerW, beakerH),
          const Radius.circular(6),
        ),
        beakerPaint,
      );

      // CaO solid pile at bottom of beaker
      final caoPaint = Paint()
        ..color = isDark ? const Color(0xFFCBD5E1) : const Color(0xFF94A3B8)
        ..style = PaintingStyle.fill;
      final pilePath = Path()
        ..moveTo(beakerLeft + 8, beakerTop + beakerH - 6)
        ..lineTo(beakerLeft + 20, beakerTop + beakerH - 30)
        ..lineTo(beakerLeft + 40, beakerTop + beakerH - 25)
        ..lineTo(beakerLeft + 60, beakerTop + beakerH - 32)
        ..lineTo(beakerLeft + 82, beakerTop + beakerH - 6)
        ..close();
      canvas.drawPath(pilePath, caoPaint);

      // Slaked lime (Ca(OH)₂) forming — a lighter layer on top
      final slakedPaint = Paint()
        ..color = isDark ? Colors.white12 : Colors.black.withOpacity(0.06)
        ..style = PaintingStyle.fill;
      final liquidLevel = beakerTop + beakerH - 36;
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(beakerLeft + 4, liquidLevel, beakerW - 8, 10),
          const Radius.circular(2),
        ),
        slakedPaint,
      );

      // Water droplets falling from above (animated)
      final waterDropPaint = Paint()
        ..color = const Color(0xFF3B82F6)
        ..style = PaintingStyle.fill;
      final double fall1 = (progress * 1.5) % 1.0;
      final double fall2 = ((progress + 0.35) * 1.5) % 1.0;
      final double fall3 = ((progress + 0.7) * 1.5) % 1.0;
      
      canvas.drawCircle(Offset(cx - 15, beakerTop - 25 + fall1 * 40), 3, waterDropPaint);
      canvas.drawCircle(Offset(cx, beakerTop - 25 + fall2 * 45), 2.5, waterDropPaint);
      canvas.drawCircle(Offset(cx + 12, beakerTop - 25 + fall3 * 35), 2, waterDropPaint);

      // Steam/vapor rising (curved paths animated)
      final steamPaint = Paint()
        ..color = isDark ? Colors.white38 : Colors.grey.withOpacity(0.4)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.5
        ..strokeCap = StrokeCap.round;
      final double wave = 3.0 * math.sin(angle * 2);
      final steamPath1 = Path()
        ..moveTo(cx - 20, beakerTop + 5)
        ..quadraticBezierTo(cx - 30 + wave, beakerTop - 15, cx - 15 + wave, beakerTop - 35);
      canvas.drawPath(steamPath1, steamPaint);
      final steamPath2 = Path()
        ..moveTo(cx, beakerTop + 5)
        ..quadraticBezierTo(cx - 5 + wave, beakerTop - 20, cx + 5 + wave, beakerTop - 45);
      canvas.drawPath(steamPath2, steamPaint);
      final steamPath3 = Path()
        ..moveTo(cx + 20, beakerTop + 5)
        ..quadraticBezierTo(cx + 30 + wave, beakerTop - 15, cx + 15 + wave, beakerTop - 35);
      canvas.drawPath(steamPath3, steamPaint);

      // "CaO" label
      final textStyle = TextStyle(
        color: isDark ? Colors.white60 : Colors.black54,
        fontSize: 10,
        fontWeight: FontWeight.bold,
      );
      final textPainter = TextPainter(
        text: TextSpan(text: "CaO", style: textStyle),
        textDirection: TextDirection.ltr,
      )..layout();
      textPainter.paint(canvas, Offset(beakerLeft + 35, beakerTop + beakerH - 48));

      // "+ H₂O" label
      final h2oTextPainter = TextPainter(
        text: TextSpan(text: "+ H₂O", style: textStyle),
        textDirection: TextDirection.ltr,
      )..layout();
      h2oTextPainter.paint(canvas, Offset(cx + 20, beakerTop - 38));

      // Heat waves to indicate exothermic (pulsing)
      final double pulse = 2.0 * math.sin(angle * 4);
      final heatPaint = Paint()..color = Colors.orange.withOpacity(0.7);
      canvas.drawCircle(Offset(cx + 50, beakerTop - 35), 8 + pulse, heatPaint);
      for (int i = 0; i < 4; i++) {
        final double rayAngle = i * math.pi / 2 + angle * 0.2;
        canvas.drawLine(
          Offset(cx + 50 + (12 + pulse) * math.cos(rayAngle), beakerTop - 35 + (12 + pulse) * math.sin(rayAngle)),
          Offset(cx + 50 + (16 + pulse) * math.cos(rayAngle), beakerTop - 35 + (16 + pulse) * math.sin(rayAngle)),
          heatPaint..strokeWidth = 1.5,
        );
      }
      
      final titlePainter = TextPainter(
        text: TextSpan(
          text: "Combination Reaction (Exothermic)",
          style: TextStyle(
            color: isDark ? Colors.white70 : Colors.black87,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        textDirection: TextDirection.ltr,
      )..layout();
      titlePainter.paint(canvas, const Offset(20, 20));

    } else if (videoType == VideoType.scienceDecomposition) {
      final bool isDark = brightness == Brightness.dark;
      final cx = width / 2;
      final cy = height / 2;

      final tubePaint = Paint()
        ..color = isDark ? Colors.white24 : Colors.black12
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2;
      canvas.save();
      canvas.translate(cx + 15, cy - 20);
      canvas.rotate(0.5); 
      canvas.drawRRect(RRect.fromRectAndRadius(const Rect.fromLTWH(-15, -50, 30, 100), const Radius.circular(15)), tubePaint);
      canvas.restore();

      final burnerPaint = Paint()..color = const Color(0xFF64748B);
      final burnerBasePaint = Paint()..color = const Color(0xFF475569);
      canvas.drawRRect(RRect.fromRectAndRadius(Rect.fromLTWH(cx - 12, cy + 45, 24, 6), const Radius.circular(1.5)), burnerBasePaint);
      canvas.drawRRect(RRect.fromRectAndRadius(Rect.fromLTWH(cx - 7, cy + 10, 14, 35), const Radius.circular(2)), burnerPaint);
      
      // Animated flickering flame
      final flamePaint = Paint()..color = Colors.orange;
      final double flameW = 8.0 + 2.0 * math.sin(angle * 8);
      final double flameH = 26.0 + 4.0 * math.cos(angle * 6);
      final flamePath = Path()
        ..moveTo(cx, cy + 10)
        ..quadraticBezierTo(cx - flameW, cy - 6, cx, cy - flameH)
        ..quadraticBezierTo(cx + flameW, cy - 6, cx, cy + 10)
        ..close();
      canvas.drawPath(flamePath, flamePaint);

      // Draw gas bubbles/gas evolving from the boiling tube (animated)
      final gasPaint = Paint()
        ..color = isDark ? Colors.white30 : Colors.black26
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.0;
      final double bubbleProgress = (progress * 2) % 1.0;
      canvas.drawCircle(Offset(cx + 35 + bubbleProgress * 20, cy - 40 - bubbleProgress * 20), 3, gasPaint);
      canvas.drawCircle(Offset(cx + 25 + bubbleProgress * 30, cy - 30 - bubbleProgress * 15), 2, gasPaint);
      canvas.drawCircle(Offset(cx + 42 + bubbleProgress * 15, cy - 50 - bubbleProgress * 25), 2.5, gasPaint);

      final labelStyle = TextStyle(
        color: isDark ? Colors.white60 : Colors.black54,
        fontSize: 10,
        fontWeight: FontWeight.bold,
      );
      final tubeLabel = TextPainter(
        text: TextSpan(text: "CaCO₃", style: labelStyle),
        textDirection: TextDirection.ltr,
      )..layout();
      tubeLabel.paint(canvas, Offset(cx + 5, cy - 10));

      final heatLabel = TextPainter(
        text: TextSpan(text: "HEAT", style: TextStyle(color: Colors.orange, fontSize: 10, fontWeight: FontWeight.bold)),
        textDirection: TextDirection.ltr,
      )..layout();
      heatLabel.paint(canvas, Offset(cx - 40, cy + 15));

      final gasLabel = TextPainter(
        text: TextSpan(text: "CO₂ ↑", style: labelStyle),
        textDirection: TextDirection.ltr,
      )..layout();
      gasLabel.paint(canvas, Offset(cx + 60, cy - 60));

      final titlePainter = TextPainter(
        text: TextSpan(
          text: "Thermal Decomposition Reaction",
          style: TextStyle(
            color: isDark ? Colors.white70 : Colors.black87,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        textDirection: TextDirection.ltr,
      )..layout();
      titlePainter.paint(canvas, const Offset(20, 20));

    } else if (videoType == VideoType.scienceDisplacement) {
      final bool isDark = brightness == Brightness.dark;
      final cx = width / 2;
      final cy = height / 2;

      // Beaker outline
      final beakerPaint = Paint()
        ..color = isDark ? Colors.white24 : Colors.black12
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2;
      canvas.drawRRect(RRect.fromRectAndRadius(Rect.fromLTWH(cx - 35, cy - 30, 70, 90), const Radius.circular(8)), beakerPaint);

      // Animate blue to green solution (lerp color based on math.sin(angle))
      final double colorStage = (math.sin(angle * 0.5) + 1.0) / 2.0; // oscillates slowly
      final liquidColor = Color.lerp(Colors.blue.withOpacity(0.45), Colors.green.withOpacity(0.35), colorStage);
      final liquidPaint = Paint()
        ..color = liquidColor!
        ..style = PaintingStyle.fill;
      canvas.drawRRect(RRect.fromRectAndRadius(Rect.fromLTWH(cx - 33, cy + 5, 66, 52), const Radius.circular(6)), liquidPaint);

      // Iron nail swinging/dishing slowly (animated)
      final double swing = 3.0 * math.sin(angle * 1.5);
      final nailPaint = Paint()
        ..color = Color.lerp(const Color(0xFF78716C), Colors.brown.shade600, colorStage)!
        ..style = PaintingStyle.fill;
      
      canvas.save();
      canvas.translate(cx + swing, cy);
      canvas.drawRect(const Rect.fromLTWH(-5, -15, 10, 50), nailPaint);
      canvas.restore();

      final threadPaint = Paint()
        ..color = isDark ? Colors.white54 : Colors.black54
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1;
      canvas.drawLine(Offset(cx, cy - 60), Offset(cx + swing, cy - 15), threadPaint);

      // Labels based on chemical states
      final labelStyle = TextStyle(
        color: isDark ? Colors.white60 : Colors.black54,
        fontSize: 10,
        fontWeight: FontWeight.bold,
      );
      
      final nailLabel = TextPainter(
        text: TextSpan(text: colorStage < 0.5 ? "Iron Nail (Grey)" : "Coated Nail (Brown)", style: labelStyle),
        textDirection: TextDirection.ltr,
      )..layout();
      nailLabel.paint(canvas, Offset(cx + swing + 15, cy - 10));

      final solutionText = colorStage < 0.5 ? "CuSO₄ (Blue)" : "FeSO₄ (Green)";
      final solLabel = TextPainter(
        text: TextSpan(
          text: solutionText, 
          style: TextStyle(
            color: Color.lerp(Colors.blue, Colors.green.shade700, colorStage), 
            fontSize: 10, 
            fontWeight: FontWeight.bold,
          ),
        ),
        textDirection: TextDirection.ltr,
      )..layout();
      solLabel.paint(canvas, Offset(cx - 60, cy + 35));

      final titlePainter = TextPainter(
        text: TextSpan(
          text: "Displacement Reaction",
          style: TextStyle(
            color: isDark ? Colors.white70 : Colors.black87,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        textDirection: TextDirection.ltr,
      )..layout();
      titlePainter.paint(canvas, const Offset(20, 20));

    } else {
      // Catch-all empty canvas or default layout
      final paintBg = Paint()..color = Colors.transparent;
      canvas.drawPaint(paintBg);
    }
  }

  @override
  bool shouldRepaint(covariant WhiteboardPainter oldDelegate) => true;
}
