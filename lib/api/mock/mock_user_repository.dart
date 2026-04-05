import 'package:nonqueue_app/api/abstract/user_repository.dart';
import 'package:nonqueue_app/api/result/result.dart';
import 'package:nonqueue_app/models/user/claim.dart';
import 'package:nonqueue_app/models/user/phone_number.dart';
import 'package:nonqueue_app/models/user/token_request.dart';
import 'package:nonqueue_app/models/user/token_response.dart';
import 'package:nonqueue_app/models/user/user.dart';

/// Offline demo auth and user flows — no HTTP.
class MockUserRepository implements UserRepository {
  static const int _demoUserId = 1;
  static const String _demoEmail = 'demo@nonqueue.app';

  TokenResponse _demoToken() => TokenResponse(
        accessToken: 'mock_access_token_demo',
        refreshToken: 'mock_refresh_token',
        expiration: DateTime.now().add(const Duration(days: 30)),
        userId: _demoUserId,
      );

  User _demoUser({int? id}) => User(
        id: id ?? _demoUserId,
        name: 'Demo User',
        email: _demoEmail,
        userName: 'demo_user',
        phoneNumber: '+994501112233',
        userClaims: [
          Claim(id: 1, userId: id ?? _demoUserId, type: 'Bio', value: 'Demo profile for app showcase.'),
          Claim(id: 2, userId: id ?? _demoUserId, type: 'Gender', value: 'Other'),
          Claim(id: 3, userId: id ?? _demoUserId, type: 'DateOfBirth', value: '1992-06-15'),
        ],
      );

  int? _parseUserIdFromQuery(String querystring) {
    final m = RegExp(r'id=(\d+)').firstMatch(querystring);
    if (m == null) return null;
    return int.tryParse(m.group(1)!);
  }

  @override
  Future<Result<String>> userSignUp(Map<String, dynamic> request) async {
    return const Success<String>('mock-signup-user-id');
  }

  @override
  Future<Result<void>> sendOTPEmail(Map<String, dynamic> request) async {
    return const Success<void>(null, message: 'OTP sent (demo — any code works in UI flow).');
  }

  @override
  Future<Result<TokenResponse>> getResourceOwnerPasswordToken(
    TokenRequest request,
  ) async {
    return Success<TokenResponse>(_demoToken());
  }

  @override
  Future<Result<TokenResponse>> getResourceOwnerPasswordTokenByRefreshToken(
    TokenRequest request,
  ) async {
    return const Failure<TokenResponse>('Refresh token not available in mock mode.');
  }

  @override
  Future<Result<void>> confirmEmail(Map<String, dynamic> request) async {
    return const Success<void>(null, message: 'Email confirmed (demo).');
  }

  @override
  Future<Result<void>> checkOtp(Map<String, dynamic> request) async {
    return const Success<void>(null, message: 'OTP OK (demo).');
  }

  @override
  Future<Result<void>> resetPassword(Map<String, dynamic> request) async {
    return const Success<void>(null, message: 'Password updated (demo).');
  }

  @override
  Future<Result<TokenResponse>> googleLogin(Map<String, dynamic> request) async {
    return Success<TokenResponse>(_demoToken());
  }

  @override
  Future<Result<List<PhoneNumber>>> checkContacts(List<String> numbers) async {
    if (numbers.isEmpty) {
      return const Success<List<PhoneNumber>>([]);
    }
    final take = numbers.length < 4 ? numbers.length : 4;
    final matched = <PhoneNumber>[];
    for (var i = 0; i < take; i++) {
      matched.add(PhoneNumber(phoneNumber: numbers[i]));
    }
    return Success<List<PhoneNumber>>(matched);
  }

  @override
  Future<Result<void>> userEdit(Map<String, dynamic> request) async {
    return const Success<void>(null, message: 'Profile updated (demo).');
  }

  @override
  Future<Result<User>> getById(String querystring) async {
    final id = _parseUserIdFromQuery(querystring) ?? _demoUserId;
    return Success<User>(_demoUser(id: id));
  }

  @override
  Future<Result<void>> sendOtpForChangeEmail(Map<String, dynamic> request) async {
    return const Success<void>(null, message: 'OTP sent (demo).');
  }
}
