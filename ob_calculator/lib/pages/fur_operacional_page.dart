import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class FurOperacionalPage extends StatefulWidget {
  const FurOperacionalPage({super.key});

  @override
  State<FurOperacionalPage> createState() => _FurOperacionalPageState();
}

class _FurOperacionalPageState extends State<FurOperacionalPage> {
  TextEditingController semanasCtrl = TextEditingController();
  TextEditingController diasCtrl = TextEditingController();

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
            fechaEcoPicker(),
            campoSemanasEco(),
            campoDiasEco(),
            botonCalcular(),
          ]),
        ),
      ),
    );
  }

  Row fechaEcoPicker() {
    return Row(
      children: [
        Text('Fecha ecografía: ',
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

  TextFormField campoSemanasEco() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Semanas Ecografia'),
      controller: semanasCtrl,
      keyboardType: TextInputType.number,
    );
  }

  TextFormField campoDiasEco() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Días Ecografia'),
      controller: diasCtrl,
      keyboardType: TextInputType.number,
    );
  }

  Container botonCalcular() {
    return Container(
        child: ElevatedButton.icon(
            onPressed: (() {
              setState(() {
                showDialog(
                    context: context,
                    builder: ((context) {
                      return AlertDialog(
                        content: Text('ddd'),
                      );
                    }));
              });
            }),
            icon: Icon(MdiIcons.calculator),
            label: Text('Calcular')));
  }
}
