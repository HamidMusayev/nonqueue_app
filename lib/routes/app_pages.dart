import 'package:get/get.dart';
import 'package:nonqueue_app/bindings/auth_bindings.dart';
import 'package:nonqueue_app/bindings/in_app_binding.dart';
import 'package:nonqueue_app/routes/app_routes.dart';
import 'package:nonqueue_app/screens/auth/login/ui.dart';
import 'package:nonqueue_app/screens/auth/onboard/ui.dart';
import 'package:nonqueue_app/screens/auth/otp/ui.dart';
import 'package:nonqueue_app/screens/auth/pswforgot/ui.dart';
import 'package:nonqueue_app/screens/auth/pswreset/ui.dart';
import 'package:nonqueue_app/screens/auth/register/ui.dart';
import 'package:nonqueue_app/screens/auth/welcome/ui.dart';
import 'package:nonqueue_app/screens/inapp/ui.dart';

class AppPages {
  AppPages._();

  static final List<GetPage<dynamic>> pages = <GetPage<dynamic>>[
    GetPage<void>(
      name: AppRoutes.welcome,
      page: () => const WelcomeScreen(),
    ),
    GetPage<void>(
      name: AppRoutes.onboard,
      page: () => const OnBoardScreen(),
      binding: OnBoardBinding(),
    ),
    GetPage<void>(
      name: AppRoutes.login,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage<void>(
      name: AppRoutes.register,
      page: () => const RegisterScreen(),
      binding: RegisterBinding(),
    ),
    GetPage<void>(
      name: AppRoutes.forgotPassword,
      page: () => const ForgotPasswordScreen(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage<void>(
      name: AppRoutes.otp,
      page: () {
        final args = Get.arguments as Map<String, dynamic>;
        return OTPScreen(
          args['email'] as String,
          args['type'] as String,
        );
      },
      binding: OtpBinding(),
    ),
    GetPage<void>(
      name: AppRoutes.resetPassword,
      page: () {
        final args = Get.arguments as Map<String, dynamic>;
        return ResetPasswordScreen(
          args['email'] as String,
          args['otp'] as int,
        );
      },
      binding: ResetPasswordBinding(),
    ),
    GetPage<void>(
      name: AppRoutes.inApp,
      page: () => const InAppScreen(),
      binding: InAppBinding(),
    ),
  ];
}
