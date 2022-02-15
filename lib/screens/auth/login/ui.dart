import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nonqueue_app/screens/auth/login/controller.dart';
import 'package:nonqueue_app/screens/auth/pswforgot/ui.dart';
import 'package:nonqueue_app/screens/auth/register/ui.dart';
import 'package:nonqueue_app/utils/constants.dart';
import 'package:nonqueue_app/utils/validators.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: Paddings.p16,
            constraints: const BoxConstraints(maxWidth: 450),
            child: Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Welcome back!',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w500,
                      color: ColorPalette.qlessApp,
                    ),
                  ),
                  const Text(
                    'Enter your email and password to login',
                    style: TextStyle(color: ColorPalette.greyInputText),
                  ),
                  Spaces.vertical50,
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    autofocus: true,
                    controller: controller.emailTxt,
                    validator: ValidatorHelper.validateEmail,
                    decoration: const InputDecoration(
                      hintText: 'Email address',
                      prefixIcon: Icon(Icons.alternate_email_rounded),
                    ),
                  ),
                  Spaces.vertical10,
                  Obx(
                    () => TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                      obscureText: controller.isObsecure.value,
                      controller: controller.passTxt,
                      validator: ValidatorHelper.validatePassword,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        prefixIcon: const Icon(Icons.lock_rounded),
                        suffixIcon: IconButton(
                          onPressed: controller.changeObsecure,
                          icon: controller.isObsecure.value
                              ? const Icon(Icons.visibility_off_rounded)
                              : const Icon(Icons.visibility_rounded),
                        ),
                      ),
                    ),
                  ),
                  Spaces.vertical10,
                  GestureDetector(
                    onTap: () => Get.to(const ForgotPasswordScreen()),
                    child: const Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: ColorPalette.qlessApp,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                  Spaces.vertical50,
                  Obx(
                    () => Visibility(
                      visible: controller.isLoading.value,
                      child: const Center(child: CircularProgressIndicator()),
                      replacement: TextButton(
                        child: const Text('Login'),
                        onPressed: controller.login,
                      ),
                    ),
                  ),
                  Spaces.vertical20,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don’t have an account?  ',
                        style: TextStyle(color: Colors.blueGrey),
                      ),
                      GestureDetector(
                        onTap: () => Get.off(const RegisterScreen()),
                        child: const Text(
                          'Sign up',
                          style: TextStyle(
                            color: ColorPalette.qlessApp,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
