import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ImcPage extends StatefulWidget {
  const ImcPage({super.key});

  @override
  State<ImcPage> createState() => _ImcPageState();
}

TextEditingController pesoCtrl = TextEditingController();
TextEditingController estaturaCtrl = TextEditingController();
TextEditingController semanasCtrl = TextEditingController();
final formKey = GlobalKey<FormState>();

class _ImcPageState extends State<ImcPage> {
  double imc = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                            label: Text('Datos Gestante:'),
                            border: OutlineInputBorder()),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            label: Text('Datos Bebé:'),
                            border: OutlineInputBorder()),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 40),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      child: Text(
                    'Cálculo de IMC',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
                ),
              ),
              Divider(),
              campoEstaturaGestante(),
              campoPesoGestante(),
              campoSemanasEmbarazo(),
              botonCalcular()
            ]),
          )),
    );
  }

  TextFormField campoPesoGestante() {
    return TextFormField(
      validator: (valor) {
        if (valor == null || valor.isEmpty) {
          return 'Indique peso';
        }
        return null;
      },
      decoration:
          InputDecoration(labelText: 'Peso (kg)', border: OutlineInputBorder()),
      controller: pesoCtrl,
      keyboardType: TextInputType.number,
      //maxLength: 3,
    );
  }

  TextFormField campoEstaturaGestante() {
    return TextFormField(
      validator: (valor) {
        if (valor == null || valor.isEmpty) {
          return 'Indique estatura';
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: 'Estatura (m)', border: OutlineInputBorder()),
      controller: estaturaCtrl,
      keyboardType: TextInputType.number,
      //maxLength: 3,
    );
  }

  TextFormField campoSemanasEmbarazo() {
    return TextFormField(
      validator: (valor) {
        if (valor == null || valor.isEmpty) {
          return 'Indique cantidad de semanas';
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: 'Semanas de embarazo',
          hintText: 'ej: 21',
          border: OutlineInputBorder()),
      controller: semanasCtrl,
      keyboardType: TextInputType.number,
      maxLength: 3,
    );
  }

  Container botonCalcular() {
    return Container(
        child: ElevatedButton.icon(
            onPressed: (() {
              if (formKey.currentState!.validate()) {
                //form ok

                setState(() {
                  showDialog(
                      context: context,
                      builder: ((context) {
                        double estatura =
                            double.tryParse(estaturaCtrl.text.trim()) ?? 0;
                        double peso =
                            double.tryParse(pesoCtrl.text.trim()) ?? 0;
                        int semanas =
                            int.tryParse(semanasCtrl.text.trim()) ?? 0;
                        calcularImc(estatura, peso);
                        return AlertDialog(
                            content: Text('Gestante de ' +
                                semanas.toString() +
                                ' semanas, de peso ' +
                                peso.toString() +
                                ' y estatura ' +
                                estatura.toString() +
                                'Indice de masa corporal:  ' +
                                imc.toString()));
                      }));
                });
              }
            }),
            icon: Icon(MdiIcons.calculator),
            label: Text('Calcular')));
  }

  void calcularImc(estatura, peso) {
    imc = peso / (estatura * estatura);
  }
}
