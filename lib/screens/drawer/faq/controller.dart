import 'package:get/get.dart';
import 'package:nonqueue_app/api/abstract/company_repository.dart';
import 'package:nonqueue_app/models/company/faq.dart';

import '../../../api/result/result.dart';
import '../../../utils/constants.dart';

class FaqController extends GetxController {
  RxBool isLoading = false.obs;

  final CompanyRepository _service = Get.find<CompanyRepository>();

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
