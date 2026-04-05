import 'package:get/get.dart';
import 'package:nonqueue_app/screens/auth/login/controller.dart';
import 'package:nonqueue_app/screens/auth/onboard/controller.dart';
import 'package:nonqueue_app/screens/auth/otp/controller.dart';
import 'package:nonqueue_app/screens/auth/pswforgot/controller.dart';
import 'package:nonqueue_app/screens/auth/pswreset/controller.dart';
import 'package:nonqueue_app/screens/auth/register/controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController(), fenix: true);
  }
}

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(() => RegisterController(), fenix: true);
  }
}

class ForgotPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgotPasswordController>(
      () => ForgotPasswordController(),
      fenix: true,
    );
  }
}

class OnBoardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnBoardController>(() => OnBoardController(), fenix: true);
  }
}

class OtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OtpController>(() => OtpController(), fenix: true);
  }
}

class ResetPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResetPasswordController>(
      () => ResetPasswordController(),
      fenix: true,
    );
  }
}
