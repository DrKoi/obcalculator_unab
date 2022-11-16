import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:ob_calculator/pages/mostrar_datos.dart';

import '../widgets/disco_widget.dart';

class EdadGestacionalPage extends StatefulWidget {
  const EdadGestacionalPage({super.key});

  @override
  State<EdadGestacionalPage> createState() => _EdadGestacionalPageState();
}

class _EdadGestacionalPageState extends State<EdadGestacionalPage> {
  final formKey = GlobalKey<FormState>();
  DateTime fechaSeleccionada = DateTime.now();
  var fFecha = DateFormat('dd-MM-yyyy');
  bool buttonPressed = false;
  late final datos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          /* Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Text(
                  'Edad Gestacional y FPP a partir de FUR',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ), */
          Expanded(
            child: disco(progressVal: 0.5),
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

  //String edadGestacional = '';
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
                // fFecha.format(fechaSelMenosTres);
                /* Duration edadGestacional =
                          DateTime.now().difference(fechaSeleccionada); */
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
                if (edadGestacionalDias == 0) {
                  datos.add(edadGestacionalSemanas.toString() + ' semanas ');
                } else {
                  datos.add(edadGestacionalSemanas.toString() +
                      ' semanas y ' +
                      edadGestacionalDias.toString() +
                      ' días ');
                }
                datos.add(fFecha.format(fechaMesesSubstracted));
                /* return AlertDialog(
                        content: Text(
                            'La edad gestacional es de ${edadGestacionalSemanas} semanas y la Fecha probable de parto es ${fFecha.format(fechaMesesSubstracted)}'),
                      ); */
              });
              MaterialPageRoute route = MaterialPageRoute(
                builder: (context) => MostrarDatos(datos),
              );
              Navigator.push(context, route).then((value) {
                setState(() {});
              });
            }),
            icon: Icon(MdiIcons.calculator),
            label: Text('Calcular')));
  }
}
