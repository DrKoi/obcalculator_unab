import 'package:flutter/material.dart';

class CartaAstralPage extends StatefulWidget {
  const CartaAstralPage({super.key});

  @override
  State<CartaAstralPage> createState() => _CartaAstralPageState();
}

class _CartaAstralPageState extends State<CartaAstralPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image(image: AssetImage('assets/zodiaco_maya.jpg')),
      ),
    );
  }
}
