import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ob_calculator/circulartest.dart';
import 'package:ob_calculator/constants.dart';
import 'package:ob_calculator/pages/disco_disco.dart';
import 'package:ob_calculator/pages/home_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ob_calculator/pages/semana_pages/semana_page.dart';

import 'material_color_generator.dart';

final ThemeData theme = ThemeData(
  primarySwatch: generateMaterialColor(Palette.primary),
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

class Palette {
  static const Color primary = rojoUnab;
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: [const Locale('es')],
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: HomePage(),
      // home: DateDisc(),
    );
  }
}
