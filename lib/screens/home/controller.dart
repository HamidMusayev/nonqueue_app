import 'package:get/get.dart';
import 'package:nonqueue_app/api/concrete/company_service.dart';
import 'package:nonqueue_app/models/company/company_branch.dart';

import '../../api/concrete/dio_service.dart';
import '../../api/result/result.dart';
import '../../utils/constants.dart';

class HomeController extends GetxController {
  RxBool isLoading = false.obs;

  final CompanyService _service = CompanyService(DioService());

  List<CompanyBranch> branches = [];

  final List<List<bool>> items = [
    [
      true,
      true,
      true,
      true,
      true,
      true,
      true,
      true,
      true,
      true,
    ],
    [
      true,
      true,
      true,
      true,
      true,
      true,
      true,
      true,
      true,
      true,
    ],
    [
      true,
      true,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
    ],
  ];

  @override
  void onInit() {
    getCompanyBranches();
    super.onInit();
  }

  Future<void> getCompanyBranches() async {
    isLoading.value = true;
    Result<List<CompanyBranch>> res = await _service.getAllActiveBranch();

    if (res.success) {
      branches = res.data ?? [];
      isLoading.value = false;

      //update();
    } else {
      isLoading.value = false;
      Get.showSnackbar(Snacks.error(res.message));
    }
  }
}
