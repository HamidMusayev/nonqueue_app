import 'dart:convert';

import 'package:crypto/crypto.dart';

class EncryptionHelper {
  static String hasPin(String input) =>
      md5.convert(utf8.encode('d1r${input}m3d')).toString();
}
