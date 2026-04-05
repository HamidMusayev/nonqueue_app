import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nonqueue_app/api/abstract/user_repository.dart';
import 'package:nonqueue_app/routes/app_routes.dart';
import 'package:nonqueue_app/utils/constants.dart';
import 'package:nonqueue_app/widgets/phone_input/phone_number.dart';
import '../../../api/result/result.dart';
import '../../../utils/shared.dart';

class RegisterController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isObsecure = true.obs;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailTxt = TextEditingController();
  final TextEditingController fullnameTxt = TextEditingController();
  final TextEditingController prefixTxt = TextEditingController();
  final TextEditingController numberTxt = TextEditingController();
  final TextEditingController passTxt = TextEditingController();

  final UserRepository _service = Get.find<UserRepository>();

  void changeObsecure() => isObsecure.value = !isObsecure.value;

  void onChangedNumber(PhoneNumber number) =>
      prefixTxt.text = number.countryCode;

  void register() async {
    if (formKey.currentState?.validate() ?? false) {
      isLoading.value = true;
      Result<String> result = await _service.userSignUp({
        'email': emailTxt.text,
        'name': fullnameTxt.text,
        'password': passTxt.text,
        'phoneNumber': numberTxt.text,
        'signUpType': 'user',
        'numberPrefix': prefixTxt.text,
      });

      if (result.success) {
        await SharedHelper.setString('userId', result.data!);

        final result2 = await _service.sendOTPEmail({
          'email': emailTxt.text,
          'clientId': kClientId,
          'clientSecrets': kClientSecrets,
        });

        if (result2.success) {
          Get.showSnackbar(Snacks.success(result2.message));

          Get.toNamed(
            AppRoutes.otp,
            arguments: {
              'email': emailTxt.text,
              'type': 'confirmEmail',
            },
          );
        } else {
          Get.showSnackbar(Snacks.error(result2.message));
        }
      } else {
        Get.showSnackbar(Snacks.error(result.message));
      }
      isLoading.value = false;
    }
  }
}
