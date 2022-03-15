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
          'emailadress': 'E-mail address',
          'changepass': 'Change password',
          // 'authfingerprint': 'Please complete the biometrics to proceed.',
          //Additional-api
          'passwordsmustbesame': 'Passwords must be same!',
          'changedpassword': 'Password changed',
          'sendedotp': 'Verification code sent to your E-mail',
          'optverified': 'Code verified',
          'errorgooglesignin': 'Can not sign in with Google',
          //login_uidart
          'welcomeback': 'Welcome back',
          'enteremailpasswordlogin': 'Enter your E-mail and password to login',
          'password': 'Password',
          'login': 'LOGIN',
          'donothaveaccount': 'Don’t have an account?',
          'signup': ' Sign up',
          //onboard
          'continuegoogle': 'Continue with Google',
          'continueapple': 'Continue with Apple',
          'alreadyhaveaccount': 'Already have an account?',
          'loginupper': 'LOG IN',
          //otp
          'enterotp': 'Enter OTP',
          'wesentitto': 'We sent it to',
          //pswforgot
          'forgotpassword': 'Forgot Password?',
          'donotworryithappens': 'Don’t worry! Please enter the E-mail address ',
          'emailaddressphonenumber': 'E-mail address/phone number',
          'submit': 'Submit',
          //pswreset
          'newpassword': 'New password',
          'confirmnewpassword': 'Confirm new password',
          'changepassword': 'Change Password',
          //register
          'welcome': 'Welcome!',
          'youaregoingtosignupnonqueue':
              'You are going to sign up to Non-Queue',
          'fullname': 'Full name',
          'exfullname': 'Ex: Hamid Musayev',
          'bysigningupagreepolicy':
              'By signing up, you’re agree to our Terms & Conditions and Private Policy',
          //welcome
          'orderbeforego': 'Order before you go!',
          'makefriendshappysendgifts':
              'Make your friends happy by sending them gifts!',
          'getorderwithoutwaiting': 'Get your order without waiting!',
          'getstarted': 'Get Started',
          'next': 'Next'
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
          'emailadress': 'E-mail ünvanınız',
          'changepass': 'Şifrəni dəyiş',
          // 'authfingerprint': 'Davam etmək üçün barmaq izindən istifadə edin.',
          //Additional-api
          'passwordsmustbesame': 'Şifrələr eyni olmalıdır!',
          'changedpassword': 'Şifrəniz yeniləndi',
          'sendedotp': 'Təsdiqləmə kodu elektron poçtunuza göndərildi',
          'optverified': 'Kodunuz təsdiqləndi',
          'errorgooglesignin': 'Google ilə daxil olmaq alınmadı',
          //login_uidart
          'welcomeback': 'Yenidən xoş gəldiniz',
          'enteremailpasswordlogin':
              'Daxil olmaq üçün E-mail və şifrənizi yazın',
          'password': 'Şifrəniz',
          'login': 'Daxil ol',
          'donothaveaccount': 'Hesabınız yoxdur?',
          'signup': ' Qeydiyyatdan keç',
          //onboard
          'continuegoogle': 'Google ilə davam edin',
          'continueapple': 'Apple ilə davam edin',
          'alreadyhaveaccount': 'Artıq hesabınız var?',
          'loginupper': 'DAXIL OL',
          //otp
          'enterotp': 'OTP daxil edin',
          'wesentitto': 'Təsdiq kodunuz göndərildi',
          //pswforgot
          'forgotpassword': 'Şifrəni unutdunuz?',
          'donotworryithappens':
              'Narahat olmayın! Zəhmət olmasa E-mail ünvanınızı daxil edin',
          'emailaddressphonenumber': 'E-mail ünvanı/telefon nömrəsi',
          'submit': 'Təsdiq Et',
          //pswreset
          'newpassword': 'Yeni şifrə',
          'confirmnewpassword': 'Yeni şifrənizi təsdiq edin',
          'changepassword': 'Şifrəni dəyiş',
          //register
          'welcome': 'Xoş gəldiniz!',
          'youaregoingtosignupnonqueue':
              'Siz "Non-Queue"-da qeydiyyatdan keçəcəksiniz',
          'fullname': 'Ad və soyadınız',
          'exfullname': 'Məs: Həmid Musayev',
          'bysigningupagreepolicy':
              'Qeydiyyatdan keçməklə, İfadələr,şərtlərimiz və şəxsi siyasətimizlə razılaşırsınız',
          //welcome
          'orderbeforego': 'Getməzdən əvvəl sifariş edin!',
          'makefriendshappysendgifts':
              'Dostlarınızı onlara hədiyyələr göndərməklə sevindirin!',
          'getorderwithoutwaiting': 'Sifarişinizi gözləmədən əldə edin!',
          'getstarted': 'Başla',
          'next': 'Növbəti'
        },
      };
}
