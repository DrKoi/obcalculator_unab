import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:ob_calculator/pages/disco_disco.dart';
import 'package:ob_calculator/pages/mostrar_datos.dart';

import '../constants.dart';

class NewDiscoGestacionalPage extends StatefulWidget {
  const NewDiscoGestacionalPage({super.key});

  @override
  State<NewDiscoGestacionalPage> createState() =>
      _NewDiscoGestacionalPageState();
}

class _NewDiscoGestacionalPageState extends State<NewDiscoGestacionalPage> {
// late DateTime _selectedDate = widget.selectedDate;
  late DateTime _selectedDate = DateTime.now();
  late StreamController<DateTime> _dateStreamController;
  late Stream<DateTime> _dateStream;
  var fecha = DateTime.now();
  late Offset _lastPoint;

  late num edadGestacionalenSemanas;
  final formKey = GlobalKey<FormState>();
  DateTime fechaSeleccionada = DateTime.now();
  var fFecha = DateFormat('dd-MM-yyyy');
  bool buttonPressed = false;
  bool mayorCuarenta = false;
  bool menorDos = false;
  final List<dynamic> datos = ['---', '---', '---', '---', '---', '---', '---'];
  double fpp = 0.0;
  double fechaSel = 0.0;
  DateTime fechaRestada = DateTime.now();

  // late DateTime fecha;
  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
    _dateStreamController = StreamController<DateTime>();
    _dateStream = _dateStreamController.stream;
  }

  @override
  void dispose() {
    _dateStreamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    'Bienvenid@',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    'Para seleccionar una fecha arrastra el disco, luego pulsa el botón para ver tus resultados',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Stack(alignment: Alignment.center, children: [
              Center(
                child: Image.asset(
                  'assets/Circular_calendar1.png',
                  //color: Colors.white,
                  height: kDiameter,
                  width: kDiameter,
                ),
              ),
              discoDatePicker(),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: rojoUnab),
              padding: const EdgeInsets.all(8.0),
              child: botonVerDetalles(fechaRestada),
            ),
          ),
        ],
      ),
    );
  }

  Container discoDatePicker() {
    return Container(
      width: 300,
      height: 300,
      child: Stack(
        children: [
          _buildDateDisc(),
          StreamBuilder<DateTime>(
            stream: _dateStream,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                fecha = DateTime.now();
                return Positioned(
                  left: 0,
                  right: 0,
                  top: 0,
                  bottom: 0,
                  child: Center(
                    child: Text(
                      // '${snapshot.data!.day}/${snapshot.data!.month}/${snapshot.data!.year}',
                      '${fFecha.format(fecha)}',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              }
              fecha = snapshot.data!;

              var jiffy1 = Jiffy(fecha, "yyyy-MM-dd");
              var jiffy2 = Jiffy(DateTime.now(), "yyyy-MM-dd");
              if (jiffy1.isAfter(jiffy2)) {
                fechaRestada = DateTime(
                    fecha.year - 1,
                    fecha.month,
                    fecha.day,
                    fecha.hour,
                    fecha.minute,
                    fecha.second,
                    fecha.millisecond,
                    fecha.microsecond);
              } else {
                fechaRestada = fecha;
              }
              return Positioned(
                left: 0,
                right: 0,
                top: 0,
                bottom: 0,
                child: Center(
                  child: Text(
                    // '${snapshot.data!.day}/${snapshot.data!.month}/${snapshot.data!.year}',
                    '${fFecha.format(fechaRestada)}',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDateDisc() {
    return GestureDetector(
      onPanStart: (details) {
        _lastPoint = details.localPosition;
        setState(() {});
      },
      onPanEnd: (details) {},
      onPanUpdate: (details) {
        setState(() {
          double angle = atan2(
              details.localPosition.dy - 150, details.localPosition.dx - 150);
          double lastAngle = atan2(_lastPoint.dy - 150, _lastPoint.dx - 150);
          if (angle < 0) {
            angle += 2 * pi;
          }
          int day = ((angle / (2 * pi)) * 365).floor() + 1;
          _selectedDate =
              DateTime(_selectedDate.year, 1, 1).add(Duration(days: day - 1));
          _dateStreamController.add(_selectedDate);
          _lastPoint = details.localPosition;
        });
      },
      child: CustomPaint(
        size: Size(500, 500),
        painter: DateDiscPainter(_selectedDate),
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

  Container botonVerDetalles(DateTime fecha) {
    return Container(
        color: rojoUnab,
        height: 50,
        child: ElevatedButton.icon(
            onPressed: (() {
              setState(() {
                fechaSeleccionada = fecha;
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
                  if (edadGestacionalDias == 0 && edadGestacionalSemanas == 0) {
                    datos.add('---');
                  } else {
                    if (edadGestacionalDias == 0) {
                      datos
                          .add(edadGestacionalSemanas.toString() + ' semanas ');
                    } else {
                      if (edadGestacionalSemanas == 0) {
                        if (edadGestacionalDias == 1) {
                          datos.add(edadGestacionalDias.toString() + ' día');
                        } else {
                          datos.add(edadGestacionalDias.toString() + ' días ');
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
            label: Text('Ver Datos')));
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
