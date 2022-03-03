import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nonqueue_app/screens/auth/login/ui.dart';
import 'package:nonqueue_app/screens/auth/register/ui.dart';
import 'package:nonqueue_app/utils/constants.dart';
import 'package:nonqueue_app/widgets/shadow.dart';
import 'controller.dart';

class OnBoardScreen extends GetView<OnBoardController> {
  const OnBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardController());

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
                      child: const Text('Sign Up'),
                      onPressed: () => Get.to(const RegisterScreen()),
                    ),
                    Spaces.vertical10,
                    TextButton.icon(
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.white, primary: Colors.black),
                      label: const Text('Continue with Google'),
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
                                primary: Colors.black),
                            label: const Text('Continue with Apple'),
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
                        const Text(
                          'Already have an account?',
                          style: TextStyle(color: Colors.white),
                        ),
                        GestureDetector(
                          child: const Text(
                            'LOG IN',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: () => Get.to(const LoginScreen()),
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
