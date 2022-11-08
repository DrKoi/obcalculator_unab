import 'package:flutter/material.dart';
import 'package:ob_calculator/constants.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import '../widgets/custom_draw.dart';

class DiscoPage extends StatefulWidget {
  const DiscoPage({super.key});

  @override
  State<DiscoPage> createState() => _DiscoPageState();
}

class _DiscoPageState extends State<DiscoPage> {
  double progressVal = 0.5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(children: [
          ShaderMask(
            shaderCallback: ((rect) {
              return SweepGradient(
                      startAngle: degToRad(0),
                      endAngle: degToRad(184),
                      stops: [progressVal, progressVal],
                      colors: [Colors.red.shade200, Colors.grey.withAlpha(50)],
                      transform: GradientRotation(degToRad(170)))
                  .createShader(rect);
            }),
            child: Center(
              child: CustomArc(),
            ),
          ),
          Center(
              child: Container(
            width: kDiameter - 30,
            height: kDiameter - 30,
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                  width: 20,
                  style: BorderStyle.solid,
                ),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 30,
                      spreadRadius: 10,
                      color: Colors.blue.withAlpha(
                          normalize(progressVal * 20000, 100, 255).toInt()),
                      offset: Offset(1, 3))
                ]),
            child: SleekCircularSlider(
              min: kMin,
              max: kMax,
              initialValue: 1,
              appearance: CircularSliderAppearance(
                  size: kDiameter - 150,
                  startAngle: 268,
                  angleRange: 360,
                  customColors: CustomSliderColors(
                    dotColor: Colors.red,
                    progressBarColor: Colors.transparent,
                    hideShadow: true,
                    dynamicGradient: true,
                  ),
                  spinnerMode: false),
              onChange: (double value) {
                print(value);
              },
              innerWidget: (percentage) => Center(
                child: Text(
                  '${percentage.toInt()} días',
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
          ))
          /* SleekCircularSlider(
            innerWidget: (percentage) => Center(
              child: Text('${percentage.toInt()}'),
            ),
            min: 1,
            max: 365,
            initialValue: 1,
            appearance: CircularSliderAppearance(
                startAngle: 268,
                angleRange: 360,
                size: 400,
                customColors: CustomSliderColors(
                  dotColor: Colors.red,
                  progressBarColor: Colors.transparent,
                  hideShadow: true,
                  dynamicGradient: true,
                ),
                spinnerMode: false),
            onChange: (double value) {
              print(value);
            },
          ), */
        ]),
      ),
    );
  }
}
