import 'package:flutter/material.dart';

class MostrarDatos extends StatefulWidget {
  List<dynamic> datos;
  //const MostrarDatos({super.key});
  MostrarDatos(this.datos, {Key? key}) : super(key: key);

  @override
  State<MostrarDatos> createState() => _MostrarDatosState();
}

class _MostrarDatosState extends State<MostrarDatos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: ListView(children: [
                  ListTile(
                    title: Text('La edad gestacional es de ' +
                        widget.datos[0].toString()),
                  ),
                  ListTile(
                    title: Text('La fecha probable de parto es ' +
                        widget.datos[1].toString()),
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
