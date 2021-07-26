import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;

  Background({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          // Add one stop for each color. Stops should increase from 0 to 1
          stops: [0, 0.5, 1],
          colors: [
            const Color(0xFFFA9782),
            const Color(0xFFFDC099),
            const Color(0xFFFDC099),
          ],
        ),
      ),
      child: child,
    );
  }
}
