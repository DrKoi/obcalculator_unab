import 'package:flutter/material.dart';

class TestCirMotion extends StatefulWidget {
  const TestCirMotion({super.key});

  @override
  State<TestCirMotion> createState() => _TestCirMotionState();
}

class _TestCirMotionState extends State<TestCirMotion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Giro')),
    );
  }
}
