import 'package:nonqueue_app/api/result/result.dart';
import 'package:nonqueue_app/models/user.dart';
import 'package:nonqueue_app/models/user/token_response.dart';
import '../../models/user/confirm_email_request.dart';
import '../../models/user/token_request.dart';
import '../../models/user/sign_up_request.dart';

abstract class UserRepository{
  Future<Result<User>> userSignUp(SignUpRequest request);
  Future<Result> sendOTPEmail(String email);
  Future<Result> confirmEmail(ConfirmEmailRequest request);
  Future<Result<TokenResponse>> getResourceOwnerPasswordToken(TokenRequest request);
  Future<Result<TokenResponse>> getResourceOwnerPasswordTokenByRefreshToken(TokenRequest request);
}