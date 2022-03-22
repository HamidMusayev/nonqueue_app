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
          'sendedquestion': 'Question sent successfully',
          'sendedotp': 'Verification code sent to your E-mail',
          'optverified': 'Code verified',
          'errorgooglesignin': 'Can not sign in with Google',
          //login
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
          'donotworryithappens':
              'Don’t worry! Please enter the E-mail address ',
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
          'next': 'Next',
          //offerdetail
          'offerdetail': 'Offer Detail',
          'gotobuy': 'Go to Buy',
          //bonus
          'mybonuses': 'My bonuses',
          'offers': 'Offers',
          //cart
          'shoppingbag': 'Shopping bag',
          'orderitems': 'Order items',
          'name': 'name',
          'size': 'size',
          'count': 'count',
          'value': 'value',
          'total': 'Total',
          'priceinmanatinctaxes': 'Price in manat, inc taxes',
          'heyitemchosedcouponhere':
              'Hey, the item you chosed has a coupon! Tap here!',
          //checkout
          'number': 'number',
          'checkout': 'Checkout',
          'details': 'Details',
          'pickup': 'Pickup',
          'takefoodwithmyself': 'I’ll take the food with myself.',
          'onsite': 'On site',
          'itatrestaraunt': 'I’ll it at restaraunt.',
          'yourarrivaltime': 'Your arrival time',
          'payment': 'Payment',
          'nqbalance': 'N-Q balance: ',
          'confirmation': 'Confirmation',
          'congratulations': 'Congratulations!',
          'yourorderdone': 'Your order has successfully done!',
          'yourordernumber': 'Your order number is',
          'track order': 'Track order',
          'back': 'Back',
          //contacts_partners
          'wherewouldyoulikebuygift':
              'Hey, Where would you like to buy a gift?',
          'searchrestarauntslocation': 'Search restaraunts & location...',
          'allpartners': 'All partners',
          'mostpopular': 'Most popular',
          'giftinviteyourfriend': 'Send a gift & invite your friend',
          'nqpcontacts': 'NQP Contacts',
          'allowapplicationaccessyourcontacts':
              'You must allow the application to access your contacts '
                  'to see who is using this application from your contacts',
          'allowaccess': 'Allow access',
          //coupon
          'coupon': 'Coupon',
          'ohsmthwentwrong': 'Uh oh! Something went wrong...',
          'validtill': 'Valid till: ',
          //gift
          'usegift': 'Use Gift',
          'gift': 'Gift',
          //notification
          'notifications': 'Notifications',
          'yournqbalance': 'Your N-Q balance',
          'helpcenter': 'Help Center',
          //inapp
          'home': 'Home',
          'search1': 'Search',
          'bonuses': 'Bonuses',
          'contacts': 'Contacts',
          'profile': 'Account',
          'viewall': 'View all',
          'lovefree': 'love free stuff?',
          'yourbonuses': 'Your bonuses',
          'quickorder': 'want to make quick order?',
          'peoplelike': 'what other people like?',
          //profile
          'nqpoints': 'N-Q points :',
          'logout': 'Log out',
          'savechanges': 'Save Changes',
          'editaccount': 'Edit account',
          'yousure': 'Are you sure?',
          'yes': 'Yes',
          'no': 'No',
          //filter
          'nearbycurrentlocation': 'Nearby your current location',
          'foodtype': 'Food type',
          'coffee': 'Coffee',
          'fastfood': 'Fast food',
          'smoothies': 'Smoothies',
          'vegan': 'Vegan',
          'seafood': 'Seafood',
          'cocktails': 'Cocktails',
          'deserts': 'Deserts',
          //about
          'about': 'About',
          //account
          'providepersonalinfo': 'Provide your personal information, '
              'this won’t be part of your public profile',
          'accountinfo': 'Account information',
          //payment
          'paymentmethods': 'Payment methods',
          'setdefaultcard': 'Set your default payment card',
          'addnewcard': 'Add new card',
          'cardholder': 'Card holder',
          'cardnumber': 'Card number',
          'expiredate': 'Expire date: ',
          'privacypolicy': 'Privacy policy',
          //help
          'wehelpyou': 'How can we help you?',
          'sendusmessage': 'Send us a message',
          'willgetansweryouremail':
              'You will get answer to your email as soon as possible',
          //history
          'orderhistory': 'Order history',
          'orderstatus': 'Order status',
          'orderagain': 'Order Again',
          'yourorder': 'Your order',
          //balance
          'currentbalance': 'Current balance:',
          'enteramount': 'Enter amount:',
          'addmoney': 'Add Money',
          'defaultpaymentcard': 'Your default payment card',
          'salarycard': 'Salary card',
          'expirydate': 'Expiry date:',
          'changepaymentcard': 'Change default payment card',
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
          'sendedquestion': 'Sualınız göndərildi',
          'sendedotp': 'Təsdiqləmə kodu elektron poçtunuza göndərildi',
          'optverified': 'Kodunuz təsdiqləndi',
          'errorgooglesignin': 'Google ilə daxil olmaq alınmadı',
          //login
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
          'next': 'Növbəti',
          //offerdetail
          'offerdetail': 'Təklif təfərrüatı ',
          'gotobuy': 'Alış-a keçin',
          //bonus
          'mybonuses': 'Bonuslarım',
          'offers': 'Təkliflər',
          //cart
          'shoppingbag': 'Alış-veriş çantası',
          'orderitems': 'Əşyaları sifariş edin',
          'name': 'ad',
          'size': 'ölçü',
          'count': 'say',
          'value': 'dəyər',
          'total': 'Toplam',
          'priceinmanatinctaxes': 'Vergilər daxil olmaqla manatla qiymət',
          'heyitemchosedcouponhere':
              'Hey, seçdiyiniz elementin kuponu var! Bura toxunun!',
          //checkout
          'number': 'nömrə',
          'checkout': 'Yoxla',
          'details': 'Detallar',
          'pickup': 'Toplamaq',
          'takefoodwithmyself': 'Yeməyi özümlə aparacam.',
          'onsite': 'Saytda',
          'itatrestaraunt': 'Restoranda oturacam.',
          'yourarrivaltime': 'Sizin gəliş vaxtınız',
          'payment': 'Ödəniş',
          'nqbalance': 'N-Q balansı:',
          'confirmation': 'Təsdiq',
          'congratulations': 'Təbrik edirik!',
          'yourorderdone': 'Sifarişiniz uğurla yerinə yetirildi!',
          'yourordernumber': 'Sizin sifariş nömrəniz',
          'track order': 'Sifarişi izləyin',
          'back': 'Geri',
          //contacts_partners
          'wherewouldyoulikebuygift':
              'Salam, haradan hədiyyə almaq istərdiniz?',
          'searchrestarauntslocation': 'Restoranlar və məkan axtarın...',
          'allpartners': 'Bütün tərəfdaşlar',
          'mostpopular': 'Ən məşhur',
          'giftinviteyourfriend': 'Hədiyyə göndərin və dostunuzu dəvət edin',
          'nqpcontacts': 'NQP Əlaqələr',
          'allowapplicationaccessyourcontacts':
              'Siz tətbiqin kontaktlarınıza daxil olmasına icazə verməlisiniz '
                  'Bu proqramı kontaktlarınızdan kimin istifadə etdiyini görmək',
          'allowaccess': 'Əlaqələrə girişə icazə ver',
          //coupon
          'coupon': 'Kupon',
          'ohsmthwentwrong': 'Uh oh! Nə isə xəta baş verdi...',
          'validtill': 'Son istifadə tarixi: ',
          //gift
          'usegift': 'İstifadə Et',
          'gift': 'Hədiyyə',
          //notification
          'notifications': 'Bildirişlər',
          'yournqbalance': 'N-Q balansınız',
          'helpcenter': 'Yardım mərkəzi',
          //inapp
          'home': 'Ev',
          'search1': 'Axtar',
          'bonuses': 'Bonuslar',
          'contacts': 'Kontaktlar',
          'profile': 'Hesabım',
          'viewall': 'Daha çox',
          'lovefree': 'pulsuz almaq?',
          'yourbonuses': 'Bonusların',
          'quickorder': 'cəld sifariş istəyirsiniz?',
          'peoplelike': 'digərləri nəyi bəyənir?',
          //profile
          'nqpoints': 'N-Q tokeni:',
          'logout': 'Çıxış',
          'yousure': 'Siz əminsinizmi?',
          'yes': 'Bəli',
          'no': 'Xeyr',
          'savechanges': 'Dəyişikləri saxla',
          'editaccount': 'Hesab məlumatları',
          //filter
          'nearbycurrentlocation': 'Cari yerinizin yaxınlığında',
          'foodtype': 'Qida növü',
          'coffee': 'Kofe',
          'fastfood': 'Fast food',
          'smoothies': 'Smoothies',
          'vegan': 'Vegan',
          'seafood': 'Dəniz məhsulları',
          'cocktails': 'Kokteyllər',
          'deserts': 'Desertlər',
          //about
          'about': 'Haqqında',
          //account
          'providepersonalinfo': 'Şəxsi hesab məlumatlarınızı daxil edin, '
              'bunları digər istifadəçilər göməyəcək',
          'accountinfo': 'Hesab məlumatları',
          //balance
          'currentbalance': 'Cari balans:',
          'enteramount': 'Məbləği daxil edin:',
          'addmoney': 'Məbləği artır',
          'defaultpaymentcard': 'Standart ödəniş kartınız',
          'salarycard': 'Əmək haqqı kartı',
          'expirydate': 'Bitmə tarixi:',
          'changepaymentcard': 'Standart ödəniş kartını dəyişdirin',
          //payment
          'paymentmethods': 'Ödəmə üsulları',
          'setdefaultcard': 'Standart ödəniş kartınızı təyin edin',
          'addnewcard': 'Yeni kart əlavə edin',
          'cardholder': 'Kart sahibi',
          'cardnumber': 'Kart nömrəsi',
          'expiredate': 'Bitmə tarixi: ',
          'privacypolicy': 'Gizlilik siyasəti',
          //help
          'wehelpyou': 'Sizə necə kömək edə bilərik?',
          'sendusmessage': 'Bizə mesaj göndərin',
          'willgetansweryouremail':
              'Biz sizin E-poçtunuza ən qısa zamanda cavab göndərəcəyik',
          //history
          'orderhistory': 'Sifariş tarixçəsi',
          'orderstatus': 'Sifariş statusu',
          'orderagain': 'Yenidən sifariş',
          'yourorder': 'Sizin sifarişiniz',
        },
      };
}
