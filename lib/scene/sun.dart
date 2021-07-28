import 'package:flutter/widgets.dart';

class Sun extends CustomPainter {
  final double _size = 100.0;
  final Offset _position = Offset(150, 200);
  final Paint _paint = Paint()..color = Color(0xFFFDC099);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(_position, _size, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
