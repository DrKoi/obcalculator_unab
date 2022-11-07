import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class DiscoPage extends StatefulWidget {
  const DiscoPage({super.key});

  @override
  State<DiscoPage> createState() => _DiscoPageState();
}

class _DiscoPageState extends State<DiscoPage> {
  final slider = SleekCircularSlider(
    appearance: CircularSliderAppearance(
        startAngle: 0.0,
        size: 400,
        customColors: CustomSliderColors(
          hideShadow: true,
          dynamicGradient: true,
        ),
        spinnerMode: false),
    onChange: (double value) {
      print(value);
    },
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: slider),
    );
  }
}
