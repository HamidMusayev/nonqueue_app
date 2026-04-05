import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nonqueue_app/api/abstract/user_repository.dart';
import 'package:nonqueue_app/models/user/token_request.dart';
import 'package:nonqueue_app/routes/app_routes.dart';

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

  final UserRepository _service = Get.find<UserRepository>();

  void changeObsecure() => isObsecure.value = !isObsecure.value;

  void login() async {
    //if (formKey.currentState?.validate() ?? false) {
      /*isLoading.value = true;
      Result<TokenResponse> res = await _service.getResourceOwnerPasswordToken(TokenRequest(
        clientId: 'App',
        clientSecrets: 'App',
        email: emailTxt.text,
        password: passTxt.text,
      ));

      if (res.success) {
        final token = res.data;
        if (token != null) {
          await SharedHelper.saveJson('token', token.toJson());
        }

        Result<User> res2 = await _service.getById('id=${res.data?.userId}');
        if (res2.success) {
          final user = res2.data;
          if (user != null) {
            await SharedHelper.saveJson('user', user.toJson());
          }

          isLoading.value = false;
          Get.offAllNamed(AppRoutes.inApp);
        } else {
          isLoading.value = false;
          Get.showSnackbar(Snacks.error(res2.message));
        }
      } else {
        isLoading.value = false;
        Get.showSnackbar(Snacks.error(res.message));
      }*/
    //}
    Get.offAllNamed(AppRoutes.inApp);
  }
}
