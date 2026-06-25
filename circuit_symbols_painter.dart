class CircuitSymbolsPainter extends CustomPainter {
  final bool isDark;
  CircuitSymbolsPainter({required this.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = isDark ? Colors.white : Colors.black
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;
    final fillPaint = Paint()
      ..color = isDark ? Colors.white : Colors.black
      ..style = PaintingStyle.fill;
    
    final textPainter = TextPainter(
      textAlign: TextAlign.left,
      textDirection: TextDirection.ltr,
    );

    void drawText(String text, Offset offset) {
      textPainter.text = TextSpan(
        text: text,
        style: TextStyle(
          color: isDark ? Colors.white : Colors.black,
          fontSize: 12,
          fontFamily: 'Outfit'
        ),
      );
      textPainter.layout();
      textPainter.paint(canvas, offset);
    }

    double col1 = 5;
    double col2 = 120;
    double col3 = size.width / 2 + 5;
    double col4 = size.width / 2 + 120;
    
    double y = 10;
    
    // Electric cell
    drawText("Electric Cell", Offset(col1, y));
    canvas.drawLine(Offset(col2, y+10), Offset(col2+15, y+10), paint);
    canvas.drawLine(Offset(col2+15, y+0), Offset(col2+15, y+20), paint);
    canvas.drawLine(Offset(col2+22, y+5), Offset(col2+22, y+15), paint..strokeWidth = 3);
    canvas.drawLine(Offset(col2+22, y+10), Offset(col2+40, y+10), paint..strokeWidth = 1.5);
    drawText("+", Offset(col2+5, y-8));
    drawText("-", Offset(col2+25, y-8));
    
    // Battery
    drawText("Battery", Offset(col3, y));
    double bx = col4;
    for(int i=0; i<3; i++) {
        canvas.drawLine(Offset(bx, y+10), Offset(bx+5, y+10), paint);
        canvas.drawLine(Offset(bx+5, y+0), Offset(bx+5, y+20), paint);
        canvas.drawLine(Offset(bx+12, y+5), Offset(bx+12, y+15), paint..strokeWidth = 3);
        canvas.drawLine(Offset(bx+12, y+10), Offset(bx+17, y+10), paint..strokeWidth=1.5);
        bx += 17;
    }
    drawText("+", Offset(col4+0, y-8));
    drawText("-", Offset(bx-10, y-8));
    
    y += 40;
    
    // Plug key (open)
    drawText("Plug Key (Open)", Offset(col1, y));
    canvas.drawLine(Offset(col2, y+10), Offset(col2+10, y+10), paint);
    canvas.drawArc(Rect.fromCircle(center: Offset(col2+15, y+10), radius: 5), 1.57, 3.14, false, paint);
    canvas.drawArc(Rect.fromCircle(center: Offset(col2+25, y+10), radius: 5), -1.57, 3.14, false, paint);
    canvas.drawLine(Offset(col2+30, y+10), Offset(col2+40, y+10), paint);
    
    // Plug key (closed)
    drawText("Plug Key (Closed)", Offset(col3, y));
    canvas.drawLine(Offset(col4, y+10), Offset(col4+10, y+10), paint);
    canvas.drawArc(Rect.fromCircle(center: Offset(col4+15, y+10), radius: 5), 1.57, 3.14, false, paint);
    canvas.drawArc(Rect.fromCircle(center: Offset(col4+25, y+10), radius: 5), -1.57, 3.14, false, paint);
    canvas.drawLine(Offset(col4+30, y+10), Offset(col4+40, y+10), paint);
    canvas.drawCircle(Offset(col4+20, y+10), 2, fillPaint);
    
    y += 40;
    
    // Wire joint
    drawText("Wire Joint", Offset(col1, y));
    canvas.drawLine(Offset(col2, y+10), Offset(col2+40, y+10), paint);
    canvas.drawLine(Offset(col2+20, y+10), Offset(col2+20, y-5), paint);
    canvas.drawCircle(Offset(col2+20, y+10), 2.5, fillPaint);

    // Wires crossing without joining
    drawText("Crossing Wires", Offset(col3, y));
    canvas.drawLine(Offset(col4, y+10), Offset(col4+40, y+10), paint);
    canvas.drawLine(Offset(col4+20, y+25), Offset(col4+20, y+15), paint);
    canvas.drawArc(Rect.fromCircle(center: Offset(col4+20, y+10), radius: 5), 3.14, 3.14, false, paint);
    canvas.drawLine(Offset(col4+20, y+5), Offset(col4+20, y-5), paint);

    y += 40;
    
    // Electric Bulb
    drawText("Electric Bulb", Offset(col1, y));
    canvas.drawLine(Offset(col2, y+10), Offset(col2+12, y+10), paint);
    canvas.drawLine(Offset(col2+28, y+10), Offset(col2+40, y+10), paint);
    Path bulbPath = Path()
      ..moveTo(col2+12, y+10)
      ..quadraticBezierTo(col2+15, y-5, col2+20, y-5)
      ..quadraticBezierTo(col2+25, y-5, col2+28, y+10);
    canvas.drawPath(bulbPath, paint);
    canvas.drawCircle(Offset(col2+20, y+5), 12, paint);

    // Resistor
    drawText("Resistor", Offset(col3, y));
    canvas.drawLine(Offset(col4, y+10), Offset(col4+5, y+10), paint);
    double rx = col4+5;
    for(int i=0; i<3; i++) {
        canvas.drawLine(Offset(rx, y+10), Offset(rx+2.5, y+0), paint);
        canvas.drawLine(Offset(rx+2.5, y+0), Offset(rx+7.5, y+20), paint);
        canvas.drawLine(Offset(rx+7.5, y+20), Offset(rx+10, y+10), paint);
        rx += 10;
    }
    canvas.drawLine(Offset(rx, y+10), Offset(rx+5, y+10), paint);

    y += 40;

    // Rheostat
    drawText("Rheostat", Offset(col1, y));
    canvas.drawLine(Offset(col2, y+10), Offset(col2+5, y+10), paint);
    rx = col2+5;
    for(int i=0; i<3; i++) {
        canvas.drawLine(Offset(rx, y+10), Offset(rx+2.5, y+0), paint);
        canvas.drawLine(Offset(rx+2.5, y+0), Offset(rx+7.5, y+20), paint);
        canvas.drawLine(Offset(rx+7.5, y+20), Offset(rx+10, y+10), paint);
        rx += 10;
    }
    canvas.drawLine(Offset(rx, y+10), Offset(rx+5, y+10), paint);
    canvas.drawLine(Offset(col2+10, y+20), Offset(col2+20, y-2), paint);
    canvas.drawLine(Offset(col2+20, y-2), Offset(col2+17, y+2), paint);
    canvas.drawLine(Offset(col2+20, y-2), Offset(col2+23, y+2), paint);

    // Ammeter
    drawText("Ammeter", Offset(col3, y));
    canvas.drawLine(Offset(col4, y+10), Offset(col4+10, y+10), paint);
    canvas.drawCircle(Offset(col4+20, y+10), 10, paint);
    drawText("A", Offset(col4+16, y+2));
    canvas.drawLine(Offset(col4+30, y+10), Offset(col4+40, y+10), paint);
    drawText("+", Offset(col4+2, y-8));
    drawText("-", Offset(col4+32, y-8));

    y += 40;

    // Voltmeter
    drawText("Voltmeter", Offset(col1, y));
    canvas.drawLine(Offset(col2, y+10), Offset(col2+10, y+10), paint);
    canvas.drawCircle(Offset(col2+20, y+10), 10, paint);
    drawText("V", Offset(col2+16, y+2));
    canvas.drawLine(Offset(col2+30, y+10), Offset(col2+40, y+10), paint);
    drawText("+", Offset(col2+2, y-8));
    drawText("-", Offset(col2+32, y-8));

  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
