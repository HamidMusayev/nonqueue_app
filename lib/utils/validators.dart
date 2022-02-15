class ValidatorHelper {
  static String? validateEmail(String? text) {
    return text == null || text == ''
        ? 'E-mail boşdur!'
        : RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(text)
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

  static String? validateUsername(String? text) {
    return text == null || text == ''
        ? 'Adınız boşdur!'
        : text.length < 4
            ? 'Adınız çox qısadır!'
            : null;
  }
}
