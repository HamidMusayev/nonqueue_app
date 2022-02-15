import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_UK': {
          'error': 'Wrong',
          'success': 'Successful',
          'alert': 'Alert',
          'nomessage': 'No message',
          'authfingerprint': 'Please complete the biometrics to proceed.',
          'passwordsmustbesame': 'Passwords must be same!',
          'login': 'Login',
          'register': 'Register'
        },
        'az_AZ': {
          'error': 'Uğursuz',
          'success': 'Hazırdır',
          'alert': 'Xəbərdarlıq',
          'nomessage': 'Mesaj yoxdur',
          'authfingerprint': 'Davam etmək üçün barmaq izindən istifadə edin.',
          'passwordsmustbesame': 'Şifrələr eyni olmalıdır!',
          'login': 'Giriş',
          'register': 'Qeydiyyat'
        },
      };
}
