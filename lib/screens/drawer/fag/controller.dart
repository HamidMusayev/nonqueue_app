import 'package:get/get.dart';
import 'package:nonqueue_app/api/concrete/company_service.dart';
import 'package:nonqueue_app/models/company/faq.dart';

import '../../../api/concrete/dio_service.dart';
import '../../../api/result/result.dart';
import '../../../utils/constants.dart';

class FaqController extends GetxController {
  RxBool isLoading = false.obs;

  final CompanyService _service = CompanyService(DioService());

  List<Faq> faqs = [];

  @override
  void onInit() {
    getFaqs();
    super.onInit();
  }

  Future<void> getFaqs() async {
    isLoading.value = true;

    Result<List<Faq>> res = await _service.getAllFaqs();
    if (res.success) {
      faqs.clear();
      faqs.addAll(res.data!);

      isLoading.value = false;
    } else {
      isLoading.value = false;
      Get.showSnackbar(Snacks.error(res.message));
    }
  }
}
