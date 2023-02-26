// import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
// import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

// import '../constants.dart';

// ignore: must_be_immutable
// class DateDisc extends StatefulWidget {
//   DateTime selectedDate;
//   DateDisc({
//     Key? key,
//     required this.selectedDate,
//   }) : super(key: key);

//   DateTime getSelectedDate() {
//     return selectedDate;
//   }

//   @override
//   _DateDiscState createState() => _DateDiscState();
// }

// class _DateDiscState extends State<DateDisc> {
//   var fFecha = DateFormat('dd-MM-yyyy');
//   late DateTime _selectedDate = widget.selectedDate;
//   late StreamController<DateTime> _dateStreamController;
//   late Stream<DateTime> _dateStream;
//   var fecha = DateTime.now();
//   late Offset _lastPoint;

//   @override
//   void initState() {
//     super.initState();
//     _selectedDate = DateTime.now();
//     _dateStreamController = StreamController<DateTime>();
//     _dateStream = _dateStreamController.stream;
//   }

//   @override
//   void dispose() {
//     _dateStreamController.close();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Container(
//         width: 300,
//         height: 300,
//         child: Stack(
//           children: [
//             _buildDateDisc(),
//             StreamBuilder<DateTime>(
//               stream: _dateStream,
//               builder: (context, snapshot) {
//                 if (!snapshot.hasData) {
//                   widget.selectedDate = DateTime.now();
//                   return Positioned(
//                     left: 0,
//                     right: 0,
//                     top: 0,
//                     bottom: 0,
//                     child: Center(
//                       child: Text(
//                         // '${snapshot.data!.day}/${snapshot.data!.month}/${snapshot.data!.year}',
//                         '${fFecha.format(DateTime.now())}',
//                         style: TextStyle(
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   );
//                 }
//                 widget.selectedDate = snapshot.data!;

//                 return Positioned(
//                   left: 0,
//                   right: 0,
//                   top: 0,
//                   bottom: 0,
//                   child: Center(
//                     child: Text(
//                       // '${snapshot.data!.day}/${snapshot.data!.month}/${snapshot.data!.year}',
//                       '${fFecha.format(snapshot.data!)}',
//                       style: TextStyle(
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildDateDisc() {
//     return GestureDetector(
//       onPanStart: (details) {
//         _lastPoint = details.localPosition;
//         setState(() {});
//       },
//       onPanEnd: (details) {},
//       onPanUpdate: (details) {
//         setState(() {
//           double angle = atan2(
//               details.localPosition.dy - 150, details.localPosition.dx - 150);
//           double lastAngle = atan2(_lastPoint.dy - 150, _lastPoint.dx - 150);
//           if (angle < 0) {
//             angle += 2 * pi;
//           }
//           int day = ((angle / (2 * pi)) * 365).floor() + 1;
//           _selectedDate =
//               DateTime(_selectedDate.year, 1, 1).add(Duration(days: day - 1));
//           _dateStreamController.add(_selectedDate);
//           _lastPoint = details.localPosition;
//         });
//       },
//       child: CustomPaint(
//         size: Size(300, 300),
//         painter: DateDiscPainter(_selectedDate),
//       ),
//     );
//   }
// }

class DateDiscPainter extends CustomPainter {
  final DateTime selectedDate;

  DateDiscPainter(this.selectedDate);

  @override
  void paint(Canvas canvas, Size size) {
    final double radius = 140;
    final double angleIncrement = 2 * pi / 365;
    final double startingAngle = -pi / 2;

    // Draw the background circle
    Paint backgroundPaint = Paint()..color = Colors.grey[200]!;
    canvas.drawCircle(Offset(150, 150), radius, backgroundPaint);

    // Draw the selected date indicator
    double selectedAngle =
        (Jiffy(selectedDate).dayOfYear - 1) * angleIncrement + startingAngle;
    Paint selectedPaint = Paint()..color = Colors.blue;
    canvas.drawArc(Rect.fromCircle(center: Offset(150, 150), radius: radius),
        selectedAngle, angleIncrement, true, selectedPaint);

    // Draw the day markers
    Paint markerPaint = Paint()..color = Colors.grey[400]!;
    for (int i = 0; i < 365; i++) {
      double angle = i * angleIncrement + startingAngle;
      Offset startPoint = Offset(
          150 + (radius - 20) * cos(angle), 150 + (radius - 20) * sin(angle));
      Offset endPoint =
          Offset(150 + radius * cos(angle), 150 + radius * sin(angle));
      canvas.drawLine(startPoint, endPoint, markerPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
