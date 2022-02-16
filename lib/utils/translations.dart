import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_UK': {
          'error': 'Wrong',
          'success': 'Successful',
          'alert': 'Alert',
          'nomessage': 'No message',
          // 'authfingerprint': 'Please complete the biometrics to proceed.',
          'passwordsmustbesame': 'Passwords must be same!',
          'changedpassword': 'Password changed',
          'sendedotp': 'Verificcation code sent to your E-mail',
          'optverified': 'Code verified',
          'errorgooglesignin': 'Can not sign in with Google'
        },
        'az_AZ': {
          'error': 'Uğursuz',
          'success': 'Hazırdır',
          'alert': 'Xəbərdarlıq',
          'nomessage': 'Mesaj yoxdur',
          // 'authfingerprint': 'Davam etmək üçün barmaq izindən istifadə edin.',
          'passwordsmustbesame': 'Şifrələr eyni olmalıdır!',
          'changedpassword': 'Şifrəniz yeniləndi',
          'sendedotp': 'Təsdiqləmə kodu elektron poçtunuza göndərildi',
          'optverified': 'Kodunuz təsdiqləndi',
          'errorgooglesignin': 'Google ilə daxil olmaq alınmadı'
        },
      };
}
