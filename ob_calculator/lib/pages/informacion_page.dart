import 'package:flutter/material.dart';
import 'package:ob_calculator/pages/semana_pages/semana_page.dart';

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
      subtitulo: '',
      iconoPagina: null,
      pathPagina: SemanaPage(2)),
  Pagina(
      nombrePagina: 'Semana 3',
      subtitulo: '¿Qué siente la madre?',
      iconoPagina: null,
      pathPagina: SemanaPage(3)),
  Pagina(
      nombrePagina: 'Semana 4',
      subtitulo: '',
      iconoPagina: null,
      pathPagina: SemanaPage(4)),
  Pagina(
      nombrePagina: 'Semana 5',
      subtitulo: '',
      iconoPagina: null,
      pathPagina: SemanaPage(5)),
  Pagina(
      nombrePagina: 'Semana 6',
      subtitulo: '',
      iconoPagina: null,
      pathPagina: SemanaPage(6)),
  Pagina(
      nombrePagina: 'Semana 7',
      subtitulo: '',
      iconoPagina: null,
      pathPagina: SemanaPage(7)),
  Pagina(
      nombrePagina: 'Semana 8',
      subtitulo: 'El gran paso de embrión a feto',
      iconoPagina: null,
      pathPagina: SemanaPage(8)),
  Pagina(
      nombrePagina: 'Semana 9',
      subtitulo: 'Tu bebé tiene el tamaño de una uva',
      iconoPagina: null,
      pathPagina: SemanaPage(9)),
  Pagina(
      nombrePagina: 'Semana 10',
      subtitulo: 'Tu bebé comienza a moverse',
      iconoPagina: null,
      pathPagina: SemanaPage(10)),
  Pagina(
      nombrePagina: 'Semana 11',
      subtitulo: 'Tu bebé se mueve libre',
      iconoPagina: null,
      pathPagina: SemanaPage(11)),
  Pagina(
      nombrePagina: 'Semana 12',
      subtitulo: 'Su primera orina',
      iconoPagina: null,
      pathPagina: SemanaPage(12)),
  Pagina(
      nombrePagina: 'Semana 13',
      subtitulo: 'Lo más difícil a pasado',
      iconoPagina: null,
      pathPagina: SemanaPage(13)),
  Pagina(
      nombrePagina: 'Semana 14',
      subtitulo: 'Tu bebé ya funce el ceño',
      iconoPagina: null,
      pathPagina: SemanaPage(14)),
  Pagina(
      nombrePagina: 'Semana 15',
      subtitulo: 'Despídete de las náuseas',
      iconoPagina: null,
      pathPagina: SemanaPage(15)),
  Pagina(
      nombrePagina: 'Semana 16',
      subtitulo: 'Ya responde a estímulos externos',
      iconoPagina: null,
      pathPagina: SemanaPage(16)),
  Pagina(
      nombrePagina: 'Semana 17',
      subtitulo: 'Ya puedes sentir al bebé',
      iconoPagina: null,
      pathPagina: SemanaPage(17)),
  Pagina(
      nombrePagina: 'Semana 18',
      subtitulo: '¡Ahora puede oir tu corazón!',
      iconoPagina: null,
      pathPagina: SemanaPage(18)),
  Pagina(
      nombrePagina: 'Semana 19',
      subtitulo: 'Tu bebé reconoce tu voz',
      iconoPagina: null,
      pathPagina: SemanaPage(19)),
  Pagina(
      nombrePagina: 'Semana 20',
      subtitulo: 'La mitad de tu embarazo',
      iconoPagina: null,
      pathPagina: SemanaPage(20)),
  Pagina(
      nombrePagina: 'Semana 21',
      subtitulo: 'Tu bebé se mueve seguido',
      iconoPagina: null,
      pathPagina: SemanaPage(21)),
  Pagina(
      nombrePagina: 'Semana 22',
      subtitulo: 'Ya luce como será al nacer',
      iconoPagina: null,
      pathPagina: SemanaPage(22)),
  Pagina(
      nombrePagina: 'Semana 23',
      subtitulo: 'Su piel toma color',
      iconoPagina: null,
      pathPagina: SemanaPage(23)),
  Pagina(
      nombrePagina: 'Semana 24',
      subtitulo: 'Tu bebé siente sabores',
      iconoPagina: null,
      pathPagina: SemanaPage(24)),
  Pagina(
      nombrePagina: 'Semana 25',
      subtitulo: 'Tu bebé ya tiene pestañas',
      iconoPagina: null,
      pathPagina: SemanaPage(25)),
  Pagina(
      nombrePagina: 'Semana 26',
      subtitulo: '¡Empieza abrir sus ojitos!',
      iconoPagina: null,
      pathPagina: SemanaPage(26)),
  Pagina(
      nombrePagina: 'Semana 27',
      subtitulo: 'Tu bebé parpadea',
      iconoPagina: null,
      pathPagina: SemanaPage(27)),
  Pagina(
      nombrePagina: 'Semana 28',
      subtitulo: 'Percibe lo que le rodea',
      iconoPagina: null,
      pathPagina: SemanaPage(28)),
  Pagina(
      nombrePagina: 'Semana 29',
      subtitulo: 'Tu bebé crece rápido',
      iconoPagina: null,
      pathPagina: SemanaPage(29)),
  Pagina(
      nombrePagina: 'Semana 30',
      subtitulo: 'Comienza a cuenta regresiva',
      iconoPagina: null,
      pathPagina: SemanaPage(30)),
  Pagina(
      nombrePagina: 'Semana 31',
      subtitulo: 'Sientes todos sus movimientos',
      iconoPagina: null,
      pathPagina: SemanaPage(31)),
  Pagina(
      nombrePagina: 'Semana 32',
      subtitulo: 'Tiene sus uñas formadas',
      iconoPagina: null,
      pathPagina: SemanaPage(32)),
  Pagina(
      nombrePagina: 'Semana 33',
      subtitulo: 'Tu bebé y sus 5 sentidos',
      iconoPagina: null,
      pathPagina: SemanaPage(33)),
  Pagina(
      nombrePagina: 'Semana 34',
      subtitulo: 'Casi todo listo',
      iconoPagina: null,
      pathPagina: SemanaPage(34)),
  Pagina(
      nombrePagina: 'Semana 35',
      subtitulo: 'El bebé toma posición',
      iconoPagina: null,
      pathPagina: SemanaPage(35)),
  Pagina(
      nombrePagina: 'Semana 36',
      subtitulo: 'El bebé desciende',
      iconoPagina: null,
      pathPagina: SemanaPage(36)),
  Pagina(
      nombrePagina: 'Semana 37',
      subtitulo: 'La recta final',
      iconoPagina: null,
      pathPagina: SemanaPage(37)),
  Pagina(
      nombrePagina: 'Semana 38',
      subtitulo: 'Tu bebé ya está preparado',
      iconoPagina: null,
      pathPagina: SemanaPage(38)),
  Pagina(
      nombrePagina: 'Semana 39',
      subtitulo: 'Puede nacer en cualquier momento',
      iconoPagina: null,
      pathPagina: SemanaPage(39)),
  Pagina(
      nombrePagina: 'Semana 40',
      subtitulo: '¡Felicidades para tu bebé!',
      iconoPagina: null,
      pathPagina: SemanaPage(40)),
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
              count: "39",
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
