import 'package:flutter/material.dart';

class Surfer extends StatelessWidget {
  final Offset position;

  Surfer({required this.position});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Image.asset('assets/images/surfer.png', scale: 2),
      left: position.dx,
      top: position.dy,
    );
  }
}
