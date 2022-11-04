import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:ob_calculator/pages/imc_page.dart';

import '../models/pagina_model.dart';
import '../pages/disco_page.dart';
import '../pages/edad_gestacional_page.dart';
import '../pages/fur_operacional_page.dart';
import '../pages/carta_astral_page.dart';

final ZoomDrawerController z = ZoomDrawerController();

class Zoom extends StatefulWidget {
  const Zoom({Key? key}) : super(key: key);

  @override
  _ZoomState createState() => _ZoomState();
}

class _ZoomState extends State<Zoom> {
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
    return ZoomDrawer(
      controller: z,
      borderRadius: 24,
      style: DrawerStyle.defaultStyle,
      // showShadow: true,
      openCurve: Curves.fastOutSlowIn,
      slideWidth: MediaQuery.of(context).size.width * 0.65,
      duration: const Duration(milliseconds: 500),
      // angle: 0.0,
      menuBackgroundColor: Colors.indigo,
      mainScreen: EdadGestacionalPage(),
      menuScreen: Scaffold(
        //backgroundColor: Colors.indigo,
        body: Padding(
          padding: EdgeInsets.only(left: 25),
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
        ),
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


class TwoPanels extends StatefulWidget {
  final AnimationController controller;

  const TwoPanels({Key? key, required this.controller}) : super(key: key);

  @override
  _TwoPanelsState createState() => _TwoPanelsState();
}

class _TwoPanelsState extends State<TwoPanels> with TickerProviderStateMixin {
  static const _headerHeight = 32.0;
  late TabController tabController = TabController(length: 3, vsync: this);

  Animation<RelativeRect> getPanelAnimation(BoxConstraints constraints) {
    final _height = constraints.biggest.height;
    final _backPanelHeight = _height - _headerHeight;
    const _frontPanelHeight = -_headerHeight;

    return RelativeRectTween(
      begin: RelativeRect.fromLTRB(
        0.0,
        _backPanelHeight,
        0.0,
        _frontPanelHeight,
      ),
      end: const RelativeRect.fromLTRB(0.0, 100, 0.0, 0.0),
    ).animate(
      CurvedAnimation(parent: widget.controller, curve: Curves.linear),
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  Widget bothPanels(BuildContext context, BoxConstraints constraints) {
    final ThemeData theme = Theme.of(context);
    return Stack(
      children: <Widget>[
        Scaffold(
          appBar: AppBar(
            title: const Text("Backdrop"),
            elevation: 0.0,
            leading: IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                z.toggle!();
              },
            ),
            
          ),
          body: Container(),
  ),
  
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: bothPanels,
    );
  }
}