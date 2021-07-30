import 'package:flutter/material.dart';

class Surfer extends StatelessWidget {
  final Offset position;

  Surfer({required this.position});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Container(
        width: 400,
        height: 400,
        // alignment: Alignment.center,
        child: Stack(
          overflow: Overflow.visible,
          children: [
            Positioned(
              child:
                  Image.asset('assets/images/surfer/surfer_body.png', scale: 2),
            ),
            Positioned(
              top: -110,
              left: -10,
              child: Image.asset('assets/images/surfer/surfer_head_louisz.png',
                  scale: 2),
            )
          ],
        ),
      ),
      left: position.dx,
      top: position.dy,
    );
  }
}
