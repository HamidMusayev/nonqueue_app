import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nonqueue_app/models/user/token_response.dart';

import '../../../api/concrete/dio_service.dart';
import '../../../api/concrete/user_service.dart';
import '../../../api/result/result.dart';
import '../../../models/user/user.dart';
import '../../../utils/constants.dart';
import '../../../utils/shared.dart';
import '../../inapp/ui.dart';

class OnBoardController extends GetxController {
  RxBool isLoading = false.obs;

  final _googleService = GoogleSignIn();
  final UserService _service = UserService(DioService());

  Future<void> googleLogin(GoogleSignInAccount googleAccount) async {
    isLoading.value = true;
    Result<TokenResponse> res = await _service.googleLogin({
      'displayName': googleAccount.displayName,
      'email': googleAccount.email,
      'photoUrl': googleAccount.photoUrl,
      'googleId': googleAccount.id,
      'serverAuthCode': googleAccount.serverAuthCode,
      'clientId': 'App',
      'clientSecrets': 'App'
    });

    if (res.success) {
      await SharedHelper.saveJson('token', res.data);

      Result<User> res2 = await _service.getById('id=${res.data?.userId}');
      if (res2.success) {
        SharedHelper.saveJson('user', res2.data?.toJson());

        Get.offAll(() => const InAppScreen());
      } else {
        Get.showSnackbar(Snacks.error(res2.message));
      }
    } else {
      Get.showSnackbar(Snacks.error(res.message));
    }
  }

  Future<void> signInWithGoogle() async {
    // try {
    //   GoogleSignInAccount? _googleAccount = await _googleService.signIn();
    //   if (_googleAccount != null && _googleAccount.serverAuthCode != null) {
    //     await googleLogin(_googleAccount);
    //   }
    //   //update();
    // } catch (error) {
    //   isLoading.value = false;
    //   Get.showSnackbar(Snacks.error('errorgooglesignin'.tr));
    // }

    isLoading.value = true;

    try {
      GoogleSignInAccount? _googleAccount = await _googleService.signIn();
      if (_googleAccount != null && _googleAccount.serverAuthCode != null) {
        await googleLogin(_googleAccount);
      }
    } catch (e) {
      Get.showSnackbar(Snacks.error('errorgooglesignin'.tr));
    }

    isLoading.value = false;
  }
}
