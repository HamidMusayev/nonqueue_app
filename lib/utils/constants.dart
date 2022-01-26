import 'package:flutter/material.dart';

// const kDark = Color(0xFF14203E);
// const kShadow = Color(0x74507DFF);
//
// const kPrimary = Color(0xFF507DFF);
// const kPrimaryLight = Color(0xFF76BAFE);
//
// const kScaffoldBack = Color(0xFFF0F3FD);
// const kScaffoldBackDark = Color(0xFF0F121D);
//
// const kDarkModeWhite = Color(0xFF1E2430);
// const kRed = Color(0xFFFF5050);

class Spaces{
  Spaces._();
  static const horizontal6 = SizedBox(width: 6);

  static const vertical10 = SizedBox(height: 10);
  static const vertical20 = SizedBox(height: 20);
  static const vertical50 = SizedBox(height: 50);

}

class Paddings{
  Paddings._();
  static const p16 = EdgeInsets.all(16);
  static const p24 = EdgeInsets.all(24);
  static const p32 = EdgeInsets.all(32);
  static const p12 = EdgeInsets.all(12);
  static const p8 = EdgeInsets.all(8);
}

class Radiuses{
  Radiuses._();
  static const r8= BorderRadius.all(Radius.circular(10));
  static const r20 = BorderRadius.all(Radius.circular(10));
}
