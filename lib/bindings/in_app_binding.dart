import 'package:get/get.dart';
import 'package:nonqueue_app/screens/contacts/controller.dart';
import 'package:nonqueue_app/screens/drawer/controller.dart';
import 'package:nonqueue_app/screens/home/controller.dart';
import 'package:nonqueue_app/screens/profile/controller.dart';

class InAppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
    Get.lazyPut<ContactsController>(() => ContactsController(), fenix: true);
    Get.lazyPut<ProfileController>(() => ProfileController(), fenix: true);
    Get.lazyPut<CustomDrawerController>(
      () => CustomDrawerController(),
      fenix: true,
    );
  }
}
