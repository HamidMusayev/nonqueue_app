class ValidatorHelper {
  static String? validateEmail(String? text) {
    return text == null || text == ''
        ? 'E-mail boşdur!'
        : RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+').hasMatch(text)
            ? null
            : 'Düzgün E-mail yazın!';
  }

  static String? validatePassword(String? text) {
    return text == null || text == ''
        ? 'Şifrəniz boşdur!'
        : text.length < 5
            ? 'Şifrəniz çox qısadır!'
            : null;
  }

  static String? validateFullname(String? text) {
    return text == null || text == ''
        ? 'Adınız boşdur!'
        : text.length < 6
            ? 'Adınız çox qısadır!'
            : !text.contains(' ')
                ? 'Ad və soyadınız arasında boşluq olmalıdır!'
                : null;
  }

  static String? validateUsername(String? text) {
    return text == null || text == ''
        ? 'İstifadəçi adınız boşdur!'
        : text.length < 4
            ? 'İstifadəçi adınız çox qısadır!'
            : null;
  }

  static String? validateGender(String? text) {
    return text == null || text == ''
        ? 'Cinsinizi seçin!'
        :  null;
  }

  static String? validateBirthday(String? text) {
    return text == null || text == ''
        ? 'Doğum tarixinizi seçin!'
        :  null;
  }
}
