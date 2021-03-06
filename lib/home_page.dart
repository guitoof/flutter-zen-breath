import 'package:flutter/material.dart';
import 'package:flutter_zen_breath/waves/principal_wave.dart';
import 'package:flutter_zen_breath/waves/second_wave.dart';
import 'package:flutter_zen_breath/waves/third_wave.dart';
import 'surfer/surfer.dart';
import 'scene/scene.dart';

const _BREATH_IN_DURATION = Duration(seconds: 10);

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _breathAnimationController;
  late AnimationController _foregroundWave1AnimationController;
  late AnimationController _foregroundWave2AnimationController;
  late AnimationController _surferAnimationController;
  late Animation _principalWaveAnimation1;
  late Animation _principalWaveAnimation2;
  late Animation _secondWaveAnimation1;
  late Animation _secondWaveAnimation2;
  late Animation _thirdWaveAnimation1;
  late Animation _thirdWaveAnimation2;
  late Animation _surferAnimation;

  @override
  void initState() {
    _breathAnimationController =
        AnimationController(duration: _BREATH_IN_DURATION, vsync: this);
    _foregroundWave1AnimationController =
        AnimationController(duration: _BREATH_IN_DURATION * 0.6, vsync: this);
    _foregroundWave2AnimationController =
        AnimationController(duration: _BREATH_IN_DURATION * 1.3, vsync: this);
    _surferAnimationController =
        AnimationController(duration: _BREATH_IN_DURATION * 0.5, vsync: this);

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

    _secondWaveAnimation1 = IntTween(begin: -250, end: -1275)
        .animate(_foregroundWave1AnimationController)
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _foregroundWave1AnimationController.repeat();
            } else if (status == AnimationStatus.dismissed) {
              _foregroundWave1AnimationController.forward();
            }
          });

    _secondWaveAnimation2 = IntTween(begin: 775, end: -250)
        .animate(_foregroundWave1AnimationController)
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _foregroundWave1AnimationController.repeat();
            } else if (status == AnimationStatus.dismissed) {
              _foregroundWave1AnimationController.forward();
            }
          });

    _thirdWaveAnimation1 = IntTween(begin: -750, end: -1775)
        .animate(_foregroundWave2AnimationController)
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _foregroundWave2AnimationController.repeat();
            } else if (status == AnimationStatus.dismissed) {
              _foregroundWave2AnimationController.forward();
            }
          });

    _thirdWaveAnimation2 = IntTween(begin: 275, end: -750)
        .animate(_foregroundWave2AnimationController)
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _foregroundWave2AnimationController.repeat();
            } else if (status == AnimationStatus.dismissed) {
              _foregroundWave2AnimationController.forward();
            }
          });

    _surferAnimation =
        IntTween(begin: 370, end: 610).animate(_surferAnimationController)
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _surferAnimationController.repeat(reverse: true);
            } else if (status == AnimationStatus.dismissed) {
              _surferAnimationController.forward();
            }
          });

    _breathAnimationController.forward();
    _foregroundWave1AnimationController.forward();
    _foregroundWave2AnimationController.forward();
    _surferAnimationController.forward();
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
            Surfer(
              position: Offset(
                170,
                _surferAnimation.value.toDouble(),
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
            ThirdWave(
              position: Offset(
                _thirdWaveAnimation1.value.toDouble(),
                0,
              ),
            ),
            ThirdWave(
                position: Offset(
              _thirdWaveAnimation2.value.toDouble(),
              0,
            ))
          ],
        ),
      ),
    );
  }
}
