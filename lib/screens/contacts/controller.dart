import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:get/get.dart';
import 'package:nonqueue_app/models/user/phone_number.dart';

import '../../api/concrete/dio_service.dart';
import '../../api/concrete/user_service.dart';
import '../../api/result/result.dart';
import '../../utils/constants.dart';

class ContactsController extends GetxController {
  RxBool isGranted = true.obs;
  RxBool isLoading = true.obs;

  final List<Contact> contacts = [];
  final List<Contact> nonQueueContacts = [];

  final UserService _service = UserService(DioService());

  @override
  void onInit() {
    initContacts();
    super.onInit();
  }

  Future<void> getContacts() async {
    isLoading.value = true;
    if (await FlutterContacts.requestPermission(readonly: true)) {
      isGranted.value = true;

      contacts.clear();
      contacts.addAll(await FlutterContacts.getContacts(
          withPhoto: false, withProperties: true));
    } else {
      isGranted.value = false;
    }
    isLoading.value = false;
    update();
  }

  Future<void> checkContacts() async {
    isLoading.value = true;
    List<String> contactstosend = [];

    for (Contact cont in contacts) {
      for (Phone phon in cont.phones) {
        contactstosend.add(phon.normalizedNumber);
      }
    }

    Result<List<PhoneNumber>> res =
        await _service.checkContacts(contactstosend);

    if (res.success) {
      for (Contact cont in contacts) {
        for (Phone phon in cont.phones) {
          if (res.data!
              .where((c) => c.phoneNumber == phon.normalizedNumber)
              .toList()
              .isNotEmpty) {
            nonQueueContacts.add(cont);
          }
        }
      }

      isLoading.value = false;
    } else {
      isLoading.value = false;
      Get.showSnackbar(Snacks.error(res.message));
    }
    update();
  }

  void initContacts() async {
    await getContacts();
    if (isGranted.value) {
      await checkContacts();
    }
  }
}
