import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nonqueue_app/models/user/token_request.dart';
import 'package:nonqueue_app/screens/inapp/ui.dart';

import '../../../api/concrete/dio_service.dart';
import '../../../api/concrete/user_service.dart';
import '../../../api/result/result.dart';
import '../../../models/user/token_response.dart';
import '../../../models/user/user.dart';
import '../../../utils/constants.dart';
import '../../../utils/shared.dart';

class LoginController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isObsecure = true.obs;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailTxt = TextEditingController();
  final TextEditingController passTxt = TextEditingController();

  final UserService _service = UserService(DioService());

  void changeObsecure() => isObsecure.value = !isObsecure.value;

  void login() async {
    if (formKey.currentState?.validate() ?? false) {
      isLoading.value = true;
      Result<TokenResponse> res =
          await _service.getResourceOwnerPasswordToken(TokenRequest(
        clientId: 'string',
        clientSecrets: 'string',
        email: emailTxt.text,
        password: passTxt.text,
      ));

      if (res.success) {
        SharedHelper.saveJson('token', res.data?.toJson());

        Result<User> res2 = await _service.getById('id=${res.data?.userId}');
        if (res2.success) {
          SharedHelper.saveJson('user', res2.data?.toJson());

          isLoading.value = false;
          Get.offAll(() => const InAppScreen());
        } else {
          isLoading.value = false;
          Get.showSnackbar(Snacks.error(res2.message));
        }
      } else {
        isLoading.value = false;
        Get.showSnackbar(Snacks.error(res.message));
      }
    }
  }
}
