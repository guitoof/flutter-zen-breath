import 'package:flutter/material.dart';
import 'scene/background.dart';

import 'painter.dart';

const _BREATH_IN_DURATION = Duration(seconds: 3);

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _breathAnimationController;
  late Animation _sizeAnimation;

  @override
  void initState() {
    _breathAnimationController =
        AnimationController(duration: _BREATH_IN_DURATION, vsync: this);

    _sizeAnimation =
        IntTween(begin: 90, end: 150).animate(_breathAnimationController)
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _breathAnimationController.repeat(reverse: true);
            }
          });
    ;

    _breathAnimationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: Center(
          child: CustomPaint(
            painter: Painter(circleRadius: _sizeAnimation.value.toDouble()),
          ),
        ),
      ),
    );
  }
}
