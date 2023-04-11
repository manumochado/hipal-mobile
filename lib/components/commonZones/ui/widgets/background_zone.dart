import 'dart:ui' as ui;
import 'dart:ui';

import 'package:flutter/material.dart';

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.5041208, size.height * 0.9985063);
    path_0.cubicTo(
        size.width * 0.3202222,
        size.height * 0.9985063,
        size.width * 0.1481739,
        size.height * 0.9527421,
        size.width * 0.001209302,
        size.height * 0.8731541);
    path_0.lineTo(size.width * 0.001209302, size.height * 0.0005241101);
    path_0.lineTo(size.width * 0.9997923, size.height * 0.0005241101);
    path_0.lineTo(size.width * 0.9997923, size.height * 0.8770377);
    path_0.cubicTo(
        size.width * 0.8544300,
        size.height * 0.9542296,
        size.width * 0.6850097,
        size.height * 0.9985063,
        size.width * 0.5041208,
        size.height * 0.9985063);
    path_0.close();

    Paint paint_0_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0008051522;
    paint_0_stroke.color = Colors.black.withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_stroke);

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Colors.white.withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.0008067246, 0);
    path_1.lineTo(size.width * 0.0008067246, size.height * 0.8735031);
    path_1.cubicTo(
        size.width * 0.1478773,
        size.height * 0.9532013,
        size.width * 0.3200676,
        size.height * 0.9990314,
        size.width * 0.5041208,
        size.height * 0.9990314);
    path_1.cubicTo(
        size.width * 0.6851643,
        size.height * 0.9990314,
        size.width * 0.8547271,
        size.height * 0.9546887,
        size.width * 1.000196,
        size.height * 0.8773899);
    path_1.lineTo(size.width * 1.000196, 0);
    path_1.lineTo(size.width * 0.0008067246, 0);
    path_1.close();

    Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.shader = ui.Gradient.linear(
        Offset(size.width * 0.5005024, size.height * 0.8),
        Offset(size.width * 0.5005024, size.height * 0.2),
        [Color(0xFF8639D8).withOpacity(1), Color(0xFF6456EB).withOpacity(1)],
        [0, 1]);
    canvas.drawPath(path_1, paint_1_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
