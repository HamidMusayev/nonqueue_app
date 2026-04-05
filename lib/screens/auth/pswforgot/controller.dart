import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nonqueue_app/api/abstract/user_repository.dart';
import 'package:nonqueue_app/routes/app_routes.dart';
import '../../../api/result/result.dart';
import '../../../utils/constants.dart';

class ForgotPasswordController extends GetxController {
  RxBool isLoading = false.obs;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailTxt = TextEditingController();
  final UserRepository _service = Get.find<UserRepository>();

  Future<void> sendOtp() async {
    if (formKey.currentState?.validate() ?? false) {
      isLoading.value = true;
      Result res = await _service.sendOTPEmail({
        'email': emailTxt.text,
        'clientId': kClientId,
        'clientSecrets': kClientSecrets,
      });

      if (res.success) {
        isLoading.value = false;
        Get.showSnackbar(Snacks.success('sendedotp'.tr));

        Get.offNamed(
          AppRoutes.otp,
          arguments: {
            'email': emailTxt.text,
            'type': 'checkOtp',
          },
        );
      } else {
        isLoading.value = false;
        Get.showSnackbar(Snacks.error(res.message));
      }
    }
  }
}
