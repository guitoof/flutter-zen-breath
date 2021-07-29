import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class Wave extends StatelessWidget {
  final Offset position;

  Wave({required this.position});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: CustomPaint(
        painter: WavePainter(),
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

class WavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..strokeWidth = 5
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round
      ..shader = ui.Gradient.linear(
        Offset(size.width / 2, 0),
        Offset(size.width / 2, size.height),
        [
          const Color(0xFF93C5FD),
          const Color(0xFF3B82F6),
        ],
      );

    var xnorm = size.width / 4;
    var ynorm = size.height / 12;

    var path = Path();
    path.moveTo(0, 9 * ynorm);

    // EXPIRATION + LONGUE
    path.relativeCubicTo(
      xnorm,
      0,
      1 * xnorm,
      -3 * ynorm,
      2 * xnorm,
      -3 * ynorm,
    );
    path.relativeCubicTo(
      1 * xnorm,
      0,
      2 * xnorm,
      3 * ynorm,
      3 * xnorm,
      3 * ynorm,
    );

    path.lineTo(5 * xnorm, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 6.66 * ynorm);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

    // SYMETRIQUE
    // path.relativeCubicTo(
    //   xnorm,
    //   0,
    //   1.5 * xnorm,
    //   -3 * ynorm,
    //   2.5 * xnorm,
    //   -3 * ynorm,
    // );
    // path.relativeCubicTo(
    //   1 * xnorm,
    //   0,
    //   1.5 * xnorm,
    //   3 * ynorm,
    //   2.5 * xnorm,
    //   3 * ynorm,
    // );

    // INSPIRATION + LONGUE
    // path.relativeCubicTo(
    //   xnorm,
    //   0,
    //   2 * xnorm,
    //   -3 * ynorm,
    //   3 * xnorm,
    //   -3 * ynorm,
    // );
    // path.relativeCubicTo(
    //   1 * xnorm,
    //   0,
    //   1 * xnorm,
    //   3 * ynorm,
    //   2 * xnorm,
    //   3 * ynorm,
    // );
