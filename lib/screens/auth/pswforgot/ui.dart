import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nonqueue_app/screens/auth/pswforgot/controller.dart';
import 'package:nonqueue_app/utils/constants.dart';
import 'package:nonqueue_app/utils/validators.dart';

class ForgotPasswordScreen extends GetView<ForgotPasswordController> {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ForgotPasswordController());

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: Paddings.p16,
          constraints: const BoxConstraints(maxWidth: 450),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'forgotpassword'.tr,
                style: const TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w500,
                  color: ColorPalette.qlessApp,
                ),
              ),
              Text(
                'donotworryithappens'.tr,
                style: const TextStyle(color: ColorPalette.greyInputText),
              ),
              Spaces.vertical50,
              Form(
                key: controller.formKey,
                child: TextFormField(
                  controller: controller.emailTxt,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.done,
                  autofocus: true,
                  validator: ValidatorHelper.validateEmail,
                  decoration: InputDecoration(
                    hintText: 'emailadress'.tr,
                  ),
                ),
              ),
              Spaces.vertical50,
              Obx(
                () => Visibility(
                  visible: controller.isLoading.value,
                  replacement: TextButton(
                    onPressed: controller.sendOtp,
                    child: Text('submit'.tr),
                  ),
                  child: const Center(child: CircularProgressIndicator()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
