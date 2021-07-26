import 'package:flutter/material.dart';

class Clouds extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: Image.asset(
            'assets/images/cloud_1.png',
            scale: 0.7,
          ),
          top: 190,
          left: -30,
        ),
        Positioned(
          child: Image.asset(
            'assets/images/cloud_2.png',
            scale: 0.8,
          ),
          top: 280,
          right: -70,
        ),
      ],
    );
  }
}
