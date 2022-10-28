import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
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
  bool buttonPressed = false;
  late final datos = [];

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
          Expanded(
              child: ListView.builder(
                  itemBuilder: (context, index) {
                    if (buttonPressed) {
                      //   setState(() {});
                      return ListTile(
                        title: Text(datos[index].toString()),
                      );
                    } else {
                      return Container();
                    }
                  },
                  itemCount: datos.length))
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
              buttonPressed = true;
              setState(() {
                showDialog(
                    context: context,
                    builder: ((context) {
                      /* var dia = fechaSeleccionada.toString().substring(0, 3);
                      var mes = fechaSeleccionada.toString().substring(3, 5); */
                      //Duration mesesAtras = fechaSeleccionada.difference();
                      /* var fechaDiasAdded =
                          fechaSeleccionada.add(Duration(days: 7)); */
                      var fechaPP = DateTime(
                          fechaSeleccionada.year + 1,
                          fechaSeleccionada.month - 3,
                          fechaSeleccionada.day + 7);
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
                      datos.add(edadGestacionalSemanas);
                      datos.add(fFecha.format(fechaPP));
                      return AlertDialog(
                        content: Text(
                            'La edad gestacional es de ${edadGestacionalSemanas} semanas y la Fecha probable de parto es ${fFecha.format(fechaPP)}'),
                      );
                    }));
              });
            }),
            icon: Icon(MdiIcons.calculator),
            label: Text('Calcular')));
  }
}
