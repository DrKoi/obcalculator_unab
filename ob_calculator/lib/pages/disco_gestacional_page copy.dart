import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:ob_calculator/pages/mostrar_datos.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import '../constants.dart';

class NewDiscoGestacionalPage extends StatefulWidget {
  const NewDiscoGestacionalPage({super.key});

  @override
  State<NewDiscoGestacionalPage> createState() =>
      _NewDiscoGestacionalPageState();
}

class _NewDiscoGestacionalPageState extends State<NewDiscoGestacionalPage> {
  late num edadGestacionalenSemanas;
  final formKey = GlobalKey<FormState>();
  DateTime fechaSeleccionada = DateTime.now();
  var fFecha = DateFormat('dd-MM-yyyy');
  bool buttonPressed = false;
  final List<dynamic> datos = ['---', '---', '---', '---', '---', '---', '---'];
  double _angle = 0.0;
  double _oldAngle = 0.0;
  double _angleDelta = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Center(
                  child: Transform.rotate(
                    angle: _angle,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/Circular_calendar1.png')),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          Offset centerOfGestureDetector =
                              Offset(constraints.maxWidth / 2, 130);
                          return GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onPanStart: (details) {
                              final touchPositionFromCenter =
                                  details.localPosition -
                                      centerOfGestureDetector;
                              _angleDelta =
                                  _oldAngle - touchPositionFromCenter.direction;
                            },
                            onPanEnd: (details) {
                              setState(
                                () {
                                  _oldAngle = _angle;
                                },
                              );
                            },
                            onPanUpdate: (details) {
                              final touchPositionFromCenter =
                                  details.localPosition -
                                      centerOfGestureDetector;

                              setState(
                                () {
                                  _angle = touchPositionFromCenter.direction +
                                      _angleDelta;
                                },
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Center(
                    child: Image.asset(
                  'assets/calendar_arrow.png',
                  height: kDiameter - 30,
                  width: kDiameter - 30,
                )),
                Center(
                    child: Container(
                  width: kDiameter - 30,
                  height: kDiameter - 30,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.transparent,
                      width: 20,
                      style: BorderStyle.solid,
                    ),
                  ),
                  child: SleekCircularSlider(
                    min: kMin,
                    max: kMax,
                    initialValue: Jiffy(fechaSeleccionada).dayOfYear.toDouble(),
                    appearance: CircularSliderAppearance(
                        size: kDiameter - 150,
                        startAngle: 269,
                        angleRange: 360,
                        customColors: CustomSliderColors(
                          trackColor: Colors.transparent,
                          dotColor: Colors.transparent,
                          progressBarColor: Colors.transparent,
                          hideShadow: true,
                          dynamicGradient: true,
                        ),
                        spinnerMode: false),
                    onChange: null,
                    innerWidget: (value) => Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Builder(builder: (context) {
                              localeJiff();
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '${datos[1]}',
                                    style: TextStyle(
                                        fontSize: 25, color: Colors.white),
                                  ),
                                  Text(
                                    'Fecha probable de parto',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white70),
                                  ),
                                ],
                              );
                            }),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            child: Builder(builder: (context) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '${datos[0]}',
                                    style: TextStyle(
                                        fontSize: 25, color: Colors.white),
                                  ),
                                  Text(
                                    'Edad Gestacional',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white70),
                                  ),
                                ],
                              );
                            }),
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
              ],
            ),
            flex: 3,
          ),
          Expanded(
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: campoFurPicker(),
                  ),
                  botonVerDetalles(),
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row campoFurPicker() {
    return Row(
      children: [
        Text('Fecha última regla: ',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Spacer(),
        Text(fFecha.format(fechaSeleccionada),
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        IconButton(
            color: Colors.grey,
            onPressed: () {
              showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2017),
                lastDate: DateTime.now(),
                locale: Locale('es', 'ES'),
              ).then((fecha) {
                setState(() {
                  fechaSeleccionada = fecha ?? fechaSeleccionada;
                  datos.clear();
                  buttonPressed = true;
                  setState(() {
                    var fechaMesesSubstracted = DateTime(
                        fechaSeleccionada.year + 1,
                        fechaSeleccionada.month - 3,
                        fechaSeleccionada.day + 7);
                    var edadGestacionalSemanas = Jiffy([
                      DateTime.now().year,
                      DateTime.now().month,
                      DateTime.now().day
                    ]).diff(
                        Jiffy([
                          fechaSeleccionada.year,
                          fechaSeleccionada.month,
                          fechaSeleccionada.day
                        ]),
                        Units.WEEK);
                    var edadGestacionalDias = (Jiffy([
                          DateTime.now().year,
                          DateTime.now().month,
                          DateTime.now().day
                        ]).diff(
                            Jiffy([
                              fechaSeleccionada.year,
                              fechaSeleccionada.month,
                              fechaSeleccionada.day
                            ]),
                            Units.DAY) %
                        7);

                    //EDAD GESTACIONAL
                    if (edadGestacionalDias == 0 &&
                        edadGestacionalSemanas == 0) {
                      datos.add('---');
                    } else {
                      if (edadGestacionalDias == 0) {
                        datos.add(
                            edadGestacionalSemanas.toString() + ' semanas ');
                      } else {
                        if (edadGestacionalSemanas == 0) {
                          if (edadGestacionalDias == 1) {
                            datos.add(edadGestacionalDias.toString() + ' día');
                          } else {
                            datos
                                .add(edadGestacionalDias.toString() + ' días ');
                          }
                        } else {
                          if (edadGestacionalDias == 1) {
                            if (edadGestacionalSemanas == 1) {
                              datos.add(edadGestacionalSemanas.toString() +
                                  ' semana y ' +
                                  edadGestacionalDias.toString() +
                                  ' día ');
                            } else {
                              datos.add(edadGestacionalSemanas.toString() +
                                  ' semanas y ' +
                                  edadGestacionalDias.toString() +
                                  ' día');
                            }
                          } else {
                            if (edadGestacionalSemanas == 1) {
                              datos.add(edadGestacionalSemanas.toString() +
                                  ' semana y ' +
                                  edadGestacionalDias.toString() +
                                  ' días ');
                            }
                            datos.add(edadGestacionalSemanas.toString() +
                                ' semanas y ' +
                                edadGestacionalDias.toString() +
                                ' días ');
                          }
                        }
                      }
                    }
                    edadGestacionalenSemanas = edadGestacionalSemanas;
                    //FECHA PROBABLE DE PARTO
                    datos.add(Jiffy(fechaMesesSubstracted).yMMMMd);
                    //PESO PROMEDIO DEL BEBÉ
                    pesoPromedio(edadGestacionalSemanas);
                    //TALLA PROMEDIO DEL BEBÉ
                    tallaPromedio(edadGestacionalSemanas);
                    //DIAMETRO BIPARIETAL DE ACUERDO A SU ETAPA DE GESTACIÓN
                    dBiParietal(edadGestacionalSemanas);
                    //LONGITUD DEL FÉMUR DEL BEBÉ
                    logitudFemur(edadGestacionalSemanas);

                    //SIGNO ZODIACAL
                    //var fechaMesDia = Jiffy(fechaMesesSubstracted).toString();
                    calcularSignoZodiaco(fechaMesesSubstracted);
                  });
                });
              });
            },
            icon: Icon(
              MdiIcons.calendar,
              size: 30,
              color: Color(0xFF001B2B),
            )),
      ],
    );
  }

  void pesoPromedio(num edadGestacionalSemanas) {
    if (edadGestacionalSemanas < 8) {
      datos.add('dato a partir de la semana 8');
    } else {
      switch (edadGestacionalSemanas) {
        case 8:
          {
            datos.add('1 gramo');
          }
          break;

        case 9:
          {
            datos.add('2 gramos');
          }
          break;

        case 10:
          {
            datos.add('4 gramos');
          }
          break;

        case 11:
          {
            datos.add('7 gramos');
          }
          break;

        case 12:
          {
            datos.add('14 gramos');
          }
          break;

        case 13:
          {
            datos.add('23 gramos');
          }
          break;

        case 14:
          {
            datos.add('43 gramos');
          }
          break;

        case 15:
          {
            datos.add('70 gramos');
          }
          break;

        case 16:
          {
            datos.add('100 gramos');
          }
          break;

        case 17:
          {
            datos.add('140 gramos');
          }
          break;

        case 18:
          {
            datos.add('190 gramos');
          }
          break;

        case 19:
          {
            datos.add('240 gramos');
          }
          break;

        case 20:
          {
            datos.add('300 gramos');
          }
          break;

        case 21:
          {
            datos.add('360 gramos');
          }
          break;

        case 22:
          {
            datos.add('430 gramos');
          }
          break;

        case 23:
          {
            datos.add('501 gramos');
          }
          break;

        case 24:
          {
            datos.add('600 gramos');
          }
          break;

        case 25:
          {
            datos.add('660 gramos');
          }
          break;

        case 26:
          {
            datos.add('760 gramos');
          }
          break;

        case 27:
          {
            datos.add('875 gramos');
          }
          break;

        case 28:
          {
            datos.add('1005 gramos');
          }
          break;

        case 29:
          {
            datos.add('1153 gramos');
          }
          break;

        case 30:
          {
            datos.add('1319 gramos');
          }
          break;

        case 31:
          {
            datos.add('1502 gramos');
          }
          break;

        case 32:
          {
            datos.add('1702 gramos');
          }
          break;

        case 33:
          {
            datos.add('1918 gramos');
          }
          break;

        case 34:
          {
            datos.add('2146 gramos');
          }
          break;

        case 35:
          {
            datos.add('2383 gramos');
          }
          break;

        case 36:
          {
            datos.add('2622 gramos');
          }
          break;

        case 37:
          {
            datos.add('2859 gramos');
          }
          break;

        case 38:
          {
            datos.add('3083 gramos');
          }
          break;

        case 39:
          {
            datos.add('3288 gramos');
          }
          break;

        case 40:
          {
            datos.add('3462 gramos');
          }
          break;

        case 41:
          {
            datos.add('3597 gramos');
          }
          break;

        case 42:
          {
            datos.add('3685 gramos');
          }
          break;

        case 43:
          {
            datos.add('3717 gramos');
          }
          break;

        default:
          {
            datos.add('---');
          }
          break;
      }
    }
  }

  void tallaPromedio(num edadGestacionalSemanas) {
    if (edadGestacionalSemanas < 8) {
      datos.add('dato a partir de la semana 8');
    } else {
      switch (edadGestacionalSemanas) {
        case 8:
          {
            datos.add('1,6 cm.');
          }
          break;

        case 9:
          {
            datos.add('2,3 cm.');
          }
          break;

        case 10:
          {
            datos.add('3,1 cm.');
          }
          break;

        case 11:
          {
            datos.add('4,1 cm.');
          }
          break;

        case 12:
          {
            datos.add('5,4 cm.');
          }
          break;

        case 13:
          {
            datos.add('7,4 cm.');
          }
          break;

        case 14:
          {
            datos.add('8,7 cm.');
          }
          break;

        case 15:
          {
            datos.add('10,1 cm.');
          }
          break;

        case 16:
          {
            datos.add('11,6 cm.');
          }
          break;

        case 17:
          {
            datos.add('13,0 cm.');
          }
          break;

        case 18:
          {
            datos.add('14,2 cm.');
          }
          break;

        case 19:
          {
            datos.add('15,3 cm.');
          }
          break;

        case 20:
          {
            datos.add('16,4 cm.');
          }
          break;

        case 21:
          {
            datos.add('26,7 cm.');
          }
          break;

        case 22:
          {
            datos.add('27,8 cm.');
          }
          break;

        case 23:
          {
            datos.add('28,9 cm.');
          }
          break;

        case 24:
          {
            datos.add('30,0 cm.');
          }
          break;

        case 25:
          {
            datos.add('34,6 cm.');
          }
          break;

        case 26:
          {
            datos.add('35,6 cm.');
          }
          break;

        case 27:
          {
            datos.add('36,6 cm.');
          }
          break;

        case 28:
          {
            datos.add('37,6 cm.');
          }
          break;

        case 29:
          {
            datos.add('38,6 cm.');
          }
          break;

        case 30:
          {
            datos.add('39,9 cm.');
          }
          break;

        case 31:
          {
            datos.add('41,1 cm.');
          }
          break;

        case 32:
          {
            datos.add('42,4 cm.');
          }
          break;

        case 33:
          {
            datos.add('43,7 cm.');
          }
          break;

        case 34:
          {
            datos.add('45,0 cm.');
          }
          break;

        case 35:
          {
            datos.add('46,2 cm.');
          }
          break;

        case 36:
          {
            datos.add('47,4 cm.');
          }
          break;

        case 37:
          {
            datos.add('48,6 cm.');
          }
          break;

        case 38:
          {
            datos.add('49,8 cm.');
          }
          break;

        case 39:
          {
            datos.add('50,7 cm.');
          }
          break;

        case 40:
          {
            datos.add('51,2 cm.');
          }
          break;

        case 41:
          {
            datos.add('51,7 cm.');
          }
          break;

        case 42:
          {
            datos.add('51,5 cm.');
          }
          break;

        case 43:
          {
            datos.add('51,3 cm.');
          }
          break;

        default:
          {
            datos.add('---');
          }
          break;
      }
    }
  }

  void dBiParietal(num edadGestacionalSemanas) {
    if (edadGestacionalSemanas < 14) {
      datos.add('dato a partir de la semana 13');
    } else {
      switch (edadGestacionalSemanas) {
        case 14:
          {
            datos.add('29,0 mm.');
          }
          break;

        case 15:
          {
            datos.add('32,3 mm.');
          }
          break;

        case 16:
          {
            datos.add('36,0 mm.');
          }
          break;

        case 17:
          {
            datos.add('39,7 mm.');
          }
          break;

        case 18:
          {
            datos.add('44,2 mm.');
          }
          break;

        case 19:
          {
            datos.add('45,7 mm.');
          }
          break;

        case 20:
          {
            datos.add('49,6 mm.');
          }
          break;

        case 21:
          {
            datos.add('52,3 mm.');
          }
          break;

        case 22:
          {
            datos.add('56,3 mm.');
          }
          break;

        case 23:
          {
            datos.add('58,5 mm.');
          }
          break;

        case 24:
          {
            datos.add('62,4 mm.');
          }
          break;

        case 25:
          {
            datos.add('65,8 mm.');
          }
          break;

        case 26:
          {
            datos.add('68,1 mm.');
          }
          break;

        case 27:
          {
            datos.add('70,9 mm.');
          }
          break;

        case 28:
          {
            datos.add('74,7 mm.');
          }
          break;

        case 29:
          {
            datos.add('77,6 mm.');
          }
          break;

        case 30:
          {
            datos.add('80,7 mm.');
          }
          break;

        case 31:
          {
            datos.add('82,4 mm.');
          }
          break;

        case 32:
          {
            datos.add('84,4 mm.');
          }
          break;

        case 33:
          {
            datos.add('85,2 mm.');
          }
          break;

        case 34:
          {
            datos.add('88,7 mm.');
          }
          break;

        case 35:
          {
            datos.add('89,3 mm.');
          }
          break;

        case 36:
          {
            datos.add('92,7 mm.');
          }
          break;

        case 37:
          {
            datos.add('93,1 mm.');
          }
          break;

        case 38:
          {
            datos.add('94,0 mm.');
          }
          break;

        case 39:
          {
            datos.add('94,6 mm.');
          }
          break;

        case 40:
          {
            datos.add('95,6 mm.');
          }
          break;

        case 41:
          {
            datos.add('98,5 mm.');
          }
          break;

        case 42:
          {
            datos.add('98,5 mm.');
          }
          break;

        case 43:
          {
            datos.add('98,5 mm.');
          }
          break;

        default:
          {
            datos.add('---');
          }
          break;
      }
    }
  }

  void logitudFemur(num edadGestacionalSemanas) {
    if (edadGestacionalSemanas < 14) {
      datos.add('dato a partir de la semana 13');
    } else {
      switch (edadGestacionalSemanas) {
        case 14:
          {
            datos.add('13,9 mm.');
          }
          break;

        case 15:
          {
            datos.add('16,8 mm.');
          }
          break;

        case 16:
          {
            datos.add('20,1 mm.');
          }
          break;

        case 17:
          {
            datos.add('23,4 mm.');
          }
          break;

        case 18:
          {
            datos.add('27,1 mm.');
          }
          break;

        case 19:
          {
            datos.add('30,5 mm.');
          }
          break;

        case 20:
          {
            datos.add('32,5 mm.');
          }
          break;

        case 21:
          {
            datos.add('34,0 mm.');
          }
          break;

        case 22:
          {
            datos.add('38,8 mm.');
          }
          break;

        case 23:
          {
            datos.add('39,8 mm.');
          }
          break;

        case 24:
          {
            datos.add('43,4 mm.');
          }
          break;

        case 25:
          {
            datos.add('45,8 mm.');
          }
          break;

        case 26:
          {
            datos.add('48,2 mm.');
          }
          break;

        case 27:
          {
            datos.add('50,2 mm.');
          }
          break;

        case 28:
          {
            datos.add('52,7 mm.');
          }
          break;

        case 29:
          {
            datos.add('55,3 mm.');
          }
          break;

        case 30:
          {
            datos.add('57,8 mm.');
          }
          break;

        case 31:
          {
            datos.add('59,1 mm.');
          }
          break;

        case 32:
          {
            datos.add('61,6 mm.');
          }
          break;

        case 33:
          {
            datos.add('63,3 mm.');
          }
          break;

        case 34:
          {
            datos.add('65,6 mm.');
          }
          break;

        case 35:
          {
            datos.add('67,8 mm.');
          }
          break;

        case 36:
          {
            datos.add('69,9 mm.');
          }
          break;

        case 37:
          {
            datos.add('70,9 mm.');
          }
          break;

        case 38:
          {
            datos.add('72,8 mm.');
          }
          break;

        case 39:
          {
            datos.add('73,1 mm.');
          }
          break;

        case 40:
          {
            datos.add('74,4 mm.');
          }
          break;

        case 41:
          {
            datos.add('77,0 mm.');
          }
          break;

        case 42:
          {
            datos.add('77,0 mm.');
          }
          break;

        case 43:
          {
            datos.add('77,0 mm.');
          }
          break;

        default:
          {
            datos.add('---');
          }
          break;
      }
    }
  }

  Container botonVerDetalles() {
    return Container(
        color: rojoUnab,
        height: 50,
        child: ElevatedButton.icon(
            onPressed: (() {
              if (buttonPressed) {
                MaterialPageRoute route = MaterialPageRoute(
                  builder: (context) =>
                      MostrarDatos(datos, edadGestacionalenSemanas),
                );
                Navigator.push(context, route).then((value) {
                  setState(() {});
                });
              }
            }),
            icon: Icon(MdiIcons.details),
            label: Text('Ver Otros datos')));
  }

  void calcularSignoZodiaco(DateTime fechaSeleccionada) {
    var fecha =
        Jiffy('${fechaSeleccionada.month}-${fechaSeleccionada.day}', 'MM-dd');
    var acuario = Jiffy('1-21', 'MM-dd');
    var piscis = Jiffy('2-20', 'MM-dd');
    var aries = Jiffy('3-21', 'MM-dd');
    var tauro = Jiffy('4-21', 'MM-dd');
    var geminis = Jiffy('5-21', 'MM-dd');
    var cancer = Jiffy('6-22', 'MM-dd');
    var leo = Jiffy('7-22', 'MM-dd');
    var virgo = Jiffy('8-23', 'MM-dd');
    var libra = Jiffy('9-23', 'MM-dd');
    var escorpio = Jiffy('10-23', 'MM-dd');
    var sagitario = Jiffy('11-23', 'MM-dd');
    var capricornio = Jiffy('12-22', 'MM-dd');

    if (fecha.isBetween(acuario, piscis)) {
      datos.add('Acuario');
    } else if (fecha.isBetween(piscis, aries)) {
      datos.add('Piscis');
    } else if (fecha.isBetween(aries, tauro)) {
      datos.add('Aries');
    } else if (fecha.isBetween(tauro, geminis)) {
      datos.add('Tauro');
    } else if (fecha.isBetween(geminis, cancer)) {
      datos.add('Géminis');
    } else if (fecha.isBetween(cancer, leo)) {
      datos.add('Cáncer');
    } else if (fecha.isBetween(leo, virgo)) {
      datos.add('Leo');
    } else if (fecha.isBetween(virgo, libra)) {
      datos.add('Libra');
    } else if (fecha.isBetween(libra, escorpio)) {
      datos.add('Libra');
    } else if (fecha.isBetween(escorpio, sagitario)) {
      datos.add('Escorpio');
    } else if (fecha.isBetween(sagitario, capricornio)) {
      datos.add('Sagitario');
    } else if (fecha.isBetween(capricornio, acuario)) {
      datos.add('Capricornio');
    } else {
      datos.add('error al agregar');
    }
  }

  void localeJiff() async {
    await Jiffy.locale('es');
  }
}
