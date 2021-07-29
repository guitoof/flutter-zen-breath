import 'package:flutter/material.dart';
import 'package:flutter_zen_breath/waves/principal_wave.dart';
import 'package:flutter_zen_breath/waves/second_wave.dart';
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
  late Animation _principalWaveAnimation1;
  late Animation _principalWaveAnimation2;
  late Animation _secondWaveAnimation1;
  late Animation _secondWaveAnimation2;

  @override
  void initState() {
    _breathAnimationController =
        AnimationController(duration: _BREATH_IN_DURATION, vsync: this);

    _principalWaveAnimation1 =
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

    _principalWaveAnimation2 =
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

    _secondWaveAnimation1 =
        IntTween(begin: -250, end: -1275).animate(_breathAnimationController)
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

    _secondWaveAnimation2 =
        IntTween(begin: 775, end: -250).animate(_breathAnimationController)
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
        PrincipalWave(
          position: Offset(
            _principalWaveAnimation1.value.toDouble(),
            0,
          ),
        ),
        PrincipalWave(
          position: Offset(
            _principalWaveAnimation2.value.toDouble(),
            0,
          ),
        ),
        SecondWave(
          position: Offset(
            _secondWaveAnimation1.value.toDouble(),
            0,
          ),
        ),
        SecondWave(
          position: Offset(
            _secondWaveAnimation2.value.toDouble(),
            0,
          ),
        ),
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
