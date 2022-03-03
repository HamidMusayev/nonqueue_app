import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nonqueue_app/screens/auth/welcome/ui.dart';
import 'package:nonqueue_app/screens/inapp/drawer/account_info.dart';
import 'package:nonqueue_app/screens/profile/contoller.dart';
import 'package:nonqueue_app/utils/constants.dart';

import '../../utils/shared.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());

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
                        const Text(
                          'N-Q points :',
                          style: TextStyle(
                            color: ColorPalette.greyInputText,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Row(
                          children: const [
                            Text(
                              '10',
                              style: TextStyle(
                                color: ColorPalette.greyInputText,
                                fontSize: 18,
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
                      children: const <Widget>[
                        Text(
                          'N-Q balance :',
                          style: TextStyle(
                            color: ColorPalette.lightBlack,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '35 ₼',
                          style: TextStyle(
                            color: ColorPalette.lightBlack,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Spaces.vertical20,
              Spaces.vertical20,
              TextFormField(
                controller: controller.fullnameTxt,
                onChanged: controller.checkFullName,
                decoration: const InputDecoration(
                  hintText: 'Full name',
                ),
              ),
              Spaces.vertical20,
              TextFormField(
                controller: controller.usernameTxt,
                onChanged: controller.checkUsername,
                decoration: const InputDecoration(
                  hintText: 'Username',
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
                            child: const Text('Save Changes'),
                            onPressed: controller.saveUserData,
                          ),
                        )
                      : const SizedBox(),
                ),
              ),
              Spaces.vertical20,
              TextButton(
                style: TextButton.styleFrom(
                  primary: ColorPalette.editColor,
                  backgroundColor: Colors.transparent,
                  fixedSize: const Size.fromHeight(20),
                ),
                child: const Text(
                  'Edit account',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AccountInfoScreen(),
                    fullscreenDialog: true,
                  ),
                ),
              ),
              Spaces.vertical10,
              TextButton(
                style: TextButton.styleFrom(
                  primary: ColorPalette.editColor,
                  backgroundColor: Colors.transparent,
                  fixedSize: const Size.fromHeight(20),
                ),
                child: const Text(
                  'Log out',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Text('Log out'),
                      content: const Text('Are you sure?'),
                      actions: [
                        OutlinedButton(
                          child: const Text('Yes'),
                          style: TextButton.styleFrom(
                            fixedSize: const Size.fromHeight(45),
                            shape: const RoundedRectangleBorder(
                                borderRadius: Radiuses.r10),
                          ),
                          onPressed: () {
                            SharedHelper.removeJson('token');
                            Get.offAll(() => const WelcomeScreen());
                          },
                        ),
                        TextButton(
                          child: const Text('No'),
                          style: TextButton.styleFrom(
                            fixedSize: const Size.fromHeight(45),
                          ),
                          onPressed: () => Navigator.pop(context),
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
