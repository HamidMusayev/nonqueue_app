import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nonqueue_app/screens/auth/pswreset/controller.dart';
import 'package:nonqueue_app/utils/constants.dart';
import 'package:nonqueue_app/utils/validators.dart';

class ResetPasswordScreen extends GetView<ResetPasswordController> {
  final String email;
  final int otp;
  const ResetPasswordScreen(this.email, this.otp, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordController());

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: Paddings.p16,
        constraints: const BoxConstraints(maxWidth: 450),
        child: SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'changepassword'.tr,
                  style: const TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w500,
                    color: ColorPalette.qlessApp,
                  ),
                ),
                Spaces.vertical50,
                Obx(
                  () => TextFormField(
                    controller: controller.firstPassTxt,
                    validator: ValidatorHelper.validatePassword,
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.next,
                    obscureText: controller.isObsecure.value,
                    decoration: InputDecoration(
                      hintText: 'newpassword'.tr,
                      suffixIcon: IconButton(
                        onPressed: controller.changeObsecure,
                        icon: controller.isObsecure.value
                            ? const Icon(Icons.visibility_off_rounded)
                            : const Icon(Icons.visibility_rounded),
                      ),
                      prefixIcon: const Icon(Icons.vpn_key_rounded),
                    ),
                  ),
                ),
                Spaces.vertical10,
                Obx(
                  () => TextFormField(
                    controller: controller.secondPassTxt,
                    validator: ValidatorHelper.validatePassword,
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                    obscureText: controller.isObsecure.value,
                    decoration: InputDecoration(
                      hintText: 'confirmnewpassword'.tr,
                      prefixIcon: const Icon(Icons.vpn_key_rounded),
                    ),
                  ),
                ),
                Spaces.vertical50,
                Obx(
                  () => Visibility(
                    visible: controller.isLoading.value,
                    replacement: TextButton(
                      child: Text('submit'.tr),
                      onPressed: () => controller.resetPassword(email, otp),
                    ),
                    child: const Center(child: CircularProgressIndicator()),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
