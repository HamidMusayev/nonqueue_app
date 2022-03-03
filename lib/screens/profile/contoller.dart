import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:nonqueue_app/utils/shared.dart';

import '../../api/concrete/dio_service.dart';
import '../../api/concrete/user_service.dart';
import '../../api/result/result.dart';
import '../../models/user.dart';
import '../../utils/constants.dart';

class ProfileController extends GetxController {
  RxBool isFullnameChanged = false.obs;
  RxBool isUsernameChanged = false.obs;
  RxBool isBioChanged = false.obs;

  RxBool isLoading = false.obs;

  late User _user;
  final UserService _service = UserService(DioService());

  final TextEditingController fullnameTxt = TextEditingController();
  final TextEditingController usernameTxt = TextEditingController();
  final TextEditingController bioTxt = TextEditingController();

  @override
  void onInit() {
    getUserData();
    super.onInit();
  }

  void checkFullName(String input) {
    if (!(input == _user.name)) isFullnameChanged.value = true;
  }

  void checkUsername(String input) {
    if (!(input == _user.userName)) isUsernameChanged.value = true;
  }

  void checkBio(String input) {
    if (_user.userClaims?.where((e) => e.type == 'Bio').toList().isNotEmpty ??
        false) {
      if (!(input ==
          _user.userClaims?.firstWhere((e) => e.type == 'Bio').value)) {
        isBioChanged.value = true;
      }
    } else {
      isBioChanged.value = true;
    }
  }

  void getUserData() async {
    _user = User.fromJson(await SharedHelper.readJson('user'));
    fullnameTxt.text = _user.name!;
    usernameTxt.text = _user.userName ?? '';
    if (_user.userClaims?.where((e) => e.type == 'Bio').toList().isNotEmpty ??
        false) {
      bioTxt.text =
          _user.userClaims?.firstWhere((e) => e.type == 'Bio').value ?? '';
    }
  }

  Future<void> saveUserData() async {
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
  }

  Future<void> editUser(String propName, String value) async {
    Result res = await _service.userEdit({
      'propName': propName,
      'value': value,
      'appUserId': _user.id.toString(),
      'otp': 0000
    });

    if (res.success) {
      Result<User> res2 = await _service.getById('id=${_user.id}');
      if (res2.success) {
        SharedHelper.saveJson('user', res2.data?.toJson());

        isLoading.value = false;
        Get.showSnackbar(Snacks.success(res.message));
      } else {
        isLoading.value = false;
        Get.showSnackbar(Snacks.error(res2.message));
      }
    } else {
      isLoading.value = false;
      Get.showSnackbar(Snacks.error(res.message));
    }
  }
}
