import 'dart:math';

import 'package:flutter/material.dart';
import 'surfer/surfer.dart';
import 'scene/scene.dart';
import 'package:vector_math/vector_math.dart' as Vector;

const _BREATH_IN_DURATION = Duration(seconds: 3);
const yOffset = 50;
const xOffset = 0;
const frequency = 1;

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late Size _size;
  late AnimationController _breathAnimationController;
  late Animation _positionAnimation;
  List<Offset> animList1 = [];

  @override
  void didChangeDependencies() {
    _size = MediaQuery.of(context).size;
    super.didChangeDependencies();
  }

  @override
  void initState() {
    _breathAnimationController =
        AnimationController(duration: _BREATH_IN_DURATION, vsync: this);

    _breathAnimationController.addListener(() {
      animList1.clear();
      for (int i = -2 - xOffset; i <= _size.width.toInt() + 2; i++) {
        animList1.add(new Offset(
            i.toDouble() + xOffset,
            sin((_breathAnimationController.value * 360 - i) %
                        360 *
                        Vector.degrees2Radians *
                        frequency) *
                    20 +
                yOffset));
      }
    });
    _breathAnimationController.repeat();

    // _positionAnimation =
    //     IntTween(begin: 400, end: 600).animate(_breathAnimationController)
    //       ..addListener(() {
    //         setState(() {});
    //       })
    //       ..addStatusListener((status) {
    //         if (status == AnimationStatus.completed) {
    //           _breathAnimationController.repeat(reverse: true);
    //         }
    //       });
    // ;

    // _breathAnimationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scene(
        // child: Surfer(
        //   position: Offset(
        //     130,
        //     _positionAnimation.value.toDouble(),
        //   ),
        // ),
        // child: CustomPaint(
        //   painter: Painter(circleRadius: _sizeAnimation.value.toDouble()),
        child: Container(
          alignment: Alignment.bottomCenter,
          child: AnimatedBuilder(
            animation: CurvedAnimation(
              parent: _breathAnimationController,
              curve: Curves.easeInOut,
            ),
            builder: (context, child) => ClipPath(
              child: Container(
                width: _size.width,
                height: _size.height / 2,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    // Add one stop for each color. Stops should increase from 0 to 1
                    stops: [0, 1],
                    colors: [
                      const Color(0xFF93C5FD),
                      const Color(0xFF3B82F6),
                    ],
                  ),
                ),
              ),
              clipper:
                  new WaveClipper(_breathAnimationController.value, animList1),
            ),
          ),
        ),
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  final double animation;

  List<Offset> waveList1 = [];

  WaveClipper(this.animation, this.waveList1);

  @override
  Path getClip(Size size) {
    Path path = new Path();

    path.addPolygon(waveList1, false);

    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(WaveClipper oldClipper) =>
      animation != oldClipper.animation;
}
