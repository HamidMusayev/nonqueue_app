import 'package:nonqueue_app/api/result/result.dart';
import 'package:nonqueue_app/models/user/phone_number.dart';
import 'package:nonqueue_app/models/user/token_response.dart';
import '../../models/user/token_request.dart';
import '../../models/user/user.dart';

abstract class UserRepository {
  Future<Result<String>> userSignUp(Map<String, dynamic> request);
  Future<Result<void>> sendOTPEmail(Map<String, dynamic> request);
  Future<Result<void>> confirmEmail(Map<String, dynamic> request);
  Future<Result<void>> checkOtp(Map<String, dynamic> request);
  Future<Result<void>> resetPassword(Map<String, dynamic> request);
  Future<Result<TokenResponse>> googleLogin(Map<String, dynamic> request);
  Future<Result<TokenResponse>> getResourceOwnerPasswordToken(
    TokenRequest request,
  );
  Future<Result<TokenResponse>> getResourceOwnerPasswordTokenByRefreshToken(
    TokenRequest request,
  );

  Future<Result<void>> userEdit(Map<String, dynamic> request);
  Future<Result<User>> getById(String querystring);

  Future<Result<List<PhoneNumber>>> checkContacts(List<String> numbers);
  Future<Result<void>> sendOtpForChangeEmail(Map<String, dynamic> request);
}
