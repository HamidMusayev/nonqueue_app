import 'package:get/get.dart';
import 'package:nonqueue_app/screens/auth/login/ui.dart';
import 'package:nonqueue_app/screens/auth/pswreset/ui.dart';
import '../../../api/concrete/dio_service.dart';
import '../../../api/concrete/user_service.dart';
import '../../../api/result/result.dart';
import '../../../utils/constants.dart';

class OtpController extends GetxController {
  RxBool isLoading = false.obs;

  final UserService _service = UserService(DioService());

  void confirmOtp(int otp, String email, String type) async {
    isLoading.value = true;
    Result res = type == 'confirmEmail'
        ? await _service.confirmEmail({'email': email, 'otp': otp})
        : await _service.checkOtp({'email': email, 'otp': otp});

    if (res.success) {
      isLoading.value = false;
      Get.showSnackbar(Snacks.success('otpverified'.tr));

      type == 'confirmEmail'
          ? Get.off(const LoginScreen())
          : Get.off(ResetPasswordScreen(email, otp));
    } else {
      isLoading.value = false;
      Get.showSnackbar(Snacks.error(res.message));
    }
  }

// Future authenticate(String email) async {
//   final LocalAuthentication localAuthentication = LocalAuthentication();
//
//   bool isBiometricSupported = await localAuthentication.isDeviceSupported();
//   bool canCheckBiometrics = await localAuthentication.canCheckBiometrics;
//
//   bool isAuthenticated = false;
//
//   if (isBiometricSupported && canCheckBiometrics) {
//     isAuthenticated = await localAuthentication.authenticate(
//       localizedReason: 'authfingerprint'.tr,
//       biometricOnly: true,
//     );
//   }
//
//   if (isAuthenticated) {
//     Get.off(ResetPasswordScreen(email));
//   }
// }
}
