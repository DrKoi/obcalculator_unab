import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:ob_calculator/pages/imc_page.dart';
import '../models/pagina_model.dart';
import 'disco_gestacional_page copy.dart';

import 'disco_page.dart';
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
        iconoPagina: Icon(MdiIcons.baby),
        nombrePagina: 'Edad Gestacional',
        //TODO:- cambiar por el disco
        pathPagina: NewDiscoGestacionalPage()),
    //------------------------------
    Pagina(
        iconoPagina: Icon(MdiIcons.doctor),
        nombrePagina: 'FUR Operacional',
        pathPagina: FurOperacionalPage()),
    Pagina(
        iconoPagina: Icon(MdiIcons.weight),
        nombrePagina: 'IMC',
        pathPagina: ImcPage()),
  ];
  late int numPagina;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        elevation: 0,
        backgroundColor: Colors.white24,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/logo_unab.png'),
        ),
        actions: [],
      ),
      body: SafeArea(
          minimum: EdgeInsets.symmetric(horizontal: 5),
          child: paginas[paginaSel].pathPagina),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.red.withAlpha(10),
                blurRadius: 20,
                spreadRadius: 10,
              )
            ],
            border: Border.all(width: 10, color: Colors.white),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32), topRight: Radius.circular(32))),
        child: BottomNavigationBar(
            elevation: 0,
            backgroundColor: Colors.white,
            unselectedItemColor: Colors.grey.withAlpha(100),
            type: BottomNavigationBarType.fixed,
            currentIndex: paginaSel,
            onTap: (index) {
              setState(() {
                paginaSel = index;
              });
              //navegar(context, paginaSel);
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(MdiIcons.wheelBarrow), label: 'Wheel'),
              BottomNavigationBarItem(
                  icon: Icon(MdiIcons.doctor), label: 'Eco'),
              BottomNavigationBarItem(icon: Icon(MdiIcons.weight), label: 'IMC')
            ]),
      ),
    );
  }

  void navegar(BuildContext context, int numPagina) {
    Navigator.pop(context);
    setState(() {
      paginaSel = numPagina;
    });
  }
}
