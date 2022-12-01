import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import '../constants.dart';

double ballRadius = 7.5;

class Giro extends StatefulWidget {
  const Giro({super.key});

  @override
  State<Giro> createState() => _GiroState();
}

class _GiroState extends State<Giro> {
  DateTime fechaSeleccionada = DateTime.now();

  double _angle = 0.0;
  double _oldAngle = 0.0;
  double _angleDelta = 0.0;
  final List<dynamic> datos = ['---', '---', '---', '---', '---', '---', '---'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Transform.rotate(
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
                              _angle = touchPositionFromCenter.direction +
                                  _angleDelta;
                            },
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
            Center(
                child: Container(
              width: kDiameter + 30,
              height: kDiameter + 30,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.transparent,
                    width: 20,
                    style: BorderStyle.solid,
                  ),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 30,
                        spreadRadius: 10,
                        color: Colors.blue.withAlpha(
                            normalize(0.5 * 20000, 100, 255).toInt()),
                        offset: Offset(1, 3))
                  ]),
              child: SleekCircularSlider(
                min: kMin,
                max: kMax,
                initialValue: Jiffy(fechaSeleccionada).dayOfYear.toDouble(),
                appearance: CircularSliderAppearance(
                    size: kDiameter - 150,
                    startAngle: 269,
                    angleRange: 360,
                    customColors: CustomSliderColors(
                      trackColor: Colors.red,
                      dotColor: azulUnab,
                      progressBarColor: Colors.transparent,
                      hideShadow: true,
                      dynamicGradient: true,
                    ),
                    spinnerMode: false),
                onChange: null,
                innerWidget: (value) => Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Builder(builder: (context) {
                          localeJiff();
                          //var fur = Jiffy(fechaJiffy).subtract();
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '${datos[1]}',
                                style: TextStyle(
                                    fontSize: 30, color: Colors.white),
                              ),
                              Text(
                                'Fecha probable de parto',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white70),
                              ),
                            ],
                          );
                        }),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        child: Builder(builder: (context) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '${datos[0]}',
                                style: TextStyle(
                                    fontSize: 30, color: Colors.white),
                              ),
                              Text(
                                'Edad Gestacional',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white70),
                              ),
                            ],
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }

  void localeJiff() async {
    await Jiffy.locale('es');
  }
}
