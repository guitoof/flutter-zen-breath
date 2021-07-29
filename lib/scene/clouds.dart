import 'package:flutter/material.dart';

class Clouds extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cloud1Position =
        Offset(-30, MediaQuery.of(context).size.height * 0.25);
    final cloud1Scale = 0.7;
    final cloud2Position =
        Offset(-70, MediaQuery.of(context).size.height * 0.35);
    final cloud2Scale = 0.8;

    return Stack(
      children: [
        Positioned(
          child: Image.asset(
            'assets/images/cloud_1.png',
            scale: cloud1Scale,
          ),
          top: cloud1Position.dy,
          left: cloud1Position.dx,
        ),
        Positioned(
          child: Image.asset(
            'assets/images/cloud_2.png',
            scale: cloud2Scale,
          ),
          top: cloud2Position.dy,
          right: cloud2Position.dx,
        ),
      ],
    );
  }
}
