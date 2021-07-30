import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart';

class Surfer extends StatefulWidget {
  final Offset position;
  Surfer({required this.position});

  SurferState createState() => SurferState();
}

class SurferState extends State<Surfer> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _tiltAnimation;

  @override
  void initState() {
    _animationController =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);

    _tiltAnimation = IntTween(begin: 0, end: 20).animate(_animationController)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _animationController.repeat(reverse: true);
        }
      });

    _animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Container(
        width: 400,
        height: 400,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              child:
                  Image.asset('assets/images/surfer/surfer_body.png', scale: 2),
            ),
            Positioned(
              top: -103,
              left: 0,
              child: Transform.rotate(
                angle: _tiltAnimation.value * degrees2Radians,
                child: Image.asset(
                    'assets/images/surfer/surfer_head_louisz.png',
                    scale: 2),
              ),
            )
          ],
        ),
      ),
      left: widget.position.dx,
      top: widget.position.dy,
    );
  }
}
