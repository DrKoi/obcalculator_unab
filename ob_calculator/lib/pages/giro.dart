import 'package:flutter/material.dart';

double ballRadius = 7.5;

class Giro extends StatefulWidget {
  const Giro({super.key});

  @override
  State<Giro> createState() => _GiroState();
}

class _GiroState extends State<Giro> {
  double _angle = 0.0;
  double _oldAngle = 0.0;
  double _angleDelta = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Transform.rotate(
              angle: _angle,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/Circular_calendar1.png')),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    Offset centerOfGestureDetector =
                        Offset(constraints.maxWidth / 2, 130);
                    return GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onPanStart: (details) {
                        final touchPositionFromCenter =
                            details.localPosition - centerOfGestureDetector;
                        _angleDelta =
                            _oldAngle - touchPositionFromCenter.direction;
                      },
                      onPanEnd: (details) {
                        setState(
                          () {
                            _oldAngle = _angle;
                          },
                        );
                      },
                      onPanUpdate: (details) {
                        final touchPositionFromCenter =
                            details.localPosition - centerOfGestureDetector;

                        setState(
                          () {
                            _angle =
                                touchPositionFromCenter.direction + _angleDelta;
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
