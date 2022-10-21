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
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(children: [
            campoFurPicker(),
          ]),
        ),
      ),
    );
  }

  Row campoFurPicker() {
    return Row(
      children: [
        Text('Fecha de Nacimiento: ',
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
}
