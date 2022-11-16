import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:ob_calculator/pages/imc_page.dart';
import 'package:ob_calculator/widgets/bottom_nav_bar.dart';
import '../models/pagina_model.dart';
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
  final GlobalKey<FabCircularMenuState> fabKey = GlobalKey();
  int paginaSel = 0;
  List<Pagina> paginas = [
    Pagina(
        iconoPagina: Icon(MdiIcons.baby),
        nombrePagina: 'Edad Gestacional',
        pathPagina: EdadGestacionalPage()),
    Pagina(
        iconoPagina: Icon(MdiIcons.doctor),
        nombrePagina: 'FUR Operacional',
        pathPagina: FurOperacionalPage()),
    Pagina(
        iconoPagina: Icon(MdiIcons.weight),
        nombrePagina: 'IMC',
        pathPagina: ImcPage()),
    Pagina(
        iconoPagina: Icon(MdiIcons.disc),
        nombrePagina: 'Disco Gestacional',
        pathPagina: DiscoPage()),
    Pagina(
        iconoPagina: Icon(MdiIcons.spaceInvaders),
        nombrePagina: 'Carta Astral',
        pathPagina: CartaAstralPage()),
  ];
  late int numPagina;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SafeArea(
          minimum: EdgeInsets.symmetric(horizontal: 5),
          child: paginas[paginaSel].pathPagina),
      /* drawer: Drawer(
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
      ), */
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
              /*  Builder(builder: (context) {
          return FabCircularMenu(key: fabKey, children: [
            RawMaterialButton(
              child: Icon(MdiIcons.wheelBarrow),
              onPressed: () {
                setState(() {
                  paginaSel = 0;
                });
              },
            ),
            RawMaterialButton(
              child: Icon(MdiIcons.doctor),
              onPressed: () {
                setState(() {
                  paginaSel = 1;
                });
              },
            ),
            RawMaterialButton(
              child: Icon(MdiIcons.weight),
              onPressed: () {
                setState(() {
                  paginaSel = 2;
                });
              },
            ), */
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
