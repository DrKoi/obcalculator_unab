import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ob_calculator/constants.dart';
import 'package:ob_calculator/pages/home_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [GlobalMaterialLocalizations.delegate],
      supportedLocales: [const Locale('es')],
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme,
      home: HomePage(),
    );
  }
}
