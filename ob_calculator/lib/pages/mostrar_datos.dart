import 'package:flutter/material.dart';
import 'package:ob_calculator/constants.dart';
import 'package:ob_calculator/pages/semana_pages/semana_page.dart';
import 'package:ob_calculator/pages/zodiac_pages/signo_zodiaco_page.dart';
import 'package:ob_calculator/widgets/screen_display.dart';

import '../widgets/heading.dart';

class MostrarDatos extends StatefulWidget {
  List<dynamic> datos;
  num edadGestacional;
  //const MostrarDatos({super.key});
  MostrarDatos(this.datos, this.edadGestacional, {Key? key}) : super(key: key);

  @override
  State<MostrarDatos> createState() => _MostrarDatosState();
}

class _MostrarDatosState extends State<MostrarDatos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/logo_unab.png'),
          ),
          elevation: 0,
          backgroundColor: appBarColor,
          title: Text(
            'Datos adicionales',
            style: TextStyle(color: Colors.black),
          )),
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Heading(
                title: "Detalles",
                count: "7",
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView(children: [
                  WidgetButton(
                    title: (widget.datos[0].toString()),
                    subTitle: ('Edad Gestacional'),
                    onTap: () {
                      if (widget.edadGestacional > 1) {
                        MaterialPageRoute route = MaterialPageRoute(
                          builder: (context) =>
                              SemanaPage(widget.edadGestacional),
                        );
                        Navigator.push(context, route);
                      } else {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                              content: Text(
                                  'Para ver detalles, la edad gestacional debe ser de 2 semanas en adelante')),
                        );
                      }
                    },
                  ),
                  WidgetButton(
                    title: (widget.datos[1].toString()),
                    subTitle: ('Fecha Probable de parto'),
                    onTap: () {},
                  ),
                  WidgetButton(
                    title: (widget.datos[2].toString()),
                    subTitle: ('Peso Aproximado'),
                    onTap: () {},
                  ),
                  WidgetButton(
                    title: (widget.datos[3].toString()),
                    subTitle: ('Talla Aproximada del bebé'),
                    onTap: () {},
                  ),
                  WidgetButton(
                    title: (widget.datos[4].toString()),
                    subTitle: ('Diámetro biparietal'),
                    onTap: () {},
                  ),
                  WidgetButton(
                    title: (widget.datos[5].toString()),
                    subTitle: ('Longitud de femúr'),
                    onTap: () {},
                  ),
                  WidgetButton(
                    title: (widget.datos[6].toString()),
                    subTitle: ('Signo zodiacal'),
                    onTap: () {
                      MaterialPageRoute route = MaterialPageRoute(
                        builder: (context) =>
                            SignoZodiacoPage(widget.datos[6].toString()),
                      );
                      Navigator.push(context, route);
                    },
                  ),
                ]),
              ),
              botonVolver(),
            ],
          ),
        ),
      )),
    );
  }

  Container botonVolver() {
    return Container(
      child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Volver')),
    );
  }
}
