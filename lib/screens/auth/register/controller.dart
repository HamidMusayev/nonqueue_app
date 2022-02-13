import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nonqueue_app/widgets/phone_input/phone_number.dart';
import '../../../api/concrete/dio_service.dart';
import '../../../api/concrete/user_service.dart';
import '../../../api/result/result.dart';
import '../../../models/user.dart';
import '../../../utils/shared.dart';

class RegisterController extends GetxController{
  RxBool isLoading = false.obs;
  RxBool isObsecure = true.obs;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailTxt = TextEditingController();
  final TextEditingController usernameTxt = TextEditingController();
  final TextEditingController prefixTxt = TextEditingController();
  final TextEditingController numberTxt = TextEditingController();
  final TextEditingController passTxt = TextEditingController();

  final UserService _service = UserService(DIOService());

  void changeObsecure(){
    isObsecure.value = !isObsecure.value;
  }

  void onChangedNumber(PhoneNumber number){
    prefixTxt.text = number.countryCode;
  }

  void register() async {
    isLoading.value = true;
    Result<User> result =
    await _service.login(User(email: emailTxt.text, sifre: passTxt.text));
    if (result.success) {
      User _user = result.data!;
      SharedHelper.saveJson('user', _user.toJson());

      //Navigator.pushReplacement(context, SlideRightRoute(page: const InAppScreen()));
    } else {
      isLoading.value = false;
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(
      //     backgroundColor: Colors.red,
      //     content: Wrap(
      //       direction: Axis.horizontal,
      //       spacing: 10,
      //       runSpacing: 10,
      //       children: [
      //         const Icon(Icons.cancel_rounded, color: Colors.white),
      //         Text(result.message),
      //       ],
      //     ),
      //   ),
      // );
    }
  }

}