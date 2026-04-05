import 'package:get/get.dart';
import 'package:nonqueue_app/api/abstract/user_repository.dart';
import 'package:nonqueue_app/routes/app_routes.dart';
import '../../../api/result/result.dart';
import '../../../utils/constants.dart';

class OtpController extends GetxController {
  RxBool isLoading = false.obs;

  final UserRepository _service = Get.find<UserRepository>();

  void confirmOtp(int otp, String email, String type) async {
    isLoading.value = true;
    final Result<void> res = type == 'confirmEmail'
        ? await _service.confirmEmail({
            'email': email,
            'otp': otp,
            'clientId': kClientId,
            'clientSecrets': kClientSecrets,
          })
        : await _service.checkOtp({
            'email': email,
            'otp': otp,
            'clientId': kClientId,
            'clientSecrets': kClientSecrets,
          });

    if (res.success) {
      isLoading.value = false;
      Get.showSnackbar(Snacks.success('optverified'.tr));

      type == 'confirmEmail'
          ? Get.offNamed(AppRoutes.login)
          : Get.offNamed(
              AppRoutes.resetPassword,
              arguments: {'email': email, 'otp': otp},
            );
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
