import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nonqueue_app/utils/constants.dart';
import 'package:nonqueue_app/utils/validators.dart';
import 'package:nonqueue_app/widgets/phone_input/phone_input_field.dart';

import 'controller.dart';

class RegisterScreen extends GetView<RegisterController> {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'welcome'.tr,
                    style: const TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w500,
                      color: ColorPalette.qlessApp,
                    ),
                  ),
                  Text(
                    'youaregoingtosignupnonqueue'.tr,
                    style: const TextStyle(color: ColorPalette.greyInputText),
                  ),
                  Spaces.vertical50,
                  TextFormField(
                    controller: controller.emailTxt,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    validator: ValidatorHelper.validateEmail,
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: 'emailadress'.tr,
                      prefixIcon: const Icon(Icons.alternate_email_rounded),
                    ),
                  ),
                  Spaces.vertical10,
                  TextFormField(
                    controller: controller.fullnameTxt,
                    keyboardType: TextInputType.name,
                    validator: ValidatorHelper.validateFullname,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      hintText: 'fullname'.tr,
                      helperText: 'exfullname'.tr,
                      prefixIcon: const Icon(Icons.person_rounded),
                    ),
                  ),
                  Spaces.vertical10,
                  IntlPhoneField(
                    onChanged: controller.onChangedNumber,
                    controller: controller.numberTxt,
                    keyboardType: TextInputType.number,
                    searchText: 'search'.tr,
                    invalidNumberMessage: 'wrongnumber'.tr,
                    initialCountryCode: 'AZ',
                    textInputAction: TextInputAction.next,
                    dropDownIcon: const Icon(Icons.arrow_drop_down_rounded),
                  ),
                  Spaces.vertical10,
                  Obx(
                    () => TextFormField(
                      controller: controller.passTxt,
                      validator: ValidatorHelper.validatePassword,
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                      obscureText: controller.isObsecure.value,
                      decoration: InputDecoration(
                        hintText: 'password'.tr,
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
                  Spaces.vertical20,
                  Text('bysigningupagreepolicy'.tr),
                  Spaces.vertical50,
                  Obx(
                    () => Visibility(
                      visible: controller.isLoading.value,
                      replacement: TextButton(
                        onPressed: controller.register,
                        child: Text('signup'.tr),
                      ),
                      child: const Center(child: CircularProgressIndicator()),
                    ),
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
