import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:ob_calculator/constants.dart';
import 'package:ob_calculator/pages/informacion_page.dart';
import '../models/pagina_model.dart';
import 'disco_disco.dart';
import 'new_disco_gestacional_page.dart';
import 'fur_operacional_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int paginaSel = 0;
  List<Pagina> paginas = [
    Pagina(
        subtitulo: null,
        iconoPagina: Icon(MdiIcons.baby),
        nombrePagina: 'Edad Gestacional',
        //pathPagina: DiscoDiscoPage()),
        pathPagina: NewDiscoGestacionalPage()),
    //------------------------------
    Pagina(
        subtitulo: null,
        iconoPagina: Icon(MdiIcons.doctor),
        nombrePagina: 'FUR Operacional',
        pathPagina: FurOperacionalPage()),
    Pagina(
        subtitulo: null,
        iconoPagina: Icon(MdiIcons.information),
        nombrePagina: 'Información',
        pathPagina: InformacionPage()),
  ];
  late int numPagina;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        shadowColor: Colors.transparent,
        elevation: 0,
        backgroundColor: appBarColor,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/logo_unab.png'),
        ),
        title: Builder(builder: (context) {
          if (paginaSel == 1) {
            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'A partir de Ecografía ',
                    style: TextStyle(color: Colors.black, fontSize: 13),
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    'Edad Gestacional ',
                    style: TextStyle(color: Colors.black),
                    textAlign: TextAlign.start,
                  ),
                ]);
          } else if (paginaSel == 2) {
            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Información ',
                    style: TextStyle(color: Colors.black, fontSize: 13),
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    'Semana a Semana ',
                    style: TextStyle(color: Colors.black),
                    textAlign: TextAlign.start,
                  ),
                ]);
          } else {
            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Calculadora ',
                    style: TextStyle(color: Colors.black, fontSize: 13),
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    'Edad Gestacional ',
                    style: TextStyle(color: Colors.black),
                    textAlign: TextAlign.start,
                  ),
                ]);
          }
        }),
        actions: [
          PopupMenuButton(
            icon: Padding(
              padding: const EdgeInsets.only(right: 50.0),
              child: Icon(
                MdiIcons.dotsVertical,
                color: Colors.black,
                size: 35,
              ),
            ),
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'about',
                child: Text('About'),
              ),
              /*  PopupMenuItem(
                value: 'logout',
                child: Text('Cerrar Sesión'),
              ), */
            ],
            onSelected: (opcionSeleccionada) {
              if (opcionSeleccionada == 'logout') {}
            },
          ),
        ],
      ),
      body: IndexedStack(index: paginaSel, children: [
        SafeArea(
            minimum: EdgeInsets.symmetric(horizontal: 5),
            child: paginas[0].pathPagina),
        SafeArea(
            minimum: EdgeInsets.symmetric(horizontal: 5),
            child: paginas[1].pathPagina),
        SafeArea(
            minimum: EdgeInsets.symmetric(horizontal: 5),
            child: paginas[2].pathPagina),
      ]),
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
                  icon: Icon(MdiIcons.circleSlice4), label: 'Edad Gestacional'),
              BottomNavigationBarItem(
                  icon: Icon(MdiIcons.doctor), label: 'Eco'),
              BottomNavigationBarItem(
                  icon: Icon(MdiIcons.information), label: 'Informaciión')
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
