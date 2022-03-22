import 'dart:ui';

import 'package:get/get.dart';

class CustomDrawerController extends GetxController {
  List<Map<String, String>> languages = [
    {
      'name': 'Azerbaijani',
      'icon': 'az.png',
      'locale': 'az',
      'locale2': 'AZ',
    },
    {
      'name': 'English',
      'icon': 'us.png',
      'locale': 'en',
      'locale2': 'GB',
    },
    // {
    //   'name': 'Russian',
    //   'icon': 'ru.png',
    //   'locale': 'ru',
    //   'locale2': 'RU',
    // },
  ];

  late Map<String, String> activeLang = languages.first;

  void updateLanguage(Map<String, String>? lang) {
    if (lang != null) {
      Get.updateLocale(Locale(lang['locale']!, lang['locale2']));
      activeLang = lang;
      update();
    }
  }
}
