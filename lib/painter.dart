import 'package:flutter/widgets.dart';

class Painter extends CustomPainter {
  final double circleRadius;

  Painter({required this.circleRadius});

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(Offset.zero, circleRadius, Paint());
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
