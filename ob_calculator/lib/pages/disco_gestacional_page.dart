import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:ob_calculator/pages/mostrar_datos.dart';

import '../widgets/disco_widget.dart';

class DiscoGestacionalPage extends StatefulWidget {
  const DiscoGestacionalPage({super.key});

  @override
  State<DiscoGestacionalPage> createState() => _DiscoGestacionalPageState();
}

class _DiscoGestacionalPageState extends State<DiscoGestacionalPage> {
  final formKey = GlobalKey<FormState>();
  DateTime fechaSeleccionada = DateTime.now();
  var fFecha = DateFormat('dd-MM-yyyy');
  bool buttonPressed = false;
  final List<dynamic> datos = ['---', '---'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: disco(
              progressVal: 0.5,
              fFecha: fFecha,
              fecha: fechaSeleccionada,
              datos: datos,
            ),
            flex: 3,
          ),
          Expanded(
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: campoFurPicker(),
                  ),
                  botonCalcular(),
                ]),
              ),
            ),
          ),
          /* FutureBuilder(
            builder: (context, index) {
              if (buttonPressed) {
                //setState(() {});
                return Column(
                  children: [
                    Container(
                      child: Text(
                          'La edad gestacional es de ${datos[0].toString()}'),
                    ),
                    Container(
                      child: Text(
                          'La fecha probable de parto es ${datos[1].toString()}'),
                    ),
                  ],
                );
              } else {
                return Container();
              }
            },
          ) */
        ],
      ),
    );
  }

  Row campoFurPicker() {
    return Row(
      children: [
        Text('Fecha última regla: ',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Spacer(),
        Text(fFecha.format(fechaSeleccionada),
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        IconButton(
            color: Colors.grey,
            onPressed: () {
              showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2017),
                lastDate: DateTime.now(),
                locale: Locale('es', 'ES'),
              ).then((fecha) {
                setState(() {
                  fechaSeleccionada = fecha ?? fechaSeleccionada;
                });
              });
            },
            icon: Icon(
              MdiIcons.calendar,
              size: 30,
              color: Color(0xFF001B2B),
            )),
      ],
    );
  }

  Container botonCalcular() {
    return Container(
        height: 50,
        child: ElevatedButton.icon(
            onPressed: (() {
              datos.clear();
              buttonPressed = true;
              setState(() {
                var fechaMesesSubstracted = DateTime(fechaSeleccionada.year + 1,
                    fechaSeleccionada.month - 3, fechaSeleccionada.day + 7);
                var edadGestacionalSemanas = Jiffy([
                  DateTime.now().year,
                  DateTime.now().month,
                  DateTime.now().day
                ]).diff(
                    Jiffy([
                      fechaSeleccionada.year,
                      fechaSeleccionada.month,
                      fechaSeleccionada.day
                    ]),
                    Units.WEEK);
                var edadGestacionalDias = (Jiffy([
                      DateTime.now().year,
                      DateTime.now().month,
                      DateTime.now().day
                    ]).diff(
                        Jiffy([
                          fechaSeleccionada.year,
                          fechaSeleccionada.month,
                          fechaSeleccionada.day
                        ]),
                        Units.DAY) %
                    7);
                if (edadGestacionalDias == 0 && edadGestacionalSemanas == 0) {
                  datos.add('---');
                } else {
                  if (edadGestacionalDias == 0) {
                    datos.add(edadGestacionalSemanas.toString() + ' semanas ');
                  } else {
                    if (edadGestacionalSemanas == 0) {
                      if (edadGestacionalDias == 1) {
                        datos.add(edadGestacionalDias.toString() + ' día');
                      }
                      datos.add(edadGestacionalDias.toString() + ' días ');
                    } else {
                      if (edadGestacionalDias == 1) {
                        if (edadGestacionalSemanas == 1) {
                          datos.add(edadGestacionalSemanas.toString() +
                              ' semana y ' +
                              edadGestacionalDias.toString() +
                              ' día ');
                        } else {
                          datos.add(edadGestacionalSemanas.toString() +
                              ' semanas y ' +
                              edadGestacionalDias.toString() +
                              ' día');
                        }
                      } else {
                        if (edadGestacionalSemanas == 1) {
                          datos.add(edadGestacionalSemanas.toString() +
                              ' semana y ' +
                              edadGestacionalDias.toString() +
                              ' días ');
                        }
                        datos.add(edadGestacionalSemanas.toString() +
                            ' semanas y ' +
                            edadGestacionalDias.toString() +
                            ' días ');
                      }
                    }
                  }
                }
                datos.add(Jiffy(fechaMesesSubstracted).yMMMd);
              });
              /* MaterialPageRoute route = MaterialPageRoute(
                builder: (context) => MostrarDatos(datos),
              );
              Navigator.push(context, route).then((value) {
                setState(() {});
              }); */
            }),
            icon: Icon(MdiIcons.calculator),
            label: Text('Calcular')));
  }
}
