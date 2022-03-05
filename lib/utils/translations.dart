import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_UK': {
          //General
          'error': 'Wrong',
          'success': 'Successful',
          'alert': 'Alert',
          'nomessage': 'No message',
          'eauthor': 'Session timed out. Please log in again.',
          'erequest': 'Request error. Please contact us about problem.',
          'econnection': 'Connection error. Please check your connection.',
          //Account Screen
          'gender': 'Gender',
          'male': 'Male',
          'female': 'Female',
          'search': 'Search..',
          'wrongnumber': 'Wrong number!',
          'dateofbirth': 'Date of birth',
          'emailadress': 'Email address',
          'changepass': 'Change password',
          // 'authfingerprint': 'Please complete the biometrics to proceed.',
          //Additional-api
          'passwordsmustbesame': 'Passwords must be same!',
          'changedpassword': 'Password changed',
          'sendedotp': 'Verification code sent to your E-mail',
          'optverified': 'Code verified',
          'errorgooglesignin': 'Can not sign in with Google'
        },
        'az_AZ': {
          //General
          'error': 'Uğursuz',
          'success': 'Hazırdır',
          'alert': 'Xəbərdarlıq',
          'nomessage': 'Mesaj yoxdur',
          'eauthor':
              'Sessiyanızın vaxtı bitib. Zəhmət olmasa hesabınıza yenidən daxil olun.',
          'erequest': 'Sorğu xətası. Zəhmət olmasa bunu bizə bildirin.',
          'econnection': 'Bağlantı xətası. İnternet bağlantınızı yoxlayın.',
          //Account Screen
          'gender': 'Cinsiyyət',
          'male': 'Kişi',
          'female': 'Qadın',
          'search': 'Axtar..',
          'wrongnumber': 'Yalnış nömrə!',
          'dateofbirth': 'Doğum tarixi',
          'emailadress': 'Email ünvanı',
          'changepass': 'Şifrəni dəyiş',
          // 'authfingerprint': 'Davam etmək üçün barmaq izindən istifadə edin.',
          //Additional-api
          'passwordsmustbesame': 'Şifrələr eyni olmalıdır!',
          'changedpassword': 'Şifrəniz yeniləndi',
          'sendedotp': 'Təsdiqləmə kodu elektron poçtunuza göndərildi',
          'optverified': 'Kodunuz təsdiqləndi',
          'errorgooglesignin': 'Google ilə daxil olmaq alınmadı'
        },
      };
}
