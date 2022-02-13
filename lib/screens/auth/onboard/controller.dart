import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class OnBoardController extends GetxController{
  final _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _googleAccount;

  Future<void> signInWithGoogle() async {
    try{
      _googleAccount = await _googleSignIn.signIn();
      print(_googleAccount);
      update();
    }catch(error){
      print("Platform Exception");
    }

  }
}