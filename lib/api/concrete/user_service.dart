import 'dart:convert';

import 'package:get/get_utils/get_utils.dart';
import 'package:nonqueue_app/api/abstract/api_repository.dart';
import 'package:nonqueue_app/api/abstract/user_repository.dart';
import 'package:nonqueue_app/api/api_response_parser.dart';
import 'package:nonqueue_app/api/result/result.dart';
import 'package:nonqueue_app/core/app_config.dart';
import 'package:nonqueue_app/models/user/phone_number.dart';
import 'package:nonqueue_app/models/user/token_request.dart';
import 'package:nonqueue_app/models/user/token_response.dart';
import 'package:nonqueue_app/utils/shared.dart';

import '../../models/user/user.dart';

class UserService implements UserRepository {
  UserService(this._api);

  final ApiRepository _api;
  final String _baseUrl = AppConfig.userApiBase;

  Future<String?> _accessToken() async {
    final map = await SharedHelper.readJsonMap('token');
    if (map == null) return null;
    return TokenResponse.fromJson(map).accessToken;
  }

  @override
  Future<Result<String>> userSignUp(Map<String, dynamic> request) async {
    final res = await _api.post(request, '$_baseUrl/Home/UserSignUp');
    return ApiResponseParser.parseMap(res, (v) => v.toString());
  }

  @override
  Future<Result<void>> sendOTPEmail(Map<String, dynamic> request) async {
    final res = await _api.post(request, '$_baseUrl/Home/SendOTPEmail');
    return ApiResponseParser.parseVoidWithMessage(res, 'sendedotp'.tr);
  }

  @override
  Future<Result<TokenResponse>> getResourceOwnerPasswordToken(
    TokenRequest request,
  ) async {
    final res = await _api.post(
      request.toJson(),
      '$_baseUrl/Home/GetResourceOwnerPasswordToken',
    );
    return ApiResponseParser.parseMap(
      res,
      (v) => TokenResponse.fromJson(v as Map<String, dynamic>),
    );
  }

  @override
  Future<Result<TokenResponse>> getResourceOwnerPasswordTokenByRefreshToken(
    TokenRequest request,
  ) async {
    return Failure<TokenResponse>('Refresh token flow is not supported.');
  }

  @override
  Future<Result<void>> confirmEmail(Map<String, dynamic> request) async {
    final res = await _api.post(request, '$_baseUrl/Home/ConfirmEmail');
    return ApiResponseParser.parseVoid(res);
  }

  @override
  Future<Result<void>> checkOtp(Map<String, dynamic> request) async {
    final res = await _api.post(request, '$_baseUrl/Home/CheckOTP');
    return ApiResponseParser.parseVoid(res);
  }

  @override
  Future<Result<void>> resetPassword(Map<String, dynamic> request) async {
    final res = await _api.post(request, '$_baseUrl/Home/ResetPassword');
    return ApiResponseParser.parseVoid(res);
  }

  @override
  Future<Result<TokenResponse>> googleLogin(
    Map<String, dynamic> request,
  ) async {
    final res = await _api.post(request, '$_baseUrl/Home/GoogleLogin');
    return ApiResponseParser.parseMap(
      res,
      (v) => TokenResponse.fromJson(v as Map<String, dynamic>),
    );
  }

  @override
  Future<Result<List<PhoneNumber>>> checkContacts(
    List<String> numbers,
  ) async {
    final token = await _accessToken();
    if (token == null) {
      return Failure<List<PhoneNumber>>('eauthor'.tr);
    }
    final res = await _api.post(
      jsonEncode(numbers),
      '$_baseUrl/User/CheckContacts',
      token: token,
    );
    return ApiResponseParser.parseMap(res, (v) {
      final list = (v as List<dynamic>)
          .map((e) => PhoneNumber.fromJson(e as Map<String, dynamic>))
          .toList();
      return list;
    });
  }

  @override
  Future<Result<void>> userEdit(Map<String, dynamic> request) async {
    final token = await _accessToken();
    if (token == null) {
      return Failure<void>('eauthor'.tr);
    }
    final res = await _api.put(request, '$_baseUrl/User/Edit', token: token);
    return ApiResponseParser.parseVoid(res);
  }

  @override
  Future<Result<User>> getById(String querystring) async {
    final token = await _accessToken();
    if (token == null) {
      return Failure<User>('eauthor'.tr);
    }
    final res = await _api.get(
      '$_baseUrl/User/GetById?$querystring',
      token: token,
    );
    return ApiResponseParser.parseMap(
      res,
      (v) => User.fromJson(v as Map<String, dynamic>),
    );
  }

  @override
  Future<Result<void>> sendOtpForChangeEmail(
    Map<String, dynamic> request,
  ) async {
    final res =
        await _api.post(request, '$_baseUrl/Home/SendOTPForChangeEmail');
    return ApiResponseParser.parseVoidWithMessage(res, 'sendedotp'.tr);
  }
}
