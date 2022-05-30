import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nonqueue_app/screens/auth/login/ui.dart';
import '../../../api/concrete/dio_service.dart';
import '../../../api/concrete/user_service.dart';
import '../../../api/result/result.dart';
import '../../../utils/constants.dart';

class ResetPasswordController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isObsecure = true.obs;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController firstPassTxt = TextEditingController();
  final TextEditingController secondPassTxt = TextEditingController();

  final UserService _service = UserService(DioService());

  void changeObsecure() => isObsecure.value = !isObsecure.value;

  void resetPassword(String email, int otp) async {
    if (formKey.currentState?.validate() ?? false) {
      if (firstPassTxt.text == secondPassTxt.text) {
        isLoading.value = true;
        Result res = await _service.resetPassword({
          'email': email,
          'otp': otp,
          'password': firstPassTxt.text,
          'clientId': kClientId,
          'clientSecrets': kClientSecrets,
        });

        if (res.success) {
          isLoading.value = false;
          Get.showSnackbar(Snacks.success('changedpassword'.tr));

          Get.offAll(const LoginScreen());
        } else {
          isLoading.value = false;
          Get.showSnackbar(Snacks.error(res.message));
        }
      } else {
        Get.showSnackbar(Snacks.error('passwordsmustbesame'.tr));
      }
    }
  }
}
