import 'package:flutter/material.dart';
import 'package:flutter_zen_breath/scene/clouds.dart';
import 'package:flutter_zen_breath/scene/sky.dart';
import 'package:flutter_zen_breath/scene/sun.dart';

class Scene extends StatelessWidget {
  final Widget child;

  Scene({required this.child});

  @override
  Widget build(BuildContext context) {
    return Sky(
      child: Stack(
        children: [
          CustomPaint(
            painter: Sun(),
            child: child,
          ),
          Clouds(),
        ],
      ),
    );
  }
}
