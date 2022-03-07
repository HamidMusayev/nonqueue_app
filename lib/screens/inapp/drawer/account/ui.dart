import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nonqueue_app/screens/inapp/drawer/account/contoller.dart';
import 'package:nonqueue_app/screens/inapp/drawer/account_info_changepass.dart';
import 'package:nonqueue_app/utils/constants.dart';
import 'package:nonqueue_app/utils/validators.dart';

import '../../../../widgets/phone_input/phone_input_field.dart';

class AccountScreen extends GetView<AccountController> {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AccountController());

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Account information',
          style: TextStyle(color: ColorPalette.lightBlack),
        ),
        actions: [
          Obx(
            () => controller.isLoading.value
                ? const IconButton(
                    onPressed: null,
                    icon: CircularProgressIndicator(),
                  )
                : IconButton(
                    onPressed: () async => controller.saveUserData(),
                    icon: const Icon(Icons.check_rounded),
                  ),
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
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
                  'Provide your personal information, '
                  'this won’t be part of your public profile',
                  style: TextStyle(color: ColorPalette.greyInputText),
                ),
                Spaces.vertical50,
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  autofocus: false,
                  controller: controller.emailTxt,
                  onChanged: controller.checkEmail,
                  validator: ValidatorHelper.validateEmail,
                  decoration: InputDecoration(hintText: 'emailadress'.tr),
                ),
                Spaces.vertical20,
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
                Spaces.vertical20,
                DropdownButtonFormField<String>(
                  hint: Text('gender'.tr),
                  validator: ValidatorHelper.validateGender,
                  onChanged: controller.checkGender,
                  value: controller.genderTxt.text.isNotEmpty ? controller.genderTxt.text : null,
                  items: [
                    DropdownMenuItem<String>(
                      value: 'male',
                      child: Row(
                        children: [
                          const Icon(
                            Icons.male_rounded,
                            color: ColorPalette.editColor,
                          ),
                          Spaces.horizontal6,
                          Text('male'.tr),
                        ],
                      ),
                    ),
                    DropdownMenuItem<String>(
                      value: 'female',
                      child: Row(
                        children: [
                          const Icon(
                            Icons.female_rounded,
                            color: ColorPalette.qlessApp,
                          ),
                          Spaces.horizontal6,
                          Text('female'.tr),
                        ],
                      ),
                    ),
                  ],
                ),
                Spaces.vertical20,
                GestureDetector(
                  onTap: () {
                    controller.isBirthdayChanged.value = true;
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1960),
                      lastDate: DateTime.now(),
                      builder: (context, child) => Theme(
                        data: Theme.of(context).copyWith(
                          textButtonTheme: TextButtonThemeData(
                            style: TextButton.styleFrom(
                              fixedSize: const Size.fromHeight(45),
                            ),
                          ),
                        ),
                        child: child!,
                      ),
                    ).then(controller.datePicked);
                  },
                  child: TextFormField(
                    controller: controller.birthdayTxt,
                    keyboardType: TextInputType.datetime,
                    textInputAction: TextInputAction.next,
                    validator: ValidatorHelper.validateBirthday,
                    onChanged: controller.checkBirthday,
                    readOnly: true,
                    enabled: false,
                    decoration: InputDecoration(
                      hintText: 'dateofbirth'.tr,
                      prefixIcon: const Icon(Icons.date_range_rounded),
                    ),
                  ),
                ),
                // Spaces.vertical50,
                // TextButton(
                //   style: TextButton.styleFrom(
                //     primary: ColorPalette.editColor,
                //     backgroundColor: Colors.transparent,
                //     fixedSize: const Size.fromHeight(20),
                //   ),
                //   child: Text(
                //     'changepass'.tr,
                //     style: const TextStyle(
                //       fontSize: 16,
                //       fontWeight: FontWeight.w400,
                //     ),
                //   ),
                //   onPressed: () => Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => const AccountInfoChangePassScreen(),
                //       fullscreenDialog: true,
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
