import 'dart:ffi';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:ob_calculator/pages/mostrar_datos.dart';
import 'package:ob_calculator/services/local_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import '../constants.dart';

class DobleDiscoGestacionalPage extends StatefulWidget {
  const DobleDiscoGestacionalPage({super.key});

  @override
  State<DobleDiscoGestacionalPage> createState() =>
      _DobleDiscoGestacionalPageState();
}

class _DobleDiscoGestacionalPageState extends State<DobleDiscoGestacionalPage> {
  //TODO:-LISTA CON FRACCIONES DEL RANGO DEL ANGLE DEL CIRCULO, Y FRACCIONES DE CADA UNO DE LOS
  //DOCE MESES POR LA CANTIDAD DE DÍAS DE CADA UNO

  //TODO:- Add sharedPreferences para guardar la fecha seleccionada Por la sesión de uso

  late num edadGestacionalenSemanas;
  final formKey = GlobalKey<FormState>();
  DateTime fechaSeleccionada = DateTime.now();
  var fFecha = DateFormat('dd-MM-yyyy');
  bool buttonPressed = false;
  bool mayorCuarenta = false;
  bool menorDos = false;
  final List<dynamic> datos = ['---', '---', '---', '---', '---', '---', '---'];
  double _angle1 = -math.pi / 31;
  double _angle2 = 0.0;
  double _oldAngle1 = 0.0;
  double _oldAngle2 = 0.0;
  double _angleDelta1 = 0.0;
  double _angleDelta2 = 0.0;
  double fpp = 0.0;
  double fechaSel = 0.0;
  //diferencia de extremos =
  //6.27740421908
  //6.25827635292
  //6.27045716715
  //6.27088082288
  //6.17919715003
  double fraccionMeses = (5031636852829 / 10000000000000);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  //MESES
                  Center(
                    child: Transform.rotate(
                      angle: _angle1,
                      //angle: -0.0172 * fpp,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          image: DecorationImage(
                              image:
                                  AssetImage('assets/Circular_calendar1.png')),
                          //borderRadius: BorderRadius.circular(10),
                          //shape: BoxShape.circle,
                        ),
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            Offset centerOfGestureDetector =
                                Offset(constraints.maxWidth / 2, 200);
                            return GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onPanStart: (details) {
                                final touchPositionFromCenter =
                                    details.localPosition -
                                        centerOfGestureDetector;
                                _angleDelta1 = _oldAngle1 -
                                    touchPositionFromCenter.direction;
                              },
                              onPanEnd: (details) {
                                setState(
                                  () {
                                    _oldAngle1 = _angle1;
                                  },
                                );
                              },
                              onPanUpdate: (details) {
                                final touchPositionFromCenter =
                                    details.localPosition -
                                        centerOfGestureDetector;

                                setState(
                                  () {
                                    _angle1 =
                                        touchPositionFromCenter.direction +
                                            _angleDelta1;
                                    print(_angle1);
                                    if (_angle1 < -0.006 &&
                                        _angle1 > -0.523169291666) {
                                      print('Enero');
                                    } else if (_angle1 < -0.523169291666 &&
                                        _angle1 > -0.9581875194021177) {
                                      print('febrero');
                                    } else if (_angle1 < -0.9581875194021177 &&
                                        _angle1 > -1.4746878980672269) {
                                      print('Marzo');
                                    } else if (_angle1 < -1.4746878980672269 &&
                                        _angle1 > -2.000632907696808) {
                                      print('Abril');
                                    } else if (_angle1 < -2.000632907696808 &&
                                        _angle1 > -2.5363837364553476) {
                                      print('Mayo');
                                    } else if (_angle1 > 3.8134141793756897 &&
                                        _angle1 < 3.2091266016242264) {
                                      print('Junio');
                                    } else if (_angle1 > 3.2091266016242264 &&
                                        _angle1 < 2.6660445608841017) {
                                      print('Julio');
                                    } else if (_angle1 > 2.6660445608841017 &&
                                        _angle1 < 2.1385302588390562) {
                                      print('Agosto');
                                    } else if (_angle1 > 2.1385302588390562 &&
                                        _angle1 < 1.6008717167798612) {
                                      print('Septiembre');
                                    } else if (_angle1 < 1.6008717167798612 &&
                                        _angle1 > 1.0624956777163852) {
                                      print('Octubre');
                                    } else if (_angle1 < 1.0624956777163852 &&
                                        _angle1 > -1.4746878980672269) {
                                      print('Noviembre');
                                    } else if (_angle1 < -0.9581875194021177 &&
                                        _angle1 > -1.4746878980672269) {
                                      print('Diciembre');
                                    }
                                  },
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ),

                  //DIAS
                  Center(
                    child: Transform.rotate(
                      angle: _angle2,
                      //angle: -0.0172 * fpp,
                      child: Container(
                        width: MediaQuery.of(context).size.width - 70,
                        height: MediaQuery.of(context).size.width - 70,
                        decoration: BoxDecoration(
                          color: Colors.purple,
                          image: DecorationImage(
                              image: AssetImage('assets/dias28.png')),
                          //shape: BoxShape.circle,
                          //borderRadius: BorderRadius.circular(10),
                        ),
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            Offset centerOfGestureDetector =
                                Offset(constraints.maxWidth / 2, 200);
                            return GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onPanStart: (details) {
                                final touchPositionFromCenter =
                                    details.localPosition -
                                        centerOfGestureDetector;
                                _angleDelta2 = _oldAngle2 -
                                    touchPositionFromCenter.direction;
                              },
                              onPanEnd: (details) {
                                setState(
                                  () {
                                    _oldAngle2 = _angle2;
                                  },
                                );
                              },
                              onPanUpdate: (details) {
                                final touchPositionFromCenter =
                                    details.localPosition -
                                        centerOfGestureDetector;

                                setState(
                                  () {
                                    _angle2 =
                                        touchPositionFromCenter.direction +
                                            _angleDelta2;
                                    print(_angle2);
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
                      child: Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      shape: BoxShape.circle,
                      //borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.asset(
                      'assets/calendar_arrow.png',
                      height: kDiameter - 90,
                      width: kDiameter - 90,
                    ),
                  )),
                  Center(
                      child: Container(
                    width: kDiameter - 90,
                    height: kDiameter - 90,
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
                      initialValue:
                          Jiffy(fechaSeleccionada).dayOfYear.toDouble(),
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
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              child: Builder(builder: (context) {
                                localeJiff();
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '${datos[1]}',
                                      style: TextStyle(
                                          fontSize: 25,
                                          color: azulUnab,
                                          fontWeight: FontWeight.w500),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      'Fecha probable de parto',
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: azulUnab,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                );
                              }),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Container(
                              child: Builder(builder: (context) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '${datos[0]}',
                                      style: TextStyle(
                                        fontSize: 25,
                                        color: azulUnab,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      'Edad Gestacional',
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: azulUnab,
                                          fontWeight: FontWeight.bold),
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
      ),
    );
  }

  Row campoFurPicker() {
    DateTime firstDate = DateTime.now().subtract(Duration(days: 6 + (7 * 40)));
    return Row(
      children: [
        Text('Fecha última regla: ',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Spacer(),
        Text(fFecha.format(fechaSeleccionada),
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        SizedBox(
          width: 10,
        ),
        Container(
          decoration: BoxDecoration(
              color: rojoUnab, borderRadius: BorderRadius.circular(30)),
          child: IconButton(
              color: Colors.white,
              onPressed: () {
                showDatePicker(
                  context: context,
                  initialDate: fechaSeleccionada,
                  firstDate: firstDate,
                  lastDate: DateTime.now(),
                  locale: Locale('es', 'ES'),
                ).then((fecha) {
                  setState(() {
                    fechaSeleccionada = fecha ?? fechaSeleccionada;
                    datos.clear();
                    fechaSel = Jiffy(fechaSeleccionada).dayOfYear.toDouble();
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
                              datos
                                  .add(edadGestacionalDias.toString() + ' día');
                            } else {
                              datos.add(
                                  edadGestacionalDias.toString() + ' días ');
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
                      fpp = Jiffy(fechaMesesSubstracted).dayOfYear.toDouble();
                      if (edadGestacionalSemanas > 1 &&
                          edadGestacionalSemanas < 41) {
                        buttonPressed = true;
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

                        /* for (int i = 0; i > 7; i++) {
                          LocaleStorage.prefs.setStringList('datos', [datos[i]]);
                        } */
                        /* await LocaleStorage.prefs.setStringList('datos', [
                          datos[0],
                          datos[1],
                          datos[2],
                          datos[3],
                          datos[4],
                          datos[5],
                          datos[7]
                        ]); */
                      } else if (edadGestacionalSemanas < 2) {
                        buttonPressed = false;
                        menorDos = true;
                      } else if (edadGestacionalSemanas > 40) {
                        buttonPressed = false;
                        mayorCuarenta = true;
                      }
                    });
                  });
                });
              },
              icon: Icon(
                MdiIcons.calendar,
                //size: 30,
                //color: Color(0xFF001B2B),
              )),
        ),
      ],
    );
  }

  void pesoPromedio(num edadGestacionalSemanas) {
    if (edadGestacionalSemanas < 8) {
      datos.add('Disponible desde la semana 8');
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
      datos.add('Disponible desde la semana 8');
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
      datos.add('Disponible desde la semana 13');
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
      datos.add('Disponible desde la semana 13');
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
              //print(LocaleStorage.prefs.getStringList('datos').toString());
              if (buttonPressed) {
                MaterialPageRoute route = MaterialPageRoute(
                  builder: (context) =>
                      MostrarDatos(datos, edadGestacionalenSemanas),
                );
                Navigator.push(context, route).then((value) {
                  setState(() {});
                });
              } else {
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      if (menorDos) {
                        return AlertDialog(
                            title: Text('No hay detalles que mostrar'),
                            content: Text(
                                'Para ver más detalles, la edad gestacional debe ser mayor o igual a 2 semanas.'),
                            actions: [
                              ElevatedButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text('Ok'))
                            ]);
                      } else if (mayorCuarenta) {
                        return AlertDialog(
                            title: Text('No hay detalles que mostrar'),
                            content: Text(
                                'Para ver más detalles, la edad gestacional debe ser menor o igual a 40 semanas.'),
                            actions: [
                              ElevatedButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text('Ok'))
                            ]);
                      } else {
                        return AlertDialog(
                            title: Text('No hay detalles que mostrar'),
                            content: Text(
                                'Para ver detalles debe seleccionar una fecha.'),
                            actions: [
                              ElevatedButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text('Ok'))
                            ]);
                      }
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
    } else if (fecha.isBetween(capricornio, Jiffy('12-31', 'MM-dd')) ||
        fecha.isBetween(Jiffy('1-1', 'MM-dd'), acuario)) {
      datos.add('Capricornio');
    } else {
      datos.add('error al agregar');
    }
  }

  void localeJiff() async {
    await Jiffy.locale('es');
  }
}
