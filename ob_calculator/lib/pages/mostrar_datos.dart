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
                child: ListView(
                    //diameterRatio: 1.5,
                    //itemExtent: 80,
                    children: [
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
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                content: Text(
                                    'La fecha probable de parto es sólo una previsión, ya que el parto puede retrasarse o adelantarse.')),
                          );
                        },
                      ),
                      WidgetButton(
                        title: (widget.datos[2].toString()),
                        subTitle: ('Peso Aproximado'),
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                content: Text(
                                    'Este es el peso estimado para la edad gestacional de ${widget.datos[0].toString()}')),
                          );
                        },
                      ),
                      WidgetButton(
                        title: (widget.datos[3].toString()),
                        subTitle: ('Talla Aproximada del bebé'),
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                content: Text(
                                    'Esta es la estatura estimada para la edad gestacional de ${widget.datos[0].toString()}')),
                          );
                        },
                      ),
                      WidgetButton(
                        title: (widget.datos[4].toString()),
                        subTitle: ('Diámetro biparietal'),
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                content: Text(
                                    'Este es el diámetro biparietal estimado para la edad gestacional de ${widget.datos[0].toString()}')),
                          );
                        },
                      ),
                      WidgetButton(
                        title: (widget.datos[5].toString()),
                        subTitle: ('Longitud de femúr'),
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                content: Text(
                                    'Esta es la longitud de fémur estimada para la edad gestacional de ${widget.datos[0].toString()}')),
                          );
                        },
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
              SizedBox(
                height: 15,
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
