import 'package:nonqueue_app/api/result/result.dart';
import 'package:nonqueue_app/models/user/phone_number.dart';
import 'package:nonqueue_app/models/user/token_response.dart';

import '../../models/user.dart';
import '../../models/user/token_request.dart';

abstract class UserRepository {
  Future<Result<String>> userSignUp(Map<String, dynamic> request);
  Future<Result> sendOTPEmail(Map<String, dynamic> request);
  Future<Result> confirmEmail(Map<String, dynamic> request);
  Future<Result> checkOtp(Map<String, dynamic> request);
  Future<Result> resetPassword(Map<String, dynamic> request);
  Future<Result<TokenResponse>> googleLogin(Map<String, dynamic> request);
  Future<Result<TokenResponse>> getResourceOwnerPasswordToken(
      TokenRequest request);
  Future<Result<TokenResponse>> getResourceOwnerPasswordTokenByRefreshToken(
      TokenRequest request);

  Future<Result> userEdit(Map<String, dynamic> request);
  Future<Result<User>> getById(String querystring);

  Future<Result<List<PhoneNumber>>> checkContacts(List<String> numbers);
  Future<Result> sendOtpForChangeEmail(Map<String, dynamic> request);
}
