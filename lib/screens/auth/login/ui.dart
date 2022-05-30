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
                  Text(
                    'welcomeback'.tr,
                    style: const TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w500,
                      color: ColorPalette.qlessApp,
                    ),
                  ),
                  Text(
                    'enteremailpasswordlogin'.tr,
                    style: const TextStyle(color: ColorPalette.greyInputText),
                  ),
                  Spaces.vertical50,
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    autofocus: true,
                    controller: controller.emailTxt,
                    validator: ValidatorHelper.validateEmail,
                    decoration: InputDecoration(
                      hintText: 'emailadress'.tr,
                      prefixIcon: const Icon(Icons.alternate_email_rounded),
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
                        hintText: 'password'.tr,
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
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'forgotpassword'.tr,
                        style: const TextStyle(
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
                      replacement: TextButton(
                        onPressed: controller.login,
                        child: Text('login'.tr),
                      ),
                      child: const Center(child: CircularProgressIndicator()),
                    ),
                  ),
                  Spaces.vertical20,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'donothaveaccount'.tr,
                        style: const TextStyle(color: Colors.blueGrey),
                      ),
                      GestureDetector(
                        onTap: () => Get.off(const RegisterScreen()),
                        child: Text(
                          'signup'.tr,
                          style: const TextStyle(
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
