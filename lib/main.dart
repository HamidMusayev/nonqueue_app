import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:nonqueue_app/screens/home/ui.dart';
import 'package:nonqueue_app/screens/welcome/ui.dart';
import 'package:nonqueue_app/utils/constants.dart';
import 'package:nonqueue_app/utils/shared.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _saveMe = false;
  User? _user;

  @override
  void initState() {
    getSavedData();
    super.initState();
  }

  void getSavedData() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    if (_prefs.getBool("saveMe") ?? false) {
      _user = User.fromJson(await SharedHelper.readJson('user'));
      if (_user != null && _user?.pinappusmast != null) {
        setState(() => _saveMe = true);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      showPerformanceOverlay: false,
      showSemanticsDebugger: false,
      debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: false,
      title: 'Non Queue',
      localizationsDelegates: const [GlobalMaterialLocalizations.delegate],
      supportedLocales: const [Locale("az")],
      theme: ThemeData(
        primarySwatch: Colors.pink,
        scaffoldBackgroundColor: Colors.white,
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            fixedSize: const Size(double.maxFinite, 60),
            backgroundColor: Colors.pink,
            primary: Colors.white,
            textStyle:
                const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            shape: const RoundedRectangleBorder(borderRadius: Radiuses.r10),
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.pink, size: 26),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: false,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300),
            borderRadius: Radiuses.r10,
          ),
          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: Radiuses.r10),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300),
            borderRadius: Radiuses.r10,
          ),
          // focusedBorder: OutlineInputBorder(
          //   borderSide: BorderSide(),
          //   borderRadius: Radiuses.r8,
          // ),
        ),
      ),
      home: !_saveMe ? WelcomeScreen() : const WelcomeScreen(),
    );
  }
}
