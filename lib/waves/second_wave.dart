import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class SecondWave extends StatelessWidget {
  final Offset position;

  SecondWave({required this.position});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: CustomPaint(
        painter: SecondWavePainter(),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),
      ),
      left: position.dx / 2,
      top: position.dy / 2,
    );
  }
}

class SecondWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..strokeWidth = 5
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round
      ..shader = ui.Gradient.linear(
        Offset(size.width / 2, 7 * size.height / 10),
        Offset(size.width / 2, size.height),
        [
          const Color(0xFF93C5FD),
          const Color(0xFF3B82F6),
        ],
      );

    var xnorm = size.width / 4;
    var ynorm = size.height / 18;

    var path = Path();
    path.moveTo(0, 15.5 * ynorm);

    path.relativeCubicTo(
      xnorm,
      0,
      1.5 * xnorm,
      -1.5 * ynorm,
      2.5 * xnorm,
      -1.5 * ynorm,
    );
    path.relativeCubicTo(
      1 * xnorm,
      0,
      1.5 * xnorm,
      1.5 * ynorm,
      2.5 * xnorm,
      1.5 * ynorm,
    );
    path.lineTo(5 * xnorm, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 6.66 * ynorm);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
