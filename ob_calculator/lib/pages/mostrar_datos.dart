import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

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
      //appBar: AppBar(title: Text('Resultados')),
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 50,
                color: Color(0xFF001B2B),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      /* Icon(
                        MdiIcons.earthBoxMinus,
                        color: Colors.white,
                      ), */
                      Text(
                        'Detalles',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )
                    ]),
              ),
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
                  ListTile(
                    title: Text('Peso del bebé: ' + widget.datos[2].toString()),
                  ),
                  ListTile(
                    title:
                        Text('Talla del bebé: ' + widget.datos[3].toString()),
                  ),
                  ListTile(
                    title: Text(
                        'Diámetro biparietal: ' + widget.datos[4].toString()),
                  ),
                  ListTile(
                    title: Text(
                        'Longitud del fémur: ' + widget.datos[5].toString()),
                  ),
                  ListTile(
                    title:
                        Text('Signo zodiacal: ' + widget.datos[6].toString()),
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
