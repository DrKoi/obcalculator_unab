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
  final ZoomDrawerController zCtrl = ZoomDrawerController();
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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        //title: Text('Obtetricia Calculadora'),
      ),
      body: SafeArea(
          minimum: EdgeInsets.symmetric(horizontal: 10),
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
      bottomNavigationBar: BottomNavigationBar(
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
            BottomNavigationBarItem(icon: Icon(MdiIcons.doctor), label: 'Eco'),
            BottomNavigationBarItem(icon: Icon(MdiIcons.weight), label: 'IMC')
          ]),
    );
  }

  void navegar(BuildContext context, int numPagina) {
    Navigator.pop(context);
    setState(() {
      paginaSel = numPagina;
    });
  }
}
