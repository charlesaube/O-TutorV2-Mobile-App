import 'dart:ui' as ui;
import 'dart:math' as math;

import 'dart:ui';

import 'package:flutter/cupertino.dart';

class AbstractShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;
    paint_0.shader = ui.Gradient.linear(
        Offset(0, size.height * 0.50),
        Offset(size.width * 0.55, size.height * 0.50),
        [Color(0xffff5050), Color(0xffffad40)],
        [0.00, 1.00]);

    Path path_0 = Path();
    path_0.moveTo(0, size.height);
    path_0.cubicTo(
        size.width * 0.0402800,
        size.height * 0.4487500,
        size.width * 0.2690600,
        size.height * 0.2550500,
        size.width * 0.3820000,
        size.height * 0.3556500);
    path_0.cubicTo(
        size.width * 0.5690000,
        size.height * 0.4970500,
        size.width * 0.6430000,
        size.height * -0.0079000,
        size.width * 0.8012600,
        0);
    path_0.quadraticBezierTo(
        size.width * 0.7015000, size.height * -0.0183500, 0, 0);
    path_0.quadraticBezierTo(0, size.height * 0.2500000, 0, size.height);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class AbstractShape2Painter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final degrees = 180;
    final radians = degrees * math.pi / 180;

    canvas.rotate(radians);

    Paint paint_0 = new Paint()
      ..color = Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;
    paint_0.shader = ui.Gradient.linear(
        Offset(0, size.height * 0.50),
        Offset(size.width * 0.55, size.height * 0.50),
        [Color(0xffff5050), Color(0xffffad40)],
        [0.00, 1.00]);

    Path path_0 = Path();
    path_0.moveTo(0, size.height);
    path_0.cubicTo(
        size.width * 0.0402800,
        size.height * 0.4487500,
        size.width * 0.2690600,
        size.height * 0.2550500,
        size.width * 0.3820000,
        size.height * 0.3556500);
    path_0.cubicTo(
        size.width * 0.5690000,
        size.height * 0.4970500,
        size.width * 0.6430000,
        size.height * -0.0079000,
        size.width * 0.8012600,
        0);
    path_0.quadraticBezierTo(
        size.width * 0.7015000, size.height * -0.0183500, 0, 0);
    path_0.quadraticBezierTo(0, size.height * 0.2500000, 0, size.height);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}