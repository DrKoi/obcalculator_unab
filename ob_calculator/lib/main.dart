import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ob_calculator/pages/home_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ob_calculator/widgets/zoom.dart';

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

const Color p = Color(0xff001B2B);
const Color rojo = Color(0xff001B2B);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [GlobalMaterialLocalizations.delegate],
      supportedLocales: [const Locale('es')],
      title: 'Flutter Demo',
      theme: ThemeData(
        //colorScheme: ColorScheme(brightness: Brightness.light, primary: p, onPrimary: Colors.white, secondary: rojo, onSecondary: Colors.white, error: p, onError: Colors.white, background: rojo, onBackground: Colors.white, surface: rojo.withOpacity(10), onSurface: Colors.white,),
        primarySwatch: Colors.red,
        primaryColor: p,
        
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}
