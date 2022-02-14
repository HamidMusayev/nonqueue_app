import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_UK': {
          'error': 'Error',
          'login': 'Login',
          'register': 'Register'
        },
        'az_AZ': {
          'xəta': 'Xəta',
          'login': 'Giriş',
          'register': 'Qeydiyyat'
        },
        'tr_TR': {
          'login': 'Oturum aç',
          'register': 'Kayıt'
        },
        'ru_RU': {
          'login': 'Войти',
          'register': 'Pегистр'
        }
      };
}
