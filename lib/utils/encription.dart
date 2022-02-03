import 'dart:convert';
import 'package:crypto/crypto.dart';
// import 'package:flutter/services.dart' show rootBundle;
// import 'dart:ui' as ui;
// import 'dart:typed_data';

class EncriptionHelper {
  static String hasPin(String input) =>
      md5.convert(utf8.encode('d1r' + input + 'm3d')).toString();

  // Future<Uint8List?> getBytesFromAsset(
  //     {required String path, int? width}) async {
  //   ByteData data = await rootBundle.load(path);
  //   ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
  //       targetWidth: width);
  //   ui.FrameInfo fi = await codec.getNextFrame();
  //   return (await fi.image.toByteData(format: ui.ImageByteFormat.png))
  //       ?.buffer
  //       .asUint8List();
  // }
  //
  // Future<Uint8List?> getMapIcon() async {
  //   return await getBytesFromAsset(
  //       path: 'assets/splash/location.png', width: 40);
  // }
}
