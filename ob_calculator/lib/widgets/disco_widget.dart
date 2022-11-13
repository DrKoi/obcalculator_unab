import 'package:flutter/material.dart';
import 'package:ob_calculator/constants.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class disco extends StatelessWidget {
  const disco({
    Key? key,
    required this.progressVal,
  }) : super(key: key);

  final double progressVal;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Stack(children: [
        //Center(child: CustomArc()),
        Center(
          child: Image(
              width: kDiameter + 100,
              fit: BoxFit.cover,
              image: AssetImage('assets/Circular_calendar.png')),
        ),
        Center(
            child: Container(
          width: kDiameter * 0.9,
          height: kDiameter * 0.9,
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
                        normalize(progressVal * 20000, 100, 255).toInt()),
                    offset: Offset(1, 3))
              ]),
          child: SleekCircularSlider(
            //onChangeStart: ,
            //onChangeEnd: ,
            min: kMin,
            max: kMax,
            initialValue: 1,
            appearance: CircularSliderAppearance(
                size: kDiameter - 150,
                startAngle: 269,
                angleRange: 360,
                customColors: CustomSliderColors(
                  dotColor: Colors.red,
                  progressBarColor: Colors.transparent,
                  hideShadow: true,
                  dynamicGradient: true,
                ),
                spinnerMode: false),
            onChange: (double value) {
              //var fecha = value.toInt();

              print(value);
            },
            innerWidget: (value) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${value.toInt()} días',
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                        Text(
                          'Fecha probable de parto',
                          style: TextStyle(fontSize: 10, color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${value.toInt()} días',
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                        Text(
                          'Fecha última regla',
                          style: TextStyle(fontSize: 10, color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ))
      ]),
    );
  }
}
