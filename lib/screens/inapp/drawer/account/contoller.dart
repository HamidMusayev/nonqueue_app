import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nonqueue_app/utils/shared.dart';

import '../../../../api/concrete/dio_service.dart';
import '../../../../api/concrete/user_service.dart';
import '../../../../api/result/result.dart';
import '../../../../models/user.dart';
import '../../../../utils/constants.dart';
import '../../../../widgets/phone_input/phone_number.dart';

class AccountController extends GetxController {
  RxBool isLoading = false.obs;

  late User _user;
  final UserService _service = UserService(DioService());

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

  void onChangedNumber(PhoneNumber number) =>
      prefixTxt.text = number.countryCode;

  void getUserData() async {
    _user = User.fromJson(await SharedHelper.readJson('user'));
    emailTxt.text = _user.email!;
    //numberTxt.text = _user.phoneNumber ?? '';
  }

  void datePicked(DateTime? value) {
    if (value != null) {
      birthdayTxt.text = DateFormat('yyyy-MM-dd').format(value);
    }
  }

  Future<void> saveUserData() async {
    if (formKey.currentState?.validate() ?? false) {
      isLoading.value = true;
      await editUser('Email', emailTxt.text);
      isLoading.value = false;
    }
  }

  Future<void> editUser(String propName, String value) async {
    Result res = await _service.userEdit({
      'propName': propName,
      'value': value,
      'appUserId': _user.id.toString(),
      'otp': 0000
    });

    if (res.success) {
      Result<User> res2 = await _service.getById('id=${_user.id}');
      if (res2.success) {
        SharedHelper.saveJson('user', res2.data?.toJson());

        Get.showSnackbar(Snacks.success(res.message));
      } else {
        Get.showSnackbar(Snacks.error(res2.message));
      }
    } else {
      Get.showSnackbar(Snacks.error(res.message));
    }
  }
}
