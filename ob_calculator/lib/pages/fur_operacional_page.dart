import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:ob_calculator/pages/mostrar_datos.dart';

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
  bool buttonPressed = false;
  final List<dynamic> datos = ['---', '---', '---', '---', '---', '---', '---'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: fechaEcoPicker(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: campoSemanasEco(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: campoDiasEco(),
                  ),
                  botonCalcular(),
                ]),
              ),
            ),
          ),
          /* Expanded(
              child: ListView.builder(
                  itemBuilder: (context, index) {
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
                  itemCount: 1)) */
        ],
      ),
    );
  }

  Row fechaEcoPicker() {
    return Row(
      children: [
        Text(' Fecha ecografía: ',
            style: TextStyle(
              fontSize: 16,
            )),
        Spacer(),
        Text(fFecha.format(fechaSeleccionada),
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        //Spacer(),
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
          icon: Icon(MdiIcons.calendar),
          //color: Colors.red,
        ),
      ],
    );
  }

  TextFormField campoSemanasEco() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Semanas Ecografia', border: OutlineInputBorder()),
      controller: semanasCtrl,
      keyboardType: TextInputType.number,
      validator: (valor) {
        if (valor == null || valor.isEmpty) {
          return 'Campo necesario';
        }
        return null;
      },
    );
  }

  TextFormField campoDiasEco() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Días Ecografia', border: OutlineInputBorder()),
      controller: diasCtrl,
      keyboardType: TextInputType.number,
    );
  }

  Container botonCalcular() {
    return Container(
        child: ElevatedButton.icon(
            onPressed: (() {
              buttonPressed = true;
              datos.clear();
              setState(() {
                var semanas = int.tryParse(semanasCtrl.text.trim()) ?? 0;
                var dias = int.tryParse(diasCtrl.text.trim()) ?? 0;
                var fur = Jiffy(fechaSeleccionada)
                    .subtract(weeks: semanas, days: dias);
                var fechaMesesSubstracted =
                    DateTime(fur.year + 1, fur.month - 3, fur.day + 7);
                // fFecha.format(fechaSelMenosTres);
                /* Duration edadGestacional =
                          DateTime.now().difference(fechaSeleccionada); */
                var edadGestacionalSemanas = Jiffy([
                  DateTime.now().year,
                  DateTime.now().month,
                  DateTime.now().day
                ]).diff(Jiffy([fur.year, fur.month, fur.day]), Units.WEEK);
                var edadGestacionalDias = (Jiffy([
                      DateTime.now().year,
                      DateTime.now().month,
                      DateTime.now().day
                    ]).diff(Jiffy([fur.year, fur.month, fur.day]), Units.DAY)) %
                    7;
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
