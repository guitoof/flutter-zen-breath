import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Sun extends StatelessWidget {
  final double _size = 150.0;

  @override
  Widget build(BuildContext context) {
    final position = Offset(MediaQuery.of(context).size.width * 0.1,
        MediaQuery.of(context).size.height * 0.1);

    return Positioned(
      top: position.dy,
      left: position.dx,
      child: Container(
        width: _size,
        height: _size,
        decoration:
            BoxDecoration(color: Color(0xFFFDC099), shape: BoxShape.circle),
      ),
    );
  }
}
