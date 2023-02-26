import 'package:flutter/material.dart';
import 'dart:math';

import 'package:jiffy/jiffy.dart';

class YearWheel extends StatefulWidget {
  @override
  _YearWheelState createState() => _YearWheelState();
}

class _YearWheelState extends State<YearWheel> {
  double _angle = 0;
  int _selectedDay = 1;
  DateTime hoy = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
        angle: _angle,
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onPanUpdate: (details) {
            setState(() {
              _angle += details.delta.dx / 30;
              _selectedDay = (_angle / (2 * pi) * 365).round() % 365 + 1;
              print(_selectedDay);
              //print(Jiffy(hoy.year,).add(days: _selectedDay).format("dd-MM-yyyy"));
            });
          },
          child: Image.asset(
            "assets/Circular_calendar1.png",
            height: MediaQuery.of(context).size.width * 1.5,
          ),
        ));
  }
}
