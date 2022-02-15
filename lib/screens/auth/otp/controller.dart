import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_auth/auth_strings.dart';
import 'package:local_auth/local_auth.dart';
import 'package:nonqueue_app/screens/auth/pswreset/ui.dart';

import '../../../api/concrete/dio_service.dart';
import '../../../api/concrete/user_service.dart';
import '../../../api/result/result.dart';
import '../../../utils/constants.dart';
import '../../../utils/shared.dart';
import '../otp/ui.dart';

class OtpController extends GetxController {
  RxBool isLoading = false.obs;

  final UserService _service = UserService(DioService());

  Future authenticate(String email) async {
    final LocalAuthentication localAuthentication = LocalAuthentication();

    bool isBiometricSupported = await localAuthentication.isDeviceSupported();
    bool canCheckBiometrics = await localAuthentication.canCheckBiometrics;

    bool isAuthenticated = false;

    if (isBiometricSupported && canCheckBiometrics) {
      isAuthenticated = await localAuthentication.authenticate(
        localizedReason: 'authfingerprint'.tr,
        biometricOnly: true,
      );
    }

    if (isAuthenticated) {
      Get.off(ResetPasswordScreen(email));
    }
  }

  Future<void> confirmOtp(int otp, String email) async {
    isLoading.value = true;
    Result result = await _service.sendOTPEmail({'email': email, 'otp': otp});

    if (result.success) {
      SharedHelper.saveJson('userId', result.data);
      isLoading.value = false;

      Get.off(ResetPasswordScreen(email));
    } else {
      isLoading.value = false;
      Get.showSnackbar(Snacks.error(result.message));
    }
  }
}
