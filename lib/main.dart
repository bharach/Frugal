import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:patientapp/screens/languagetranslate/SelectLang.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'Models/patientdetail.dart';
import 'screens/dashboard/confrmApntmntBking_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale('fr');

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }
 AppointmentData? data;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Screen',
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'USA'), // USA
        Locale('fr', 'FR') // French
      ],
      locale: _locale,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
        textTheme: const TextTheme(
          headline6: TextStyle(
            color: Colors.white, // Set app bar title color
            fontSize: 20, // Adjust the title font size as needed
          ),
        ),
      ),
      home: const LanguageSelection(),
      // home: const ConfrmApntmntBooking(data: data!,),
    );
  }
}
