import 'package:flutter/material.dart';

const _BREATH_IN_DURATION = Duration(seconds: 4);
const _BREATH_OUT_DURATION = Duration(seconds: 6);

class BreathInTextAnimation extends StatefulWidget {
  BreathInTextAnimation({Key? key}) : super(key: key);

  @override
  _BreathInTextAnimationState createState() => _BreathInTextAnimationState();
}

class _BreathInTextAnimationState extends State<BreathInTextAnimation>
    with TickerProviderStateMixin {
  late AnimationController _breathInAnimationController;
  late AnimationController _breathOutAnimationController;

  late Animation _breathInAnimation;
  late Animation _breathOutAnimation;

  @override
  void initState() {
    _breathInAnimationController =
        AnimationController(duration: _BREATH_IN_DURATION, vsync: this);
    _breathOutAnimationController =
        AnimationController(duration: _BREATH_OUT_DURATION, vsync: this);

    _breathInAnimation =
        IntTween(begin: 0, end: 1).animate(_breathInAnimationController)
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _breathInAnimationController.repeat();
            } else if (status == AnimationStatus.dismissed) {
              _breathInAnimationController.forward();
            }
          });

    _breathOutAnimation =
        IntTween(begin: 0, end: 1).animate(_breathOutAnimationController)
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _breathOutAnimationController.repeat();
            } else if (status == AnimationStatus.dismissed) {
              _breathOutAnimationController.forward();
            }
          });
    _breathInAnimationController.forward();
    _breathOutAnimationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Positioned(
      child: RichText(
        text: TextSpan(
          text: 'inspirez',
          style: TextStyle(
              fontFamily: 'Poppins',
              color: Colors.white.withOpacity(0.6),
              fontSize: 24),
        ),
      ),
      left: MediaQuery.of(context).size.width / 2,
      top: MediaQuery.of(context).size.height,
    ));
  }
}
