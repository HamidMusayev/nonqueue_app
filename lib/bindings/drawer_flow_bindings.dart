import 'package:get/get.dart';
import 'package:nonqueue_app/screens/drawer/account/controller.dart';
import 'package:nonqueue_app/screens/drawer/faq/controller.dart';
import 'package:nonqueue_app/screens/drawer/help/controller.dart';

class AccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountController>(() => AccountController(), fenix: true);
  }
}

class HelpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HelpController>(() => HelpController(), fenix: true);
  }
}

class FaqBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FaqController>(() => FaqController(), fenix: true);
  }
}
