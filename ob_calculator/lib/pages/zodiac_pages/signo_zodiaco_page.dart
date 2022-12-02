import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:ob_calculator/constants.dart';

import '../../models/signo_zodiaco.dart';

class SignoZodiacoPage extends StatefulWidget {
  final String signo;
  SignoZodiacoPage(this.signo, {Key? key}) : super(key: key);

  @override
  State<SignoZodiacoPage> createState() => _SignoZodiacoPageState();
}

final Map<String, SignoZodiaco> zodiac = {
  'Aries': SignoZodiaco(
      titulo: 'Aries',
      subtitulo: 'El carnero',
      descripcion:
          'Aries es el Fuego originario, es pionero, valiente y muy capaz. La energía de Aries es tan grande que puede generarle conflictos, por su forma de actuar arrebatada y a veces agresiva. El Fuego de Aries arrasa con todo a su paso.',
      elemento: 'Fuego',
      planetaRegente: 'Marte y Plutón',
      image: 'assets/signos/Aries.svg.png',
      gema: 'Rubí'),
  'Tauro': SignoZodiaco(
      titulo: 'Tauro',
      subtitulo: 'El toro',
      descripcion:
          'Tauro está bien enraizado en Tierra fértil y dadora de seguridad. Protege y lucha por lo que es suyo, ya sean bienes materiales o vínculos afectivos. Llega a ser posesivo y testarudo al respecto. Persigue el bienestar material y la estabilidad emocional.',
      elemento: 'Tierra',
      planetaRegente: 'Venus y Tierra',
      image: 'assets/signos/Taurus.svg.png',
      gema: 'Esperalda'),
  'Géminis': SignoZodiaco(
      titulo: 'Géminis',
      subtitulo: 'Los gemelos',
      descripcion:
          'Géminis es etéreo y volátil como su elemento, tanto que a veces parece un eterno adolescente. Su mente está constantemente volando en reflexiones y búsqueda de conocimiento, por eso cambia constantemente y puede desconcertar a quienes lo rodean.',
      elemento: 'Tierra',
      planetaRegente: 'Venus y Tierra',
      image: 'assets/signos/Gemini.svg.png',
      gema: 'Esperalda'),
  'Cáncer': SignoZodiaco(
      titulo: 'Cáncer',
      subtitulo: 'El cangrejo',
      descripcion:
          'Es el primer signo de Agua y por tanto el más emocional de todo zodíaco. El Agua de Cáncer es de manantial, dulce y transparente, amante de la familia, el hogar, la tradición. Se rige por la intuición y el inconsciente.',
      elemento: 'Tierra',
      planetaRegente: 'Venus y Tierra',
      image: 'assets/signos/Cancer.svg.png',
      gema: 'Esperalda'),
  'Leo': SignoZodiaco(
      titulo: 'Leo',
      subtitulo: 'El león',
      descripcion:
          'La llama de Leo arde en su interior y brilla hacia fuera, por eso el León llama tanto la atención y mantiene su condición de rey del zodíaco. Necesita dominar y ser celebrado por los demás. Su orgullo es lo que le permite triunfar y no apagarse nunca.',
      elemento: 'Tierra',
      planetaRegente: 'Venus y Tierra',
      image: 'assets/signos/Leo.svg.png',
      gema: 'Esperalda'),
  'Virgo': SignoZodiaco(
      titulo: 'Virgo',
      subtitulo: 'La virgen',
      descripcion:
          'Virgo pisa más en Tierras movedizas. Es realista y persigue constantemente el orden y la perfección, sin embargo, no se cierra y tienen en cuenta las posibilidades de cambio y movimiento. A través del análisis y la reflexión, Virgo se transplanta a otra Tierra si es necesario.',
      elemento: 'Tierra',
      planetaRegente: 'Venus y Tierra',
      image: 'assets/signos/Virgo.svg.png',
      gema: 'Esperalda'),
  'Libra': SignoZodiaco(
      titulo: 'Libra',
      subtitulo: 'La balanza',
      descripcion:
          'Libra es el Aire de viento suave que acaricia y mantiene el equilibrio. Busca constantemente la belleza, la armonía y la justicia, tanto en su interior como en el mundo externo. Necesita socializar e identificarse con los demás.',
      elemento: 'Tierra',
      planetaRegente: 'Venus y Tierra',
      image: 'assets/signos/Libra.svg.png',
      gema: 'Esperalda'),
  'Escorpio': SignoZodiaco(
      titulo: 'Escorpio',
      subtitulo: 'El escorpión',
      descripcion:
          'El Agua de Escorpio es turbulenta y en constante movimiento. Siempre está buscando nuevas experiencias y respuestas. Debido a su sensibilidad, puede tener episodios depresivos o altibajos emocionales.',
      elemento: 'Tierra',
      planetaRegente: 'Venus y Tierra',
      image: 'assets/signos/Scorpio.svg.png',
      gema: 'Esperalda'),
  'Sagitario': SignoZodiaco(
      titulo: 'Sagitario',
      subtitulo: 'El arquero',
      descripcion:
          'El Fuego de Sagitario es el más estable y controlado, se aviva solo cuando es necesario. Mientras, vive al calor de su optimismo, alegría y sinceridad. Generalmente no se deprime ante la adversidad, porque con su inteligencia y actitud superadora, sabe que todo estará bien.',
      elemento: 'Tierra',
      planetaRegente: 'Venus y Tierra',
      image: 'assets/signos/Sagittarius.svg.png',
      gema: 'Esperalda'),
  'Capricornio': SignoZodiaco(
      titulo: 'Capricornio',
      subtitulo: 'La cabra de mar',
      descripcion:
          'Capricornio es Tierra dura, rocosa, camina sobre terreno montañoso en su afán de ascender y posicionarse. Su capacidad de supervivencia y su perseverancia y determinación hacen que pueda llegar a la cima. Recién cuando ha cumplido sus objetivos Capricornio puede relajarse y descomprimirse.',
      elemento: 'Tierra',
      planetaRegente: 'Venus y Tierra',
      image: 'assets/signos/Capricorn.svg.png',
      gema: 'Esperalda'),
  'Acuario': SignoZodiaco(
      titulo: 'Acuario',
      subtitulo: 'El portador del agua',
      descripcion:
          'Acuario es viento de cambio, conectado con la sabiduría y la conciencia universal. Su sabiduría se orienta hacia los ideales humanos, la innovación, la búsqueda de un mundo mejor. Persigue el progreso y la libertad.',
      elemento: 'Aire',
      planetaRegente: 'Urano y Saturno',
      image: 'assets/signos/Aquarius.svg.png',
      gema: 'Amatista'),
  'Piscis': SignoZodiaco(
      titulo: 'Piscis',
      subtitulo: 'Los peces',
      descripcion:
          'Piscis fluye en aguas correntosas que suelen ir en sentido opuesto. Es soñador e idealista, pero tan emocional que a veces no puede decidir cuál es la corriente en la que quiere nadar. Su naturaleza es contradictoria, por eso a veces no confía en su intuición.',
      elemento: 'Agua',
      planetaRegente: 'Neptuno y Júpiter',
      image: 'assets/signos/Pisces.svg.png',
      gema: 'Aquamarina'),
};

class _SignoZodiacoPageState extends State<SignoZodiacoPage> {
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
          var zodiacKey = widget.signo;

          return SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                          //color: Colors.black,
                          image: DecorationImage(
                              image: AssetImage(zodiac[zodiacKey]!.image))),
                    ),
                    Column(
                      children: [
                        Text(
                          zodiac[zodiacKey]!.titulo,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 22),
                        ),
                        Text(
                          zodiac[zodiacKey]!.subtitulo,
                          style: TextStyle(
                              fontStyle: FontStyle.italic, fontSize: 20),
                        ),
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        zodiac[zodiacKey]!.descripcion,
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
