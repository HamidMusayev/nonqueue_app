import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:nonqueue_app/api/concrete/company_service.dart';

import '../../../api/concrete/dio_service.dart';
import '../../../api/result/result.dart';
import '../../../utils/constants.dart';

class HelpController extends GetxController {
  RxBool isLoading = false.obs;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController msgTxt = TextEditingController();

  final CompanyService _service = CompanyService(DioService());

  Future<void> sendForHelp() async {
    if (formKey.currentState?.validate() ?? false) {
      isLoading.value = true;
      Result<int> res = await _service.addQuestion({'questionText': msgTxt.text});

      if (res.success) {
        isLoading.value = false;
        msgTxt.clear();

        Get.back(closeOverlays: false);
        Get.showSnackbar(Snacks.success('sendedquestion'.tr));
      } else {
        isLoading.value = false;
        Get.showSnackbar(Snacks.error(res.message));
      }
    }
  }
}
