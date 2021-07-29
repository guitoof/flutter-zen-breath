import 'package:flutter/material.dart';
import 'package:flutter_zen_breath/wave.dart';
import 'surfer/surfer.dart';
import 'scene/scene.dart';

const _BREATH_IN_DURATION = Duration(seconds: 10);

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _breathAnimationController;
  late Animation _positionAnimation1;
  late Animation _positionAnimation2;

  @override
  void initState() {
    _breathAnimationController =
        AnimationController(duration: _BREATH_IN_DURATION, vsync: this);

    _positionAnimation1 =
        IntTween(begin: 0, end: -1025).animate(_breathAnimationController)
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _breathAnimationController.repeat();
            } else if (status == AnimationStatus.dismissed) {
              _breathAnimationController.forward();
            }
          });

    _positionAnimation2 =
        IntTween(begin: 1025, end: 0).animate(_breathAnimationController)
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _breathAnimationController.repeat();
            } else if (status == AnimationStatus.dismissed) {
              _breathAnimationController.forward();
            }
          });

    _breathAnimationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Scene(
            child: Stack(
      children: [
        Wave(
          position: Offset(
            _positionAnimation1.value.toDouble(),
            0,
          ),
        ),
        Wave(
          position: Offset(
            _positionAnimation2.value.toDouble(),
            0,
          ),
        )
      ],
    )

            // child: Surfer(
            //   position: Offset(
            //     130,
            //     _positionAnimation.value.toDouble(),
            //   ),
            // ),
            // child: CustomPaint(
            //   painter: Painter(circleRadius: _sizeAnimation.value.toDouble()),
            ));
  }
}
