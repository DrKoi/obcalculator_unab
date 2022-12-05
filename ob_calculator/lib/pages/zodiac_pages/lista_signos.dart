import 'package:flutter/material.dart';
import 'package:ob_calculator/pages/semana_pages/semana_page.dart';
import 'package:ob_calculator/pages/zodiac_pages/signo_zodiaco_page.dart';

import '../../models/signo_zodiaco.dart';
import '../../widgets/heading.dart';
import '../../widgets/screen_display.dart';

class ListaSignos extends StatefulWidget {
  const ListaSignos({Key? key}) : super(key: key);
  @override
  State<ListaSignos> createState() => _ListaSignosState();
}

class _ListaSignosState extends State<ListaSignos> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Heading(
              title: "Otros signos",
              count: "12",
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView(children: [
                WidgetButton(
                  title: ('Aries'),
                  subTitle: ('El carnero'),
                  onTap: () {
                    MaterialPageRoute route = MaterialPageRoute(
                      builder: (context) => SignoZodiacoPage('Aries'),
                    );
                    Navigator.push(context, route);
                  },
                ),
              ]),
            ),
          ],
        ),
      ),
    ));
  }
}
