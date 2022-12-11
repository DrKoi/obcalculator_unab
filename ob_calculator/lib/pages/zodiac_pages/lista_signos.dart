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
                  WidgetButton(
                    title: ('Tauro'),
                    subTitle: ('El toro'),
                    onTap: () {
                      MaterialPageRoute route = MaterialPageRoute(
                        builder: (context) => SignoZodiacoPage('Tauro'),
                      );
                      Navigator.push(context, route);
                    },
                  ),
                  WidgetButton(
                    title: ('Géminis'),
                    subTitle: ('Los gemelos'),
                    onTap: () {
                      MaterialPageRoute route = MaterialPageRoute(
                        builder: (context) => SignoZodiacoPage('Géminis'),
                      );
                      Navigator.push(context, route);
                    },
                  ),
                  WidgetButton(
                    title: ('Cáncer'),
                    subTitle: ('El cangrejo'),
                    onTap: () {
                      MaterialPageRoute route = MaterialPageRoute(
                        builder: (context) => SignoZodiacoPage('Cáncer'),
                      );
                      Navigator.push(context, route);
                    },
                  ),
                  WidgetButton(
                    title: ('Leo'),
                    subTitle: ('El león'),
                    onTap: () {
                      MaterialPageRoute route = MaterialPageRoute(
                        builder: (context) => SignoZodiacoPage('Leo'),
                      );
                      Navigator.push(context, route);
                    },
                  ),
                  WidgetButton(
                    title: ('Virgo'),
                    subTitle: ('La virgen'),
                    onTap: () {
                      MaterialPageRoute route = MaterialPageRoute(
                        builder: (context) => SignoZodiacoPage('Virgo'),
                      );
                      Navigator.push(context, route);
                    },
                  ),
                  WidgetButton(
                    title: ('Libra'),
                    subTitle: ('La balanza'),
                    onTap: () {
                      MaterialPageRoute route = MaterialPageRoute(
                        builder: (context) => SignoZodiacoPage('Libr'),
                      );
                      Navigator.push(context, route);
                    },
                  ),
                  WidgetButton(
                    title: ('Escorpio'),
                    subTitle: ('El escorpión'),
                    onTap: () {
                      MaterialPageRoute route = MaterialPageRoute(
                        builder: (context) => SignoZodiacoPage('Escorpio'),
                      );
                      Navigator.push(context, route);
                    },
                  ),
                  WidgetButton(
                    title: ('Sagitario'),
                    subTitle: ('El arquero'),
                    onTap: () {
                      MaterialPageRoute route = MaterialPageRoute(
                        builder: (context) => SignoZodiacoPage('Sagitario'),
                      );
                      Navigator.push(context, route);
                    },
                  ),
                  WidgetButton(
                    title: ('Capricornio'),
                    subTitle: ('La cabra de mar'),
                    onTap: () {
                      MaterialPageRoute route = MaterialPageRoute(
                        builder: (context) => SignoZodiacoPage('Capricornio'),
                      );
                      Navigator.push(context, route);
                    },
                  ),
                  WidgetButton(
                    title: ('Acuario'),
                    subTitle: ('El portador del agua'),
                    onTap: () {
                      MaterialPageRoute route = MaterialPageRoute(
                        builder: (context) => SignoZodiacoPage('Acuario'),
                      );
                      Navigator.push(context, route);
                    },
                  ),
                  WidgetButton(
                    title: ('Piscis'),
                    subTitle: ('Los peces'),
                    onTap: () {
                      MaterialPageRoute route = MaterialPageRoute(
                        builder: (context) => SignoZodiacoPage('Piscis'),
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
