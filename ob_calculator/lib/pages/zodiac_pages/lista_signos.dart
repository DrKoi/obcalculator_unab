import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:ob_calculator/constants.dart';
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
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: appBarColor,
        leading: IconButton(
          icon: Icon(
            MdiIcons.arrowLeft,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Signo zodiacal de tu bebé',
          style: TextStyle(color: rojoUnab),
        ),
      ),
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Heading(
                title: "Otros signos",
                count: "12",
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
      )),
    );
  }
}
