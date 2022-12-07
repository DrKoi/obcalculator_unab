import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:ob_calculator/constants.dart';

import '../../models/semana_model.dart';

class SemanaPage extends StatefulWidget {
  final num currentSemana;
  SemanaPage(this.currentSemana, {Key? key}) : super(key: key);

  @override
  State<SemanaPage> createState() => _SemanaState();
}

final Map<num, Semana> semana = {
  2: Semana(
    image: '',
    numSemana: 'Semana 2 de Embarazo',
    slogan: '',
    textoSemana:
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      RichText(
          text: TextSpan(
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  leadingDistribution: TextLeadingDistribution.proportional),
              children: <TextSpan>[
            TextSpan(
                text:
                    'Si tus ciclos son de 28 días la ovulación se produce el último día de esta semana, por lo que técnicamente aún no estás embarazada. Sin embargo, '),
            TextSpan(
                text:
                    'el médico va a contar las semanas de embarazo desde el primer día de tu FUR ',
                style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(
              text: '(Fecha Última Regla o menstruación) y no desde la concepción, por eso hablaremos de 2 semanas de embarazo, a pesar de que a estas alturas la fecundación aún no ocurre.' +
                  '\n\nSi no recuerdas tu FUR o tus ciclos son muy irregulares, será la ecografía la que dará la última palabra con respecto al momento en que quedaste embarazada.' +
                  '\n\nLas puntadas en los costados de tu abdomen son síntomas comunes durante este período. Normalmente éste es un indicador de ovulación, junto con la sensibilidad de los pechos. Además tu temperatura corporal basal suele aumentar de manera ligera.' +
                  '\n\nEl útero empieza a formar el “forro” donde se implantará el huevo que se llama placenta y servirá para nutrir a tu bebé. En este momento tu útero se está preparando para la concepción.' +
                  '\n\nTu volumen de sangre aumenta en un 50%, para afrontar la demanda de oxigeno del posible bebé que crecerá en tu interior. Dentro de tu cuerpo, estás creando un mundo seguro para que tu pequeño pueda desarrollarse, protegido del exterior.' +
                  '\n\nTodavía no es posible confirmar con análisis si ya estás embarazada. Debes tener un poco de paciencia ya que debes esperar dos semanas más para confirmarlo, es decir, la fecha cuando tendría que aparecer tu menstruación.',
            )
          ])
          //textAlign: TextAlign.justify,
          ),
      RichText(
        text: TextSpan(
          text: '\nOvulación',
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        textAlign: TextAlign.left,
      ),
      RichText(
          text: TextSpan(
              style: TextStyle(fontSize: 18, color: Colors.black),
              text: '\nLa ovulación, que permitirá que un óvulo salga de tu ovario para encontrarse con un espermatozoide que lo fecunde, se desencadena por un aumento súbito de la producción de una hormona llamada LH.' +
                  '\n\nEste proceso parte cuando la superficie del ovario comienza a presentar un abultamiento local, en cuyo vértice aparece una mancha llamada estigma. Esto produce la degeneración de la superficie del ovario, lo que da paso a un escape de líquido folicular por el estigma , que se abre gradualmente. Así se libera la tensión y el óvulo se desprende y es expulsado del ovario.' +
                  '\n\nSin embargo, algunas mujeres no ovulan naturalmente por lo que para embarazarse toman fármacos, como el citrato de clomifeno, que estimula la liberación de esta hormona, provocando ovulaciones múltiples.' +
                  '\n\nEs por esto que la frecuencia de embarazos múltiples aumenta hasta 10 veces cuando se induce la ovulación, pero también ocurren abortos espontáneos ya que no resulta posible la supervivencia de siete o más embriones.')),
      SizedBox(
        height: 20,
      )
    ]),
  ),
  3: Semana(
      image: '',
      numSemana: 'Semana 3 de Embarazo',
      slogan: '',
      textoSemana: Column(children: [Text('')])),
  4: Semana(
      image: '',
      numSemana: 'Semana 4 de Embarazo',
      slogan: '',
      textoSemana: Column(children: [Text('')])),
  5: Semana(
      image: '',
      numSemana: 'Semana 5 de Embarazo',
      slogan: '',
      textoSemana: Column(children: [Text('')])),
  6: Semana(
      image: '',
      numSemana: 'Semana 6 de Embarazo',
      slogan: '',
      textoSemana: Column(children: [Text('')])),
  7: Semana(
      image: '',
      numSemana: 'Semana 7 de Embarazo',
      slogan: '',
      textoSemana: Column(children: [Text('')])),
  8: Semana(
      image: '',
      numSemana: '8 semanas de Embarazo',
      slogan: 'El gran paso de embrión a feto',
      textoSemana: Column(children: [Text('')])),
  9: Semana(
      image: '',
      numSemana: '9 semanas de Embarazo',
      slogan: 'Tu bebé tiene el tamaño de una uva',
      textoSemana: Column(children: [Text('')])),
  10: Semana(
      image: '',
      numSemana: '10 semanas de Embarazo',
      slogan: 'Tu bebé empieza a moverse',
      textoSemana: Column(children: [Text('')])),
  11: Semana(
      image: '',
      numSemana: '11 semanas de Embarazo',
      slogan: 'Tu bebé se mueve libre',
      textoSemana: Column(children: [Text('')])),
  12: Semana(
      image: '',
      numSemana: '12 semanas de Embarazo',
      slogan: 'Su primera orina',
      textoSemana: Column(children: [Text('')])),
  13: Semana(
      image: '',
      numSemana: '13 semanas de Embarazo',
      slogan: 'Lo más difícil a pasado',
      textoSemana: Column(children: [Text('')])),
  14: Semana(
      image: '',
      numSemana: '14 semanas de Embarazo',
      slogan: 'Tu bebé ya funce el ceño',
      textoSemana: Column(children: [Text('')])),
  15: Semana(
      image: '',
      numSemana: '15 semanas de Embarazo',
      slogan: 'Despídete de las náuseas',
      textoSemana: Column(children: [Text('')])),
  16: Semana(
      image: '',
      numSemana: '16 semanas de Embarazo',
      slogan: 'Ya responde a estímulos externos',
      textoSemana: Column(children: [Text('')])),
  17: Semana(
      image: '',
      numSemana: '17 semanas de Embarazo',
      slogan: 'Ya puedes sentir al bebé',
      textoSemana: Column(children: [Text('')])),
  18: Semana(
      image: '',
      numSemana: '18 semanas de Embarazo',
      slogan: '¡Ahora puede oir tu corazón!',
      textoSemana: Column(children: [Text('')])),
  19: Semana(
      image: '',
      numSemana: '19 semanas de Embarazo',
      slogan: 'Tu bebé reconoce tu voz',
      textoSemana: Column(children: [Text('')])),
  20: Semana(
      image: '',
      numSemana: '20 semanas de Embarazo',
      slogan: 'La mitad de tu embarazo',
      textoSemana: Column(children: [Text('')])),
  21: Semana(
      image: '',
      numSemana: '21 semanas de Embarazo',
      slogan: 'Tu bebé se mueve seguido',
      textoSemana: Column(children: [Text('')])),
  22: Semana(
      image: '',
      numSemana: '22 semanas de Embarazo',
      slogan: 'Ya luce como será al nacer',
      textoSemana: Column(children: [Text('')])),
  23: Semana(
      image: '',
      numSemana: '23 semanas de Embarazo',
      slogan: 'Su piel toma color',
      textoSemana: Column(children: [Text('')])),
  24: Semana(
      image: '',
      numSemana: '24 semanas de Embarazo',
      slogan: 'Tu bebé siente sabores',
      textoSemana: Column(children: [Text('')])),
  25: Semana(
      image: '',
      numSemana: '25 semanas de Embarazo',
      slogan: 'Tu bebé ya tiene pestañas',
      textoSemana: Column(children: [Text('')])),
  26: Semana(
      image: '',
      numSemana: '26 semanas de Embarazo',
      slogan: '¡Empieza abrir sus ojitos!',
      textoSemana: Column(children: [Text('')])),
  27: Semana(
      image: '',
      numSemana: '27 semanas de Embarazo',
      slogan: 'Tu bebé parpadea',
      textoSemana: Column(children: [Text('')])),
  28: Semana(
      image: '',
      numSemana: '28 semanas de Embarazo',
      slogan: 'Percibe lo que le rodea',
      textoSemana: Column(children: [Text('')])),
  29: Semana(
      image: '',
      numSemana: '29 semanas de Embarazo',
      slogan: 'Tu bebé crece rápido',
      textoSemana: Column(children: [Text('')])),
  30: Semana(
      image: '',
      numSemana: '30 semanas de Embarazo',
      slogan: 'Comienza a cuenta regresiva',
      textoSemana: Column(children: [Text('')])),
  31: Semana(
      image: '',
      numSemana: '31 semanas de Embarazo',
      slogan: 'Sientes todos sus movimientos',
      textoSemana: Column(children: [Text('')])),
  32: Semana(
      image: '',
      numSemana: '32 semanas de Embarazo',
      slogan: 'Tiene sus uñas formadas',
      textoSemana: Column(children: [Text('')])),
  33: Semana(
      image: '',
      numSemana: '33 semanas de Embarazo',
      slogan: 'Tu bebé y sus 5 sentidos',
      textoSemana: Column(children: [Text('')])),
  34: Semana(
      image: '',
      numSemana: '34 semanas de Embarazo',
      slogan: 'Casi todo listo',
      textoSemana: Column(children: [Text('')])),
  35: Semana(
      image: '',
      numSemana: '35 semanas de Embarazo',
      slogan: 'El bebé toma posición',
      textoSemana: Column(children: [Text('')])),
  36: Semana(
      image: '',
      numSemana: '36 semanas de Embarazo',
      slogan: 'El bebé desciende',
      textoSemana: Column(children: [Text('')])),
  37: Semana(
      image: '',
      numSemana: '37 semanas de Embarazo',
      slogan: 'La recta final',
      textoSemana: Column(children: [Text('')])),
  38: Semana(
      image: '',
      numSemana: '38 semanas de Embarazo',
      slogan: 'Tu bebé ya está preparado',
      textoSemana: Column(children: [Text('')])),
  39: Semana(
      image: '',
      numSemana: '39 semanas de Embarazo',
      slogan: 'Puede nacer en cualquier momento',
      textoSemana: Column(children: [Text('')])),
  40: Semana(
      image: '',
      numSemana: '40 semanas de Embarazo',
      slogan: '¡Felicidades para tu bebé!',
      textoSemana: Column(children: [Text('')])),
};

class _SemanaState extends State<SemanaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            backgroundColor: appBarColor,
            leading: IconButton(
              icon: Icon(
                MdiIcons.arrowLeft,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            )),
        body: Builder(builder: ((context) {
          var semanaKey = widget.currentSemana;

          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 180,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/semanas/semana_2.jpg'))),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          semana[semanaKey]!.numSemana,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 22),
                        ),
                        Text(
                          semana[semanaKey]!.slogan,
                          style: TextStyle(
                              fontStyle: FontStyle.italic, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    child: semana[semanaKey]!.textoSemana,
                  ),
                )
              ],
            ),
          );
        })));
  }
}
