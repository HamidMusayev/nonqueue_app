import 'package:get/get.dart';
import 'package:nonqueue_app/api/abstract/api_repository.dart';
import 'package:nonqueue_app/api/abstract/company_repository.dart';
import 'package:nonqueue_app/api/abstract/user_repository.dart';
import 'package:nonqueue_app/api/concrete/company_service.dart';
import 'package:nonqueue_app/api/concrete/dio_service.dart';
import 'package:nonqueue_app/api/concrete/user_service.dart';
import 'package:nonqueue_app/api/mock/mock_company_repository.dart';
import 'package:nonqueue_app/api/mock/mock_user_repository.dart';
import 'package:nonqueue_app/core/app_config.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    if (AppConfig.useMockApi) {
      Get.put<UserRepository>(MockUserRepository(), permanent: true);
      Get.put<CompanyRepository>(MockCompanyRepository(), permanent: true);
      return;
    }

    Get.put<ApiRepository>(DioService.create(), permanent: true);
    Get.put<UserRepository>(
      UserService(Get.find<ApiRepository>()),
      permanent: true,
    );
    Get.put<CompanyRepository>(
      CompanyService(Get.find<ApiRepository>()),
      permanent: true,
    );
  }
}
