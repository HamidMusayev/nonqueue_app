import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ColorPalette {
  ColorPalette._();
  static const qlessApp = Color(0xFFC25875);
  static const couponColor = Color(0xFF8E4055);
  static const lightBlack = Color(0xFF252733);
  static const nonQueue = Color(0xFF8073B5);
  static const editColor = Color(0xFF40B9FF);
  static const greyInputText = Color(0xFF999CAD);
  static const stroke = Color(0xFFE2E8F0);
  static const glassEffect = Color(0xFFFAFAFA);
}

MaterialColor colorCustom = const MaterialColor(0xFFC25875, kcolor);

const Map<int, Color> kcolor = {
  50: Color.fromRGBO(194, 88, 117, .1),
  100: Color.fromRGBO(194, 88, 117, .2),
  200: Color.fromRGBO(194, 88, 117, .3),
  300: Color.fromRGBO(194, 88, 117, .4),
  400: Color.fromRGBO(194, 88, 117, .5),
  500: Color.fromRGBO(194, 88, 117, .6),
  600: Color.fromRGBO(194, 88, 117, .7),
  700: Color.fromRGBO(194, 88, 117, .8),
  800: Color.fromRGBO(194, 88, 117, .9),
  900: Color.fromRGBO(194, 88, 117, 1),
};

class Spaces {
  Spaces._();
  static const horizontal6 = SizedBox(width: 6);
  static const vertical10 = SizedBox(height: 10);
  static const vertical20 = SizedBox(height: 20);
  static const vertical50 = SizedBox(height: 50);
}

class Paddings {
  Paddings._();
  static const p16 = EdgeInsets.all(16);
  static const p24 = EdgeInsets.all(24);
  static const p32 = EdgeInsets.all(32);
  static const p12 = EdgeInsets.all(12);
  static const p8 = EdgeInsets.all(8);
}

class Radiuses {
  Radiuses._();
  static const r10 = BorderRadius.all(Radius.circular(10));
  static const r20 = BorderRadius.all(Radius.circular(20));
}

class Snacks {
  Snacks._();
  static GetSnackBar error(String message) {
    return GetSnackBar(
      message: 'error'.tr,
      title: message.isEmpty ? 'nomessage'.tr : message,
      padding: Paddings.p24,
      margin: Paddings.p12,
      duration: const Duration(milliseconds: 2500),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red.shade600,
      borderRadius: 10,
      icon: const Icon(
        Icons.cancel_rounded,
        color: Colors.white,
        size: 30,
      ),
    );
  }

  static GetSnackBar success(String message) {
    return GetSnackBar(
      message: 'success'.tr,
      title: message.isEmpty ? 'nomessage'.tr : message,
      padding: Paddings.p24,
      margin: Paddings.p12,
      duration: const Duration(milliseconds: 2500),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green.shade600,
      borderRadius: 10,
      icon: const Icon(
        Icons.check_circle,
        color: Colors.white,
        size: 30,
      ),
    );
  }
}
