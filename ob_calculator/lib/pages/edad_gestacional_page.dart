import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class EdadGestacionalPage extends StatefulWidget {
  const EdadGestacionalPage({super.key});

  @override
  State<EdadGestacionalPage> createState() => _EdadGestacionalPageState();
}

class _EdadGestacionalPageState extends State<EdadGestacionalPage> {
  final formKey = GlobalKey<FormState>();
  DateTime fechaSeleccionada = DateTime.now();
  var fFecha = DateFormat('dd-MM-yyyy');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Text(
                  'Edad Gestacional y FPP a partir de FUR',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
          Expanded(
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(children: [
                  campoFurPicker(),
                  botonCalcular(),
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row campoFurPicker() {
    return Row(
      children: [
        Text('Fecha última regla: ',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        Text(fFecha.format(fechaSeleccionada),
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        Spacer(),
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
            icon: Icon(MdiIcons.calendarOutline)),
      ],
    );
  }

  //String edadGestacional = '';
  Container botonCalcular() {
    return Container(
        child: ElevatedButton.icon(
            onPressed: (() {
              setState(() {
                showDialog(
                    context: context,
                    builder: ((context) {
                      /* var dia = fechaSeleccionada.toString().substring(0, 3);
                      var mes = fechaSeleccionada.toString().substring(3, 5); */
                      //Duration mesesAtras = fechaSeleccionada.difference();
                      /* var fechaDiasAdded =
                          fechaSeleccionada.add(Duration(days: 7)); */
                      var fechaMesesSubstracted = DateTime(
                          fechaSeleccionada.year + 1,
                          fechaSeleccionada.month - 3,
                          fechaSeleccionada.day + 7);
                      // fFecha.format(fechaSelMenosTres);
                      Duration edadGestacional =
                          DateTime.now().difference(fechaSeleccionada);

                      return AlertDialog(
                        content: Text(
                            'La edad gestacional es de ${edadGestacional.inDays} días y la Fecha probable de parto es ${fFecha.format(fechaMesesSubstracted)}'),
                      );
                    }));
              });
            }),
            icon: Icon(MdiIcons.calculator),
            label: Text('Calcular')));
  }
}
