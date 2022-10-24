import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:ob_calculator/pages/imc_page.dart';

import '../models/pagina_model.dart';
import 'edad_gestacional_page.dart';
import 'fur_operacional_page.dart';
import 'carta_astral_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int paginaSel = 0;
  List<Pagina> paginas = [
    Pagina(
        iconoPagina: Icon(MdiIcons.babyBottle),
        nombrePagina: 'Edad Gestacional',
        pathPagina: EdadGestacionalPage()),
    Pagina(
        iconoPagina: Icon(MdiIcons.babyBottle),
        nombrePagina: 'FUR Operacional',
        pathPagina: FurOperacionalPage()),
    Pagina(
        iconoPagina: Icon(MdiIcons.babyBottle),
        nombrePagina: 'IMC',
        pathPagina: ImcPage()),
    Pagina(
        iconoPagina: Icon(MdiIcons.babyBottle),
        nombrePagina: 'Carta Astral',
        pathPagina: CartaAstralPage()),
  ];
  late int numPagina;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Obtetricia Calculadora'),
        ),
        body: paginas[paginaSel].pathPagina,
        drawer: Drawer(
          child: Column(
            children: [
              DrawerHeader(
                  child: Container(
                child: Text('UNAB Ob Calculator'),
              )),
              Expanded(
                child: ListView.builder(
                  itemCount: paginas.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: paginas[index].iconoPagina,
                      title: Text(paginas[index].nombrePagina),
                      onTap: () =>
                          navegar(context, paginas.indexOf(paginas[index])),
                    );
                  },
                ),
              ),
            ],
          ),
        )

        /* bottomNavigationBar:
          BottomNavigationBar(backgroundColor: Colors.red, items: [
        BottomNavigationBarItem(
            icon: Icon(MdiIcons.faceWomanOutline),
            label: 'Fecha Probable de Parto'),
        BottomNavigationBarItem(
            icon: Icon(MdiIcons.babyFaceOutline), label: 'Edad Gestacional'),
      ]), */
        );
  }

  void navegar(BuildContext context, int numPagina) {
    Navigator.pop(context);
    setState(() {
      paginaSel = numPagina;
    });
  }
}
