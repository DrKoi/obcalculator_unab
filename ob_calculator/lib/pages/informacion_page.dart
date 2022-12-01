import 'package:flutter/material.dart';
import 'package:ob_calculator/pages/zodiac_pages/singo_zodica_page.dart';

import '../models/pagina_model.dart';
import '../widgets/heading.dart';
import '../widgets/screen_display.dart';

class InformacionPage extends StatefulWidget {
  const InformacionPage({super.key});

  @override
  State<InformacionPage> createState() => _InformacionPageState();
}

final List<Pagina> semanasPages = [
  Pagina(
      nombrePagina: 'Semana 2',
      subtitulo: 'Ovulación',
      iconoPagina: null,
      pathPagina: SignoZodicoPage('Aries')),
  Pagina(
      nombrePagina: 'Semana 3',
      subtitulo: '¿Qué siente la madre?',
      iconoPagina: null,
      pathPagina: SignoZodicoPage('Aries')),
  Pagina(
      nombrePagina: 'Semana 4',
      subtitulo: 'Ovulación',
      iconoPagina: null,
      pathPagina: SignoZodicoPage('Aries')),
  Pagina(
      nombrePagina: 'Semana 5',
      subtitulo: 'Ovulación',
      iconoPagina: null,
      pathPagina: SignoZodicoPage('Aries')),
  Pagina(
      nombrePagina: 'Semana 6',
      subtitulo: 'Ovulación',
      iconoPagina: null,
      pathPagina: SignoZodicoPage('Aries')),
  Pagina(
      nombrePagina: 'Semana 7',
      subtitulo: 'Ovulación',
      iconoPagina: null,
      pathPagina: SignoZodicoPage('Aries')),
  Pagina(
      nombrePagina: 'Semana 8',
      subtitulo: 'Ovulación',
      iconoPagina: null,
      pathPagina: SignoZodicoPage('Aries')),
  Pagina(
      nombrePagina: 'Semana 9',
      subtitulo: 'Ovulación',
      iconoPagina: null,
      pathPagina: SignoZodicoPage('Aries')),
  Pagina(
      nombrePagina: 'Semana 10',
      subtitulo: 'Ovulación',
      iconoPagina: null,
      pathPagina: SignoZodicoPage('Aries')),
  Pagina(
      nombrePagina: 'Semana 11',
      subtitulo: 'Ovulación',
      iconoPagina: null,
      pathPagina: SignoZodicoPage('Aries')),
  Pagina(
      nombrePagina: 'Semana 12',
      subtitulo: 'Ovulación',
      iconoPagina: null,
      pathPagina: SignoZodicoPage('Aries')),
  Pagina(
      nombrePagina: 'Semana 13',
      subtitulo: 'Ovulación',
      iconoPagina: null,
      pathPagina: SignoZodicoPage('Aries')),
  Pagina(
      nombrePagina: 'Semana 14',
      subtitulo: 'Ovulación',
      iconoPagina: null,
      pathPagina: SignoZodicoPage('Aries')),
  Pagina(
      nombrePagina: 'Semana 15',
      subtitulo: 'Ovulación',
      iconoPagina: null,
      pathPagina: SignoZodicoPage('Aries')),
  Pagina(
      nombrePagina: 'Semana 16',
      subtitulo: 'Ovulación',
      iconoPagina: null,
      pathPagina: SignoZodicoPage('Aries')),
  Pagina(
      nombrePagina: 'Semana 17',
      subtitulo: 'Ovulación',
      iconoPagina: null,
      pathPagina: SignoZodicoPage('Aries')),
  Pagina(
      nombrePagina: 'Semana 18',
      subtitulo: 'Ovulación',
      iconoPagina: null,
      pathPagina: SignoZodicoPage('Aries')),
  Pagina(
      nombrePagina: 'Semana 19',
      subtitulo: 'Ovulación',
      iconoPagina: null,
      pathPagina: SignoZodicoPage('Aries')),
  Pagina(
      nombrePagina: 'Semana 20',
      subtitulo: 'Ovulación',
      iconoPagina: null,
      pathPagina: SignoZodicoPage('Aries')),
  Pagina(
      nombrePagina: 'Semana 21',
      subtitulo: 'Ovulación',
      iconoPagina: null,
      pathPagina: SignoZodicoPage('Aries')),
  Pagina(
      nombrePagina: 'Semana 22',
      subtitulo: 'Ovulación',
      iconoPagina: null,
      pathPagina: SignoZodicoPage('Aries')),
  Pagina(
      nombrePagina: 'Semana 23',
      subtitulo: 'Ovulación',
      iconoPagina: null,
      pathPagina: SignoZodicoPage('Aries')),
  Pagina(
      nombrePagina: 'Semana 24',
      subtitulo: 'Ovulación',
      iconoPagina: null,
      pathPagina: SignoZodicoPage('Aries')),
  Pagina(
      nombrePagina: 'Semana 25',
      subtitulo: 'Ovulación',
      iconoPagina: null,
      pathPagina: SignoZodicoPage('Aries')),
  Pagina(
      nombrePagina: 'Semana 26',
      subtitulo: 'Ovulación',
      iconoPagina: null,
      pathPagina: SignoZodicoPage('Aries')),
  Pagina(
      nombrePagina: 'Semana 27',
      subtitulo: 'Ovulación',
      iconoPagina: null,
      pathPagina: SignoZodicoPage('Aries')),
  Pagina(
      nombrePagina: 'Semana 28',
      subtitulo: 'Ovulación',
      iconoPagina: null,
      pathPagina: SignoZodicoPage('Aries')),
  Pagina(
      nombrePagina: 'Semana 29',
      subtitulo: 'Ovulación',
      iconoPagina: null,
      pathPagina: SignoZodicoPage('Aries')),
  Pagina(
      nombrePagina: 'Semana 30',
      subtitulo: 'Ovulación',
      iconoPagina: null,
      pathPagina: SignoZodicoPage('Aries')),
  Pagina(
      nombrePagina: 'Semana 31',
      subtitulo: 'Ovulación',
      iconoPagina: null,
      pathPagina: SignoZodicoPage('Aries')),
  Pagina(
      nombrePagina: 'Semana 32',
      subtitulo: 'Ovulación',
      iconoPagina: null,
      pathPagina: SignoZodicoPage('Aries')),
  Pagina(
      nombrePagina: 'Semana 33',
      subtitulo: 'Ovulación',
      iconoPagina: null,
      pathPagina: SignoZodicoPage('Aries')),
  Pagina(
      nombrePagina: 'Semana 34',
      subtitulo: 'Ovulación',
      iconoPagina: null,
      pathPagina: SignoZodicoPage('Aries')),
  Pagina(
      nombrePagina: 'Semana 35',
      subtitulo: 'Ovulación',
      iconoPagina: null,
      pathPagina: SignoZodicoPage('Aries')),
  Pagina(
      nombrePagina: 'Semana 36',
      subtitulo: 'Ovulación',
      iconoPagina: null,
      pathPagina: SignoZodicoPage('Aries')),
  Pagina(
      nombrePagina: 'Semana 37',
      subtitulo: 'Ovulación',
      iconoPagina: null,
      pathPagina: SignoZodicoPage('Aries')),
  Pagina(
      nombrePagina: 'Semana 38',
      subtitulo: 'Ovulación',
      iconoPagina: null,
      pathPagina: SignoZodicoPage('Aries')),
  Pagina(
      nombrePagina: 'Semana 39',
      subtitulo: 'Ovulación',
      iconoPagina: null,
      pathPagina: SignoZodicoPage('Aries')),
  Pagina(
      nombrePagina: 'Semana 40',
      subtitulo: 'Ovulación',
      iconoPagina: null,
      pathPagina: SignoZodicoPage('Aries')),
];

class _InformacionPageState extends State<InformacionPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Heading(
              title: "Semanas",
              count: "40",
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: semanasPages.length,
                itemBuilder: (BuildContext context, int index) {
                  return WidgetButton(
                    title: semanasPages[index].nombrePagina,
                    subTitle: semanasPages[index].subtitulo,
                    onTap: () {
                      MaterialPageRoute route = MaterialPageRoute(
                        builder: (context) => semanasPages[index].pathPagina,
                      );
                      Navigator.push(context, route);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
