import 'package:flutter/material.dart';

class Surfer extends StatefulWidget {
  final Offset position;
  Surfer({required this.position});

  SurferState createState() => SurferState();
}

class SurferState extends State<Surfer> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Container(
        width: 400,
        height: 400,
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
      left: widget.position.dx,
      top: widget.position.dy,
    );
  }
}
