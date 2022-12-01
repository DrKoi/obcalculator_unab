import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:ob_calculator/constants.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class disco extends StatelessWidget {
  const disco({
    Key? key,
    required this.progressVal,
    required this.fFecha,
    required this.fecha,
    required this.datos,
    /* required this.buttonPressed */
  }) : super(key: key);

  final double progressVal;
  final fFecha;
  final fecha;
  final datos;

  //get fechaSeleccionada => null;
  //dynamic buttonPressed;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      //Center(child: CustomArc()),
      Center(
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: Image(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width,
              fit: BoxFit.fill,
              image: AssetImage('assets/Circular_calendar1.png')),
        ),
      ),
      Center(
          child: Container(
        width: kDiameter + 30,
        height: kDiameter + 30,
        decoration: BoxDecoration(
            color: Colors.transparent,
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.transparent,
              width: 20,
              style: BorderStyle.solid,
            ),
            boxShadow: [
              BoxShadow(
                  blurRadius: 30,
                  spreadRadius: 10,
                  color: Colors.blue.withAlpha(
                      normalize(progressVal * 20000, 100, 255).toInt()),
                  offset: Offset(1, 3))
            ]),
        child: SleekCircularSlider(
          //onChangeStart: ,
          //onChangeEnd: ,
          min: kMin,
          max: kMax,
          initialValue: Jiffy(fecha).dayOfYear.toDouble(),
          appearance: CircularSliderAppearance(
              size: kDiameter - 150,
              startAngle: 269,
              angleRange: 360,
              customColors: CustomSliderColors(
                //progressBarColors: [Colors.red, azulUnab],
                trackColor: Colors.red,
                dotColor: azulUnab,
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
                    //var fur = Jiffy(fechaJiffy).subtract();
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${datos[1]}',
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                        Text(
                          'Fecha probable de parto',
                          style: TextStyle(fontSize: 20, color: Colors.white70),
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
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                        Text(
                          'Edad Gestacional',
                          style: TextStyle(fontSize: 20, color: Colors.white70),
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
    ]);
  }

  void localeJiff() async {
    await Jiffy.locale('es');
  }
}
