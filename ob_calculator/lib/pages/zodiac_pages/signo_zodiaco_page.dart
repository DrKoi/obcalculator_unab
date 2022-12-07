import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:ob_calculator/constants.dart';
import 'package:ob_calculator/pages/zodiac_pages/lista_signos.dart';

import '../../models/signo_zodiaco.dart';

class SignoZodiacoPage extends StatefulWidget {
  final String signo;
  SignoZodiacoPage(this.signo, {Key? key}) : super(key: key);

  @override
  State<SignoZodiacoPage> createState() => _SignoZodiacoPageState();
}

final Map<String, SignoZodiaco> zodiac = {
  //ARIES
  'Aries': SignoZodiaco(
      titulo: 'Aries',
      subtitulo: 'El carnero',
      descripcion: Column(
        children: [
          RichText(
              text: TextSpan(children: <TextSpan>[
            TextSpan(
                text:
                    'Los bebés del signo de Aries tienen un fuerte sentido del descubrimiento e impaciencia para experimentar el mundo a su alrededor. Les gusta tener libertad de acción para moverse y manifestar toda su energía. No tiene sentido del peligro, lo suyo es llamar la atención. Y si no consiguen lo que quieren, estallan rápidamente en rabietas.'),
            TextSpan(
              text:
                  '\n\nSon bebés traviesos y juguetones. Y en seguida notarás que quieren dominar y hacer ver que ellos son "los jefes".',
            ),
            TextSpan(
                text:
                    '\n\nGeneralmente, son chillones y ruidosos, además de impulsivos y valientes. Lo de compartir no es lo suyo y por ello tener que convivir con otros niños no es tarea fácil para sus papis.'),
            TextSpan(
                text:
                    '\n\nNormalmente son niños de carácter fuerte, llegando a ser hostiles y crueles si son reprimidos, y creativos si son animados a tener iniciativa.'),
            TextSpan(
                text:
                    '\n\nElementos positivos: Entusiasta, valiente, dinámico, competitivo, iniciador e independiente.'),
            TextSpan(
              text:
                  '\n\nElementos no tan positivos: Irritable, dominante, violento, intolerante, arrogante, brusco, "primero Yo", no escucha.',
            )
          ], style: TextStyle(fontSize: 18, color: Colors.black)))
        ],
      ),
      elemento: 'Fuego',
      planetaRegente: 'Marte y Plutón',
      image: 'assets/signos/aries.png',
      gema: 'Rubí'),

  //TAURO
  'Tauro': SignoZodiaco(
      titulo: 'Tauro',
      subtitulo: 'El toro',
      descripcion: Column(
        children: [
          RichText(
              text: TextSpan(children: <TextSpan>[
            TextSpan(
                text:
                    'Los niños tauro parecen tímidos, pero si les das la confianza que necesitan, se muestran serenos y libres. Además, son niños tranquilos, organizados, a los que les gusta la rutina y el trabajo. Por eso, no tendrán grandes problemas para educarlos tanto en casa como en el colegio.'),
            TextSpan(
                text:
                    '\nA los bebés Tauro les encantan la comodidad, la limpieza y la organización, principalmente si provienen del entorno familiar. En las tareas diarias, el bebé Tauro es obediente y tiene un fuerte sentido del deber, pero tiene su propio ritmo.'),
            TextSpan(
                text:
                    '\nA los niños de Tauro les encantan los buenos materiales, y al principio le notarás terco a la hora de compartir. Debes enseñarle a ser más desprendido con sus cosas, ya que les cuesta.'),
            TextSpan(
                text:
                    '\nY su lentitud en hacer las cosas es debido a algo de pereza. Si se le comprende será un niño fiable, constante y amigo. Conseguirá todo lo que materialmente desea.'),
            TextSpan(
                text:
                    '\n\nElementos positivos: Conservador, familiar, paciente, fiable, práctico, artístico, y leal.'),
            TextSpan(
              text:
                  '\n\nElementos no tan positivos: Lento, posesivo, avaricioso, materialista, desenfrenado, y obstinado.',
            )
          ], style: TextStyle(fontSize: 18, color: Colors.black)))
        ],
      ),
      elemento: 'Tierra',
      planetaRegente: 'Venus y Tierra',
      image: 'assets/signos/tauro.png',
      gema: 'Esperalda'),

  //GÉMINIS
  'Géminis': SignoZodiaco(
      titulo: 'Géminis',
      subtitulo: 'Los gemelos',
      descripcion: Column(
        children: [
          RichText(
              text: TextSpan(children: <TextSpan>[
            TextSpan(
                text:
                    'La simpatía es la característica principal de los bebés de Géminis. No son para nada tímidos. Les encanta relacionarse con los demás, y lo mejor de todo es... ¡que suelen caer muy bien a todo el mundo!'),
            TextSpan(
              text:
                  '\nGracias a su fuerte imaginación, ellos pueden aprender cualquier cosa que despierte su atención y curiosidad. De hecho, son niños muy curiosos, a los que les incentiva un problema, una duda... todo lo que suponga para ellos un nuevo descubrimiento.',
            ),
            TextSpan(
                text:
                    '\nSin embargo, prepárate y ármate de paciencia, porque los bebés géminis son muy habladores. También son alegres, comunicativos, y les encanta estar entre la gente.'),
            TextSpan(
                text:
                    '\nLos niños de Géminis tienen una esmerada habilidad con las manos. Conviene incentivarles a contactar con las artes, sobre todo con la música y los instrumentos musicales.'),
            TextSpan(
                text:
                    '\n\nElementos positivos: Sociable, curioso, diestro, comunicativo, expresivo, adaptable, literario, inventivo y alerta.'),
            TextSpan(
              text:
                  '\n\nElementos no tan positivos: Desagradecido, inquieto, intrigante, distraído, inconstante, cambiante, y nervioso',
            )
          ], style: TextStyle(fontSize: 18, color: Colors.black)))
        ],
      ),
      elemento: 'Tierra',
      planetaRegente: 'Venus y Tierra',
      image: 'assets/signos/geminis.png',
      gema: 'Esperalda'),

  //CÁNCER
  'Cáncer': SignoZodiaco(
      titulo: 'Cáncer',
      subtitulo: 'El cangrejo',
      descripcion: Column(
        children: [
          RichText(
              text: TextSpan(children: <TextSpan>[
            TextSpan(
                text:
                    'Nada más tranquilo para los bebés del signo de Cáncer que tener siempre la mamá o el papá cerca de ellos. Necesitan sentir su presencia para sentirse seguros. Cuando crezcan, sentirán que la familia es lo más importante en su vida.'),
            TextSpan(
              text:
                  '\nLos nacidos bajo este signo son cariñosos y extremadamente sensibles. Son hogareños, tímidos, y poseen una memoria privilegiada.',
            ),
            TextSpan(
                text:
                    '\nMás que nada y nadie, estos peques necesitan de atención y seguridad. Responden más a los sentimientos que a la razón, y para ellos la familia es lo primero.'),
            TextSpan(
                text:
                    '\nHay que tratarles con cariño y sinceridad, y su superación dependerá de que su imaginación sea bien dirigida. \nNo son muy amantes del orden. Más bien, tienden a ser desordenados. Y les encanta coleccionar cosas.'),
            TextSpan(
                text:
                    '\nLos niños del signo astrológico cáncer pertenecen al elemento de agua, por eso, el mar siempre funcionará como un poderoso efecto calmante sobre ellos. A los niños cáncer les encanta la playa y el mar, y también la luna, porque son tremendamente soñadores y sensibles.'),
            TextSpan(
                text:
                    '\nSon niños con mucha empatía, capaz de "absorber" los sentimientos de otra persona. Leen con facilidad en el mapa de las emociones de los demás, loq ue le llevará a vivir la vida de forma muy intensa. Debido a su gran empatía, a los niños cáncer se les educa muy bien explicándoles por qué deben hacer las cosas en relación a las emociones que despertarán en los demás.'),
            TextSpan(
                text:
                    '\n\nElementos positivos: Útil, sensible, doméstico, maternal, intuitivo, emotivo, tradicional, buena memoria.'),
            TextSpan(
              text:
                  '\n\nElementos no tan positivos: Quisquilloso, se siente herido con facilidad, negativo, manipulador, perezoso, egoísta, autocompasivo.',
            )
          ], style: TextStyle(fontSize: 18, color: Colors.black)))
        ],
      ),
      elemento: 'Tierra',
      planetaRegente: 'Venus y Tierra',
      image: 'assets/signos/cancer.png',
      gema: 'Esperalda'),

  //LEO
  'Leo': SignoZodiaco(
      titulo: 'Leo',
      subtitulo: 'El león',
      descripcion: Column(
        children: [
          RichText(
              text: TextSpan(children: <TextSpan>[
            TextSpan(
                text:
                    'Los niños del signo de Leo son las estrellas del hogar. Y probablemente, se convertirán en los reyes de la escuela, de su grupo de amigos, de la tele o del cine.'),
            TextSpan(
              text:
                  '\nHacen amistades con facilidad y les encanta ser el centro de las atenciones. Tienen brillo y por ello lideran siempre en los juegos y en las conversaciones. Son alegres, generosos, pero no se te ocurra reprimirles o darles órdenes, porque difícilmente las aceptarán. Se mostrarán más abiertos y más comprensibles a las sugerencias.',
            ),
            TextSpan(
                text:
                    '\nSon juguetones, risueños y parecen tener una fuente inagotable de energía, por lo que siempre están inmersos en una actividad diferente.'),
            TextSpan(
                text:
                    '\nSuelen aburrirse cuando se trata de seguir planes tranquilos y relajados, por lo que es mejor proponerles actividades al aire libre donde tengan espacio para divertirse y liberar su energía.'),
            TextSpan(
                text:
                    '\n\nElementos positivos: Ambicioso, generoso, seguro de sí mismo, orgulloso, idealista, digno, creativo, y romántico.'),
            TextSpan(
              text:
                  '\n\nElementos no tan positivos: Infantil, arrogante, miedo al ridículo, cruel, pretencioso, y un gran sentido crítico.',
            )
          ], style: TextStyle(fontSize: 18, color: Colors.black)))
        ],
      ),
      elemento: 'Tierra',
      planetaRegente: 'Venus y Tierra',
      image: 'assets/signos/leo.png',
      gema: 'Esperalda'),

  //VIRGO
  'Virgo': SignoZodiaco(
      titulo: 'Virgo',
      subtitulo: 'La virgen',
      descripcion: Column(
        children: [
          RichText(
              text: TextSpan(children: <TextSpan>[
            TextSpan(
                text:
                    'La perfección es lo que rige el día a día de los niños bajo el signo de Virgo. Son extremadamente ordenados, metódicos y sistemáticos. Se exigen mucho a sí mismos, pero también exigen a los demás.'),
            TextSpan(
              text:
                  '\nSon bebés que pueden distraerse durante horas con el juguete más sencillo que tengan, siempre que todo en su entorno esté limpio y bien guardado. Son vivaces y activos, aunque tímidos y partidario de la rutina.',
            ),
            TextSpan(
                text:
                    '\nLes cuesta exteriorizar sus emociones. También manejarlas. Se pondrán muy nerviosos ante la ira, la tristeza o el miedo, porque al ser muy "racionales", el mundo de las emociones no las controlan. Deberás ayudarle a calmarse y a entender por qué se siente así.'),
            TextSpan(
              text:
                  '\nCuidado porque puede volverse algo arrogante. Es recomendable aprovechar esa inagotable fuente de inteligencia para llenarle de información. Es necesario explicarle todo desde la lógica, si le castigas, simplemente dile por qué lo estás haciendo.',
            ),
            TextSpan(
                text:
                    '\n\nElementos positivos: Detallista, práctico, inteligente, analítico, servidores, cuidadosos.'),
            TextSpan(
              text:
                  '\n\nElementos no tan positivos: Crítico, juicioso, exigente, ansioso, brusco.',
            )
          ], style: TextStyle(fontSize: 18, color: Colors.black)))
        ],
      ),
      elemento: 'Tierra',
      planetaRegente: 'Venus y Tierra',
      image: 'assets/signos/virgo.png',
      gema: 'Esperalda'),
  'Libra': SignoZodiaco(
      titulo: 'Libra',
      subtitulo: 'La balanza',
      descripcion: Column(
        children: [
          RichText(
              text: TextSpan(children: <TextSpan>[
            TextSpan(
                text:
                    'Se puede decir que los niños de Libra son los más populares del zodíaco. Les encanta hacer amigos y además saben cultivarles y cuidarles.'),
            TextSpan(
              text:
                  '\nSon los más risueños, poseen un especial encanto y una gran generosidad, con lo cual se sentirán felices en compartir sus juguetes con los demás niños.',
            ),
            TextSpan(
                text:
                    '\nTiene un gran sentido de lo justo y responde con cariño en la mayoría de las veces, porque necesita sentirse querido y amado, por eso se debe evitar dejarle solo o hacer que se sienta poco apreciado.'),
            TextSpan(
                text:
                    '\nSiempre buscan la mediación y la perfección en todo lo que hacen. Esto les lleva a ser poco tolerantes con la frustración y a mostrar algo de celos. Les cuesta mucho tomar decisiones por preocuparse en no hacer daño a los demás'),
            TextSpan(
                text:
                    '\n\nElementos positivos: afables, refinados, artísticos, sociables, educados, persuasivos, y amantes de la paz. '),
            TextSpan(
              text:
                  '\n\nElementos no tan positivos: inconstantes, algo apáticos, intrigantes, inconformistas y quejicas.',
            )
          ], style: TextStyle(fontSize: 18, color: Colors.black)))
        ],
      ),
      elemento: 'Tierra',
      planetaRegente: 'Venus y Tierra',
      image: 'assets/signos/libra.png',
      gema: 'Esperalda'),

  //ESCORPIO
  'Escorpio': SignoZodiaco(
      titulo: 'Escorpio',
      subtitulo: 'El escorpión',
      descripcion: Column(
        children: [
          RichText(
              text: TextSpan(children: <TextSpan>[
            TextSpan(
                text:
                    'Poseedores de una gran energía, los niños de Escorpio son los más incansables y activos del zodíaco. Su fuerza personal esta en la lealtad. Además son niños profundamente sensibles, emotivos y susceptibles. Por eso es muy difícil saber lo que ellos quieren cuando empiezan a llorar, pueden hacerlo por cualquier motivo.'),
            TextSpan(
              text:
                  '\nA los niños nacidos bajo el signo de Escorpión hay que estimularles por el terreno de la investigación, eso canalizará su curiosidad natural y aprenderán a desarrollarse.',
            ),
            TextSpan(
                text:
                    '\nLos bebés Escorpio tienen la tendencia, por su signo zodiacal de tener un carácter fuerte, desconfiado y muy sensible.'),
            TextSpan(
                text:
                    '\nLos niños y niñas Escorpio pueden mostrarse muy tímidos y reservados desde muy pequeños. Por ello, es importante que los padres les ayuden a transmitir sus emociones. Si lloran es por algo. Y a la medida que van creciendo, sería aconsejable que les ayudasen a expresar las emociones, animarles a decir lo que están sintiendo.'),
            TextSpan(
                text:
                    '\n\nElementos positivos:  curiosos, ingeniosos e investigadores. Les encantan probar cosas nuevas e ir a fondo en todo. Motivados y apasionados'),
            TextSpan(
              text:
                  '\n\nElementos no tan positivos: reservados, retraídos, tímidos y algo inseguros, también suelen ser temperamentales, vengativos y rencorosos. ',
            )
          ], style: TextStyle(fontSize: 18, color: Colors.black)))
        ],
      ),
      elemento: 'Tierra',
      planetaRegente: 'Venus y Tierra',
      image: 'assets/signos/escorpion.png',
      gema: 'Esperalda'),

  //SAGITARIO
  'Sagitario': SignoZodiaco(
      titulo: 'Sagitario',
      subtitulo: 'El arquero',
      descripcion: Column(
        children: [
          RichText(
              text: TextSpan(children: <TextSpan>[
            TextSpan(
                text:
                    'Los rasgos característicos más importantes de los niños nacidos bajo el signo de Sagitario son la habilidad y la curiosidad. Son despiertos, ágiles y hábiles para el juego, lo que conviene guiarles hacia actividades deportivas, físicas y recreativas.'),
            TextSpan(
              text:
                  '\nA los niños de Sagitario les gusta conocer y explorar a los nuevos ambientes. Suelen ser bebés traviesos, que investigan y no se frenan ante ningún obstáculo. Por eso toda la atención es poca a la hora de llevarles a lugares públicos.',
            ),
            TextSpan(
                text:
                    '\nSon niños muy alegres y juguetones, y les encanta las actividades al aire libre. Cuando crezcan, mostrarán predisposición por los viajes a la montaña y la playa.'),
            TextSpan(
                text:
                    '\nEs conveniente mantenerles bajo límites desde pequeños para evitar futuras preocupaciones.'),
            TextSpan(
                text:
                    '\n\nElementos positivos: Generoso, optimista, religioso, entusiasta, atlético, franco, comprensivo, y filosófico.'),
            TextSpan(
              text:
                  '\n\nElementos no tan positivos: Exagerado, desenfrenado, brusco, impaciente, jugador, agresivo, e impetuoso.',
            )
          ], style: TextStyle(fontSize: 18, color: Colors.black)))
        ],
      ),
      elemento: 'Tierra',
      planetaRegente: 'Venus y Tierra',
      image: 'assets/signos/sagitario.png',
      gema: 'Esperalda'),

  //CAPRICORNIO
  'Capricornio': SignoZodiaco(
      titulo: 'Capricornio',
      subtitulo: 'La cabra de mar',
      descripcion: Column(
        children: [
          RichText(
              text: TextSpan(children: <TextSpan>[
            TextSpan(
                text:
                    'Los niños de Capricornio sorprenderán por su madurez. De hecho, muchas veces, los padres de niños capricornio aseguran que parecen adultos en cuerpos de niños. Desde bebés, los Capricornio parecen mayores de lo que son.'),
            TextSpan(
              text:
                  '\nSi les regañan se volverán melancólicos y tercos, pero si les estimula de una forma adecuada serán prácticos, cautelosos, responsables y ambiciosos.',
            ),
            TextSpan(
                text:
                    '\nDesde muy temprana edad, los niños capricornio no entenderán la espontaneidad de las personas. Quizás porque son niños serios y muy maduros. Un padre o una madre de niño Capricornio jamás deben forzarle a hacer lo que no quiere. A los niños de este signo no les gusta la presión ni las actitudes enérgicas.'),
            TextSpan(
                text:
                    '\nSi desean llevarles por aventuras, diversión, lo hagan de una forma muy sutil porque si ellos se sienten presionados o inducidos, puede que se aferren aún más a su forma controlada de vivir.'),
            TextSpan(
                text:
                    '\n\nElementos positivos: responsables, determinados, eficientes y serio en todo lo que hacen. Son perfeccionistas, trabajadores, escrupuloso y práctico.'),
            TextSpan(
              text:
                  '\n\nElementos no tan positivos: dominadores, melancólicos, ansiosos y en algunos casos, crueles. Son niños en lo que la mente rige el corazón. Son obstinados, severos, y fatalistas.',
            )
          ], style: TextStyle(fontSize: 18, color: Colors.black)))
        ],
      ),
      elemento: 'Tierra',
      planetaRegente: 'Venus y Tierra',
      image: 'assets/signos/capricornio.png',
      gema: 'Esperalda'),

  //ACUARIO
  'Acuario': SignoZodiaco(
      titulo: 'Acuario',
      subtitulo: 'El portador del agua',
      descripcion: Column(
        children: [
          RichText(
              text: TextSpan(children: <TextSpan>[
            TextSpan(
                text:
                    'Los bebés acuario mostrarán desde muy pequeños su curiosidad por las cosas. Son niños con una imaginación desbordante. Creativos, soñadores y nada convencionales. Los niños acuario no saben expresar bien sus sentimientos.'),
            TextSpan(
              text:
                  '\n\nPor lo general son los niños más rebeldes de todo el zodiaco, desde muy pequeños se puede comprobar que no respetan a las órdenes. Son niños impredecibles, así que ármate de paciencia.',
            ),
            TextSpan(
                text:
                    '\n\nSon multifacéticos, eléctricos, y están siempre en movimiento. Nunca se paran, por eso a veces pueden ser hiperactivos, y hay que enseñarles a centrarse.'),
            TextSpan(
                text:
                    '\n\nA los niños bajo el signo de Acuario les encanta la libertad y la soledad. Es un soñador, un idealista. Ante sus compañeros, será el "raro", y muchas veces esto le hará sentir "incomprendido".'),
            TextSpan(
                text:
                    '\n\n\nElementos positivos: Ingenioso, tolerante, individualista, artístico, lógico, humano, altruista, independiente, y progresivo.'),
            TextSpan(
              text:
                  '\n\n\nElementos no tan positivos: Temperamental, frío, tímido, excéntrico, impersonal, y rebelde.',
            )
          ], style: TextStyle(fontSize: 18, color: Colors.black)))
        ],
      ),
      elemento: 'Aire',
      planetaRegente: 'Urano y Saturno',
      image: 'assets/signos/acuario.png',
      gema: 'Amatista'),

  //PISCIS
  'Piscis': SignoZodiaco(
      titulo: 'Piscis',
      subtitulo: 'Los peces',
      descripcion: Column(
        children: [
          RichText(
              text: TextSpan(children: <TextSpan>[
            TextSpan(
                text:
                    'Profundamente soñadores, los niños nacidos bajo el signo de Piscis tienden a vivir en un mundo de fantasía, sin horarios ni rutina.'),
            TextSpan(
              text:
                  '\nSon cariñosos, amables y muy sensibles, pero pueden descontrolarse si viven alguna situación de conflicto. Aunque son tímidos, tienen un especial carisma que les hace estar cercados siempre de muchas amistades.',
            ),
            TextSpan(
                text:
                    '\nSon tremendamente generosos, bondadosos y con mucha empatía. Esto hace que algunas veces se lleguen a aprovechar de ellos.'),
            TextSpan(
                text:
                    '\nLa mejor forma de educar a un niño de Piscis es utilizando la afectividad. Los peques de este signo son extremadamente emotivos, y si sienten que su comportamiento hace sufrir a sus papis, entonces cambiarán.'),
            TextSpan(
                text:
                    '\n\nElementos positivos: Caritativo, compasivo, emotivo, sensible, introspectivo, intuitivo, y misericordioso.'),
            TextSpan(
              text:
                  '\n\nElementos no tan positivos: Pesimista, indolente, poco práctico, charlatán, melancólico, y emocionalmente reprimido.',
            )
          ], style: TextStyle(fontSize: 18, color: Colors.black)))
        ],
      ),
      elemento: 'Agua',
      planetaRegente: 'Neptuno y Júpiter',
      image: 'assets/signos/piscis.png',
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
            ),
            title: Text(
              'Signo zodiacal de tu bebé',
              style: TextStyle(color: rojoUnab),
            ),
            actions: [
              PopupMenuButton(
                icon: Padding(
                  padding: const EdgeInsets.only(right: 50.0),
                  child: Icon(
                    MdiIcons.dotsVertical,
                    color: azulUnab,
                    size: 35,
                  ),
                ),
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 'otrosSignos',
                    child: Text('Ver otros signos'),
                  ),
                ],
                onSelected: (value) {
                  if (value == 'otrosSignos') {
                    MaterialPageRoute route = MaterialPageRoute(
                      builder: (BuildContext context) => ListaSignos(),
                    );
                    Navigator.push(context, route);
                  }
                },
              )
            ]),
        body: Builder(builder: ((context) {
          var zodiacKey = widget.signo;

          return SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                      child: zodiac[zodiacKey]!.descripcion,
                    )),
              ],
            ),
          );
        })));
  }
}
