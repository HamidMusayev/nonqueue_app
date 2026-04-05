import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:nonqueue_app/utils/shared.dart';

import 'package:nonqueue_app/api/abstract/user_repository.dart';

import '../../api/result/result.dart';
import '../../models/user/user.dart';
import '../../utils/constants.dart';

class ProfileController extends GetxController {
  RxBool isFullnameChanged = false.obs;
  RxBool isUsernameChanged = false.obs;
  RxBool isBioChanged = false.obs;

  RxBool isLoading = false.obs;

  late User _user;
  final UserRepository _service = Get.find<UserRepository>();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController fullnameTxt = TextEditingController();
  final TextEditingController usernameTxt = TextEditingController();
  final TextEditingController bioTxt = TextEditingController();

  @override
  void onInit() {
    getUserData();
    super.onInit();
  }

  void checkFullName(String input) {
    if (isFullnameChanged.isFalse) isFullnameChanged.value = true;
  }

  void checkUsername(String input) {
    if (isUsernameChanged.isFalse) isUsernameChanged.value = true;
  }

  void checkBio(String input) {
    if (isBioChanged.isFalse) isBioChanged.value = true;
  }

  void getUserData() async {
    final map = await SharedHelper.readJsonMap('user');
    if (map == null) {
      Get.showSnackbar(Snacks.error('eauthor'.tr));
      return;
    }
    _user = User.fromJson(map);
    fullnameTxt.text = _user.name!;
    usernameTxt.text = _user.userName ?? '';
    if (_user.userClaims?.where((e) => e.type == 'Bio').toList().isNotEmpty ??
        false) {
      bioTxt.text =
          _user.userClaims?.firstWhere((e) => e.type == 'Bio').value ?? '';
    }
  }

  Future<void> saveUserData() async {
    if (formKey.currentState?.validate() ?? false) {
      isLoading.value = true;
      if (isFullnameChanged.value) {
        await editUser('FullName', fullnameTxt.text);
      }
      if (isUsernameChanged.value) {
        await editUser('UserName', usernameTxt.text);
      }
      if (isBioChanged.value) {
        await editUser('Bio', bioTxt.text);
      }
      isBioChanged.value = false;
      isUsernameChanged.value = false;
      isFullnameChanged.value = false;

      Result<User> res2 = await _service.getById('id=${_user.id}');
      if (res2.success) {
        final u = res2.data;
        if (u != null) {
          await SharedHelper.saveJson('user', u.toJson());
        }
      } else {
        Get.showSnackbar(Snacks.error(res2.message));
      }

      isLoading.value = false;
    }
  }

  Future<void> editUser(String propName, String value) async {
    final Result<void> res = await _service.userEdit({
      'propName': propName,
      'value': value,
      'appUserId': _user.id.toString(),
      'otp': 0000
    });

    if (res.success) {
      Get.showSnackbar(Snacks.success(res.message));
    } else {
      Get.showSnackbar(Snacks.error(res.message));
    }
  }
}
