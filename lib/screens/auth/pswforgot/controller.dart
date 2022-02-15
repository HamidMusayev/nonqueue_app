import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../api/concrete/dio_service.dart';
import '../../../api/concrete/user_service.dart';
import '../../../api/result/result.dart';
import '../../../utils/constants.dart';
import '../../../utils/shared.dart';
import '../otp/ui.dart';

class ForgotPasswordController extends GetxController {
  RxBool isLoading = false.obs;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailTxt = TextEditingController();
  final UserService _service = UserService(DioService());

  Future<void> sendOtp() async {
    if (formKey.currentState?.validate() ?? false) {
      isLoading.value = true;
      Result result = await _service.sendOTPEmail({'email': emailTxt.text});

      if (result.success) {
        SharedHelper.saveJson('userId', result.data);
        isLoading.value = false;

        Get.off(OTPScreen(emailTxt.text));
      } else {
        isLoading.value = false;
        Get.showSnackbar(Snacks.error(result.message));
      }
    }
  }
}
