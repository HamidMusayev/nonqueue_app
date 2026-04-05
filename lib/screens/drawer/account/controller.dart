import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nonqueue_app/screens/drawer/account/otp.dart';
import 'package:nonqueue_app/utils/shared.dart';

import 'package:nonqueue_app/api/abstract/user_repository.dart';

import '../../../../api/result/result.dart';
import '../../../../models/user/user.dart';
import '../../../../utils/constants.dart';
import '../../../../widgets/phone_input/phone_number.dart' as phone_widget;

class AccountController extends GetxController {
  RxBool isEmailChanged = false.obs;
  RxBool isNumberChanged = false.obs;
  RxBool isGenderChanged = false.obs;
  RxBool isBirthdayChanged = false.obs;

  RxBool isLoading = false.obs;

  late User _user;
  final UserRepository _service = Get.find<UserRepository>();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailTxt = TextEditingController();
  final TextEditingController prefixTxt = TextEditingController();
  final TextEditingController numberTxt = TextEditingController();
  final TextEditingController birthdayTxt = TextEditingController();
  final TextEditingController genderTxt = TextEditingController();

  @override
  void onInit() {
    getUserData();
    super.onInit();
  }

  void checkEmail(String input) {
    if (isEmailChanged.isFalse) isEmailChanged.value = true;
  }

  void checkNumber(String input) {
    if (isNumberChanged.isFalse) isNumberChanged.value = true;
  }

  void checkGender(String? input) {
    genderTxt.text = input ?? '';
    if (isGenderChanged.isFalse) isGenderChanged.value = true;
  }

  void checkBirthday(String input) {
    if (isBirthdayChanged.isFalse) isBirthdayChanged.value = true;
  }

  void onChangedNumber(phone_widget.PhoneNumber number) {
    prefixTxt.text = number.countryCode;
    isNumberChanged.value = true;
  }

  void getUserData() async {
    final map = await SharedHelper.readJsonMap('user');
    if (map == null) {
      Get.showSnackbar(Snacks.error('eauthor'.tr));
      return;
    }
    _user = User.fromJson(map);
    emailTxt.text = _user.email!;
    numberTxt.text = _user.phoneNumber ?? '';
    if (_user.userClaims
            ?.where((e) => e.type == 'Gender')
            .toList()
            .isNotEmpty ??
        false) {
      genderTxt.text =
          _user.userClaims?.firstWhere((e) => e.type == 'Gender').value ?? '';
    }
    if (_user.userClaims
            ?.where((e) => e.type == 'DateOfBirth')
            .toList()
            .isNotEmpty ??
        false) {
      birthdayTxt.text =
          _user.userClaims?.firstWhere((e) => e.type == 'DateOfBirth').value ??
              '';
    }
  }

  void datePicked(DateTime? value) {
    if (value != null) {
      birthdayTxt.text = DateFormat('yyyy-MM-dd').format(value);
    }
  }

  Future<void> saveUserData() async {
    if (formKey.currentState?.validate() ?? false) {
      isLoading.value = true;

      if (isNumberChanged.value) {
        await editUser('PhoneNumber', '${prefixTxt.text}/${numberTxt.text}');
      }
      if (isBirthdayChanged.value) {
        await editUser('DateOfBirth', birthdayTxt.text);
      }
      if (isGenderChanged.value) {
        await editUser('Gender', genderTxt.text);
      }

      if (isEmailChanged.value && !(emailTxt.text == _user.email)) {
        await sendOtpForChangeEmail();
        await Get.to(() => EmailChangeScreen(emailTxt.text));
      }

      isBirthdayChanged.value = false;
      isGenderChanged.value = false;
      isNumberChanged.value = false;
      isEmailChanged.value = false;

      Result<User> res2 = await _service.getById('id=${_user.id}');
      if (res2.success) {
        final u = res2.data;
        if (u != null) {
          await SharedHelper.saveJson('user', u.toJson());
        }
      } else {
        Get.showSnackbar(Snacks.error(res2.message));
      }

      isLoading.value = false;
      Get.back(closeOverlays: true);
    }
  }

  Future<bool> editUser(String propName, String value, {int? otp}) async {
    final Result<void> res = await _service.userEdit({
      'propName': propName,
      'value': value,
      'appUserId': _user.id.toString(),
      'otp': otp ?? 0000
    });

    if (res.success) {
      Get.showSnackbar(Snacks.success(res.message));
      return true;
    } else {
      Get.showSnackbar(Snacks.error(res.message));
      return false;
    }
  }

  Future<void> sendOtpForChangeEmail() async {
    final Result<void> res = await _service.sendOtpForChangeEmail({
      'email': emailTxt.text,
      'id': _user.id.toString(),
      'clientId': kClientId,
      'clientSecrets': kClientSecrets,
    });

    if (res.success) {
      Get.showSnackbar(Snacks.success(res.message));
    } else {
      Get.showSnackbar(Snacks.error(res.message));
    }
  }
}
