import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nonqueue_app/routes/app_routes.dart';
import 'package:nonqueue_app/utils/constants.dart';
import 'package:nonqueue_app/widgets/shadow.dart';
import 'controller.dart';

class OnBoardScreen extends GetView<OnBoardController> {
  const OnBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/splash/onboard.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Obx(
              () => Visibility(
                visible: controller.isLoading.value,
                child: const Center(
                  child: CircularProgressIndicator(
                    color: ColorPalette.glassEffect,
                  ),
                ),
              ),
            ),
            const ShadowGradient(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: Paddings.p24,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextButton(
                      child: Text('signup'.tr),
                      onPressed: () => Get.toNamed(AppRoutes.register),
                    ),
                    Spaces.vertical10,
                    TextButton.icon(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                      ),
                      label: Text('continuegoogle'.tr),
                      icon: SvgPicture.asset(
                        'assets/splash/google.svg',
                        width: 30,
                      ),
                      onPressed: controller.signInWithGoogle,
                    ),
                    Platform.isIOS
                        ? TextButton.icon(
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                            ),
                            label: Text('continueapple'.tr),
                            icon: SvgPicture.asset(
                              'assets/splash/apple.svg',
                              width: 30,
                            ),
                            onPressed: controller.signInWithGoogle,
                          )
                        : Container(),
                    // Spaces.vertical10,
                    // TextButton.icon(
                    //   onPressed: () {},
                    //   style: TextButton.styleFrom(backgroundColor: Colors.blue),
                    //   label: const Text("Continue With Facebook"),
                    //   icon: SvgPicture.asset(
                    //     "assets/splash/facebook.svg",
                    //     width: 30,
                    //   ),
                    // ),
                    const Divider(color: Colors.white, height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'alreadyhaveaccount'.tr,
                          style: const TextStyle(color: Colors.white),
                        ),
                        GestureDetector(
                          child: Text(
                            'loginupper'.tr,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: () => Get.toNamed(AppRoutes.login),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
