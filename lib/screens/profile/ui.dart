import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nonqueue_app/bindings/drawer_flow_bindings.dart';
import 'package:nonqueue_app/routes/app_routes.dart';
import 'package:nonqueue_app/screens/profile/controller.dart';
import 'package:nonqueue_app/utils/constants.dart';
import 'package:nonqueue_app/utils/validators.dart';

import '../../utils/shared.dart';
import '../drawer/account/ui.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          padding: Paddings.p16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Align(
                alignment: Alignment.center,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://images.pexels.com/photos/697509/pexels-photo-697509.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
                  radius: 50,
                ),
              ),
              Spaces.vertical20,
              Padding(
                padding: Paddings.p24.copyWith(top: 0, bottom: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          'nqpoints'.tr,
                          style: const TextStyle(
                            color: ColorPalette.greyInputText,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Row(
                          children: const [
                            Text(
                              '10',
                              style: TextStyle(
                                color: ColorPalette.greyInputText,
                                fontSize: 16,
                              ),
                            ),
                            Spaces.horizontal6,
                            Icon(
                              Icons.toll_rounded,
                              color: Colors.orange,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          'nqbalance'.tr,
                          style: const TextStyle(
                            color: ColorPalette.lightBlack,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Text(
                          '35 ₼',
                          style: TextStyle(
                            color: ColorPalette.lightBlack,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Spaces.vertical20,
              Spaces.vertical20,
              Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.fullnameTxt,
                      validator: ValidatorHelper.validateFullname,
                      onChanged: controller.checkFullName,
                      decoration: InputDecoration(
                        hintText: 'fullname'.tr,
                      ),
                    ),
                    Spaces.vertical20,
                    TextFormField(
                      controller: controller.usernameTxt,
                      validator: ValidatorHelper.validateUsername,
                      onChanged: controller.checkUsername,
                      decoration: InputDecoration(
                        hintText: 'username'.tr,
                      ),
                    ),
                    Spaces.vertical20,
                    TextFormField(
                      controller: controller.bioTxt,
                      onChanged: controller.checkBio,
                      decoration: const InputDecoration(
                        hintText: 'Bio',
                      ),
                    ),
                  ],
                ),
              ),
              Spaces.vertical20,
              Obx(
                () => AnimatedSwitcher(
                  duration: const Duration(milliseconds: 400),
                  child: controller.isUsernameChanged.value ||
                          controller.isFullnameChanged.value ||
                          controller.isBioChanged.value
                      ? Visibility(
                          visible: !controller.isLoading.value,
                          replacement:
                              const Center(child: CircularProgressIndicator()),
                          child: TextButton(
                            child: Text('savechanges'.tr),
                            onPressed: () async => controller.saveUserData(),
                          ),
                        )
                      : const SizedBox(),
                ),
              ),
              Spaces.vertical20,
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: ColorPalette.editColor,
                  backgroundColor: Colors.transparent,
                  fixedSize: const Size.fromHeight(20),
                ),
                child: Text(
                  'editaccount'.tr,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                onPressed: () => Get.to(
                      () => const AccountScreen(),
                      binding: AccountBinding(),
                      fullscreenDialog: true,
                    ),
              ),
              Spaces.vertical10,
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: ColorPalette.editColor,
                  backgroundColor: Colors.transparent,
                  fixedSize: const Size.fromHeight(20),
                ),
                child: Text(
                  'logout'.tr,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: Text('logout'.tr),
                      content: Text('yousure'.tr),
                      actions: [
                        OutlinedButton(
                          style: TextButton.styleFrom(
                            fixedSize: const Size.fromHeight(45),
                            shape: const RoundedRectangleBorder(
                              borderRadius: Radiuses.r10,
                            ),
                          ),
                          onPressed: () async {
                            await SharedHelper.removeJson('token');
                            Get.offAllNamed(AppRoutes.welcome);
                          },
                          child: Text('yes'.tr),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            fixedSize: const Size.fromHeight(45),
                          ),
                          onPressed: () => Navigator.pop(context),
                          child: Text('no'.tr),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
