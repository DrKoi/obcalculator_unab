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
      textoSemana: 'Si tus ciclos son de 28 días la ovulación se produce el último día de esta semana, por lo que técnicamente aún no estás embarazada. Sin embargo, el médico va a contar las semanas de embarazo desde el primer día de tu FUR (Fecha Última Regla o menstruación) y no desde la concepción, por eso hablaremos de 2 semanas de embarazo, a pesar de que a estas alturas la fecundación aún no ocurre.' +
          '\nSi no recuerdas tu FUR o tus ciclos son muy irregulares, será la ecografía la que dará la última palabra con respecto al momento en que quedaste embarazada.' +
          '\nLas puntadas en los costados de tu abdomen son síntomas comunes durante este período. Normalmente éste es un indicador de ovulación, junto con la sensibilidad de los pechos. Además tu temperatura corporal basal suele aumentar de manera ligera.' +
          '\nEl útero empieza a formar el “forro” donde se implantará el huevo que se llama placenta y servirá para nutrir a tu bebé. En este momento tu útero se está preparando para la concepción.' +
          '\nTu volumen de sangre aumenta en un 50%, para afrontar la demanda de oxigeno del posible bebé que crecerá en tu interior. Dentro de tu cuerpo, estás creando un mundo seguro para que tu pequeño pueda desarrollarse, protegido del exterior.' +
          '\nTodavía no es posible confirmar con análisis si ya estás embarazada. Debes tener un poco de paciencia ya que debes esperar dos semanas más para confirmarlo, es decir, la fecha cuando tendría que aparecer tu menstruación.' +
          '\nOvulación' +
          '\nLa ovulación, que permitirá que un óvulo salga de tu ovario para encontrarse con un espermatozoide que lo fecunde, se desencadena por un aumento súbito de la producción de una hormona llamada LH.' +
          '\nEste proceso parte cuando la superficie del ovario comienza a presentar un abultamiento local, en cuyo vértice aparece una mancha llamada estigma. Esto produce la degeneración de la superficie del ovario, lo que da paso a un escape de líquido folicular por el estigma , que se abre gradualmente. Así se libera la tensión y el óvulo se desprende y es expulsado del ovario.' +
          '\nSin embargo, algunas mujeres no ovulan naturalmente por lo que para embarazarse toman fármacos, como el citrato de clomifeno, que estimula la liberación de esta hormona, provocando ovulaciones múltiples.' +
          '\nEs por esto que la frecuencia de embarazos múltiples aumenta hasta 10 veces cuando se induce la ovulación, pero también ocurren abortos espontáneos ya que no resulta posible la supervivencia de siete o más embriones.'),
  3: Semana(
      image: '',
      numSemana: 'Semana 3 de Embarazo',
      slogan: '',
      textoSemana: ''),
  4: Semana(
      image: '',
      numSemana: 'Semana 4 de Embarazo',
      slogan: '',
      textoSemana: ''),
  5: Semana(
      image: '',
      numSemana: 'Semana 5 de Embarazo',
      slogan: '',
      textoSemana: ''),
  6: Semana(
      image: '',
      numSemana: 'Semana 6 de Embarazo',
      slogan: '',
      textoSemana: ''),
  7: Semana(
      image: '',
      numSemana: 'Semana 7 de Embarazo',
      slogan: '',
      textoSemana: ''),
  8: Semana(
      image: '',
      numSemana: '8 semanas de Embarazo',
      slogan: 'El gran paso de embrión a feto',
      textoSemana: ''),
  9: Semana(
      image: '',
      numSemana: '9 semanas de Embarazo',
      slogan: 'Tu bebé tiene el tamaño de una uva',
      textoSemana: ''),
  10: Semana(
      image: '',
      numSemana: '10 semanas de Embarazo',
      slogan: 'Tu bebé empieza a moverse',
      textoSemana: ''),
  11: Semana(
      image: '',
      numSemana: '11 semanas de Embarazo',
      slogan: 'Tu bebé se mueve libre',
      textoSemana: ''),
  12: Semana(image: '', numSemana: '', slogan: '', textoSemana: ''),
  13: Semana(image: '', numSemana: '', slogan: '', textoSemana: ''),
  14: Semana(image: '', numSemana: '', slogan: '', textoSemana: ''),
  15: Semana(image: '', numSemana: '', slogan: '', textoSemana: ''),
  16: Semana(image: '', numSemana: '', slogan: '', textoSemana: ''),
  17: Semana(image: '', numSemana: '', slogan: '', textoSemana: ''),
  18: Semana(image: '', numSemana: '', slogan: '', textoSemana: ''),
  19: Semana(image: '', numSemana: '', slogan: '', textoSemana: ''),
  20: Semana(image: '', numSemana: '', slogan: '', textoSemana: ''),
  21: Semana(image: '', numSemana: '', slogan: '', textoSemana: ''),
  22: Semana(image: '', numSemana: '', slogan: '', textoSemana: ''),
  23: Semana(image: '', numSemana: '', slogan: '', textoSemana: ''),
  24: Semana(image: '', numSemana: '', slogan: '', textoSemana: ''),
  25: Semana(image: '', numSemana: '', slogan: '', textoSemana: ''),
  26: Semana(image: '', numSemana: '', slogan: '', textoSemana: ''),
  27: Semana(image: '', numSemana: '', slogan: '', textoSemana: ''),
  28: Semana(image: '', numSemana: '', slogan: '', textoSemana: ''),
  29: Semana(image: '', numSemana: '', slogan: '', textoSemana: ''),
  30: Semana(image: '', numSemana: '', slogan: '', textoSemana: ''),
  31: Semana(image: '', numSemana: '', slogan: '', textoSemana: ''),
  32: Semana(image: '', numSemana: '', slogan: '', textoSemana: ''),
  33: Semana(image: '', numSemana: '', slogan: '', textoSemana: ''),
  34: Semana(image: '', numSemana: '', slogan: '', textoSemana: ''),
  35: Semana(image: '', numSemana: '', slogan: '', textoSemana: ''),
  36: Semana(image: '', numSemana: '', slogan: '', textoSemana: ''),
  37: Semana(image: '', numSemana: '', slogan: '', textoSemana: ''),
  38: Semana(image: '', numSemana: '', slogan: '', textoSemana: ''),
  39: Semana(image: '', numSemana: '', slogan: '', textoSemana: ''),
  40: Semana(image: '', numSemana: '', slogan: '', textoSemana: ''),
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
          //TODO:-Se recibe desde el signo que toca, se usa para identificar en el map
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
                      child: Text(
                        semana[semanaKey]!.textoSemana,
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: 18),
                      )),
                )
              ],
            ),
          );
        })));
  }
}
