import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nonqueue_app/screens/inapp/drawer/account/contoller.dart';
import 'package:nonqueue_app/screens/inapp/drawer/account_info_changepass.dart';
import 'package:nonqueue_app/utils/constants.dart';
import 'package:nonqueue_app/utils/validators.dart';

import '../../../../widgets/phone_input/phone_input_field.dart';

class AccountInfoScreen extends GetView<AccountController> {
  const AccountInfoScreen({Key? key}) : super(key: key);

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
          IconButton(onPressed: () {}, icon: const Icon(Icons.check_rounded))
        ],
      ),
      body: SingleChildScrollView(
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
                  validator: (value) => ValidatorHelper.validateEmail(value),
                  decoration: const InputDecoration(hintText: 'Email address'),
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
                DropdownButtonFormField<String>(
                  hint: const Text('Gender'),
                  onChanged: (value) {},
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
                Spaces.vertical10,
                TextFormField(
                  keyboardType: TextInputType.datetime,
                  textInputAction: TextInputAction.done,
                  //controller: _newpassTxt,
                  validator: (value) => ValidatorHelper.validatePassword(value),
                  decoration: const InputDecoration(hintText: 'Date of birth'),
                ),
                Spaces.vertical50,
                TextButton(
                  style: TextButton.styleFrom(
                    primary: ColorPalette.editColor,
                    backgroundColor: Colors.transparent,
                    fixedSize: const Size.fromHeight(20),
                  ),
                  child: const Text(
                    'Change Password',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AccountInfoChangePassScreen(),
                      fullscreenDialog: true,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
