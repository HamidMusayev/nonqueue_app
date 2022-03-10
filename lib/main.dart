import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:nonqueue_app/screens/auth/welcome/ui.dart';
import 'package:nonqueue_app/screens/home/ui.dart';
import 'package:nonqueue_app/utils/constants.dart';
import 'package:nonqueue_app/utils/translations.dart';

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
  //User? _user;

  // @override
  // void initState() {
  //   //getSavedData();
  //   super.initState();
  // }

  // void getSavedData() async {
  //   SharedPreferences _prefs = await SharedPreferences.getInstance();
  //   if (_prefs.getBool('saveMe') ?? false) {
  //     _user = User.fromJson(await SharedHelper.readJson('user'));
  //     if (_user != null && _user?.pinappusmast != null) {
  //       setState(() => _saveMe = true);
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      showPerformanceOverlay: false,
      showSemanticsDebugger: false,
      debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: false,
      title: 'Non Queue',
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: const [Locale('en', 'UK'), Locale('az', 'AZ'), Locale('ru', 'RU')],
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en', 'UK'),
      translations: Messages(),
      theme: ThemeData(
        primarySwatch: const MaterialColor(0xFFC25875, kcolor),
        scaffoldBackgroundColor: Colors.white,
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            fixedSize: const Size(double.maxFinite, 60),
            backgroundColor: ColorPalette.qlessApp,
            primary: Colors.white,
            textStyle:
                const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            shape: const RoundedRectangleBorder(borderRadius: Radiuses.r10),
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: ColorPalette.qlessApp, size: 26),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          filled: false,
          enabledBorder: OutlineInputBorder(
            borderRadius: Radiuses.r10,
            borderSide: BorderSide(
              color: ColorPalette.stroke,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: Radiuses.r10,
          ),
          border: OutlineInputBorder(
            borderRadius: Radiuses.r10,
            borderSide: BorderSide(
              color: ColorPalette.stroke,
            ),
          ),
          // focusedBorder: OutlineInputBorder(
          //   borderSide: BorderSide(),
          //   borderRadius: Radiuses.r8,
          // ),
        ),
      ),
      home: _saveMe ? HomeScreen() : const WelcomeScreen(),
    );
  }
}
