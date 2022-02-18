import 'dart:convert';
import 'package:nonqueue_app/api/abstract/api_repository.dart';
import 'package:nonqueue_app/api/abstract/user_repository.dart';
import 'package:nonqueue_app/api/result/result.dart';
import 'package:nonqueue_app/models/user/phone_number.dart';
import 'package:nonqueue_app/models/user/token_request.dart';
import 'package:nonqueue_app/models/user/token_response.dart';
import 'package:nonqueue_app/utils/shared.dart';

//SERVICE METODLARI ALINAN OBYEKLERI JSON SERIALIZE EDIB
// DIO METODLARINA GONDER VE GERI DONEN CAVABI
// JSON DESERIALIZE EDIB OBYEKT QAYTARIR

class UserService implements UserRepository {
  final ApiRepository _dio;
  final String _baseUrl = 'http://161.97.137.220:5000/Home';
  final String _baseUrl2 = 'http://161.97.137.220:5002/Product/Profil';
  UserService(this._dio);

  @override
  Future<Result<String>> userSignUp(Map<String, dynamic> request) async {
    var res = await _dio.post(request, '$_baseUrl/UserSignUp');

    if (res.success) {
      return res.data['success']
          ? Result.succes(res.data['value'].toString())
          : Result.error(message: res.data['message']);
    } else {
      return Result.error(message: res.message);
    }
  }

  @override
  Future<Result> sendOTPEmail(Map<String, dynamic> request) async {
    var res = await _dio.post(request, '$_baseUrl/SendOTPEmail');

    if (res.success) {
      return res.data['success']
          ? Result.succes(res.data['value'])
          : Result.error(message: res.data['message']);
    } else {
      return Result.error(message: res.message);
    }
  }

  @override
  Future<Result<TokenResponse>> getResourceOwnerPasswordToken(
      TokenRequest request) async {
    var res = await _dio.post(
        request.toJson(), '$_baseUrl/GetResourceOwnerPasswordToken');

    if (res.success) {
      return res.data['success']
          ? Result.succes(TokenResponse.fromJson(res.data['value']))
          : Result.error(message: res.data['message']);
    } else {
      return Result.error(message: res.message);
    }
  }

  @override
  Future<Result<TokenResponse>> getResourceOwnerPasswordTokenByRefreshToken(
      TokenRequest request) {
    // TODO: implement getResourceOwnerPasswordTokenByRefreshToken
    throw UnimplementedError();
  }

  @override
  Future<Result> confirmEmail(Map<String, dynamic> request) async {
    var res = await _dio.post(request, '$_baseUrl/ConfirmEmail');

    if (res.success) {
      return res.data['success']
          ? Result.succes(res.data['value'])
          : Result.error(message: res.data['message']);
    } else {
      return Result.error(message: res.message);
    }
  }

  @override
  Future<Result> checkOtp(Map<String, dynamic> request) async {
    var res = await _dio.post(request, '$_baseUrl/CheckOTP');

    if (res.success) {
      return res.data['success']
          ? Result.succes(res.data['value'])
          : Result.error(message: res.data['message']);
    } else {
      return Result.error(message: res.message);
    }
  }

  @override
  Future<Result> resetPassword(Map<String, dynamic> request) async {
    var res = await _dio.post(request, '$_baseUrl/ResetPassword');

    if (res.success) {
      return res.data['success']
          ? Result.succes(res.data['value'])
          : Result.error(message: res.data['message']);
    } else {
      return Result.error(message: res.message);
    }
  }

  @override
  Future<Result<TokenResponse>> googleLogin(
      Map<String, dynamic> request) async {
    var res = await _dio.post(request, '$_baseUrl/GoogleLogin');

    if (res.success) {
      return res.data['success']
          ? Result.succes(TokenResponse.fromJson(res.data['value']))
          : Result.error(message: res.data['message']);
    } else {
      return Result.error(message: res.message);
    }
  }

  @override
  Future<Result<List<PhoneNumber>>> checkContacts(List<String> numbers) async {
    var res = await _dio.post(
      jsonEncode(numbers),
      '$_baseUrl2/CheckContacts',
      token: TokenResponse.fromJson(await SharedHelper.readJson('token'))
          .accessToken,
    );

    if (res.success) {
      if (res.data['success']) {
        List<dynamic> parsed =
            res.data['value'].map((e) => PhoneNumber.fromJson(e)).toList();
        List<PhoneNumber> list = List<PhoneNumber>.from(parsed);
        return Result.succes(list);
      } else {
        return Result.error(message: res.data['message']);
      }
    } else {
      return Result.error(message: res.message);
    }
  }

  // @override
  // Future<Result<User>> login(User user) async {
  //   var result = await _dio.post(user.toJson(),
  //       'http://194.135.95.23:8081/medicaldirector/api/user/login',
  //       language: 'az');
  //   if (result.success) {
  //     return result.data!["success"]
  //         ? Result<User>.succes(User.fromJson(result.data!["data"]),
  //         message: result.data!["message"])
  //         : Result<User>.error(message: result.data!["message"]);
  //   } else {
  //     return Result<User>.error(message: result.message);
  //   }
  // }
  //
  // @override
  // Future<Result<User>> updateData(User user) async {
  //   var result = await _dio.post(user.toJson(),
  //       'http://194.135.95.23:8081/agrodirector_merkez/api/user/updatedata');
  //   if (result.success) {
  //     return result.data!["success"]
  //         ? Result<User>.succes(User.fromJson(result.data!["data"]),
  //         message: result.data!["message"])
  //         : Result<User>.error(message: result.data!["message"]);
  //   } else {
  //     return Result<User>.error(message: result.message);
  //   }
  // }
  //
  // @override
  // Future<Result<User>> updateProfilePicture(User user) async {
  //   var result = await _dio.post(user.toJson(), 'user/updateprofilepicture');
  //   if (result.success) {
  //     return result.data!["success"]
  //         ? Result<User>.succes(User.fromJson(result.data!["data"]),
  //         message: result.data!["message"])
  //         : Result<User>.error(message: result.data!["message"]);
  //   } else {
  //     return Result<User>.error(message: result.message);
  //   }
  // }

// Future<DataResult<bool>> sendProfilePicture(XFile xFile, String userid) async {
  //   try {
  //     EncriptionHelper encriptionHelper = EncriptionHelper();
  //     Dio dio = Dio();
  //
  //     String baseurl = await AppConfig.getApiUrl();
  //     String encuserid = encriptionHelper.hashUserId(userid);
  //
  //     var imagebytes = await xFile.readAsBytes();
  //     List<int> byteslist = imagebytes.cast();
  //
  //     var formData = FormData.fromMap({
  //       'userid': encuserid,
  //       'file': MultipartFile.fromBytes(byteslist, filename: xFile.name)
  //     });
  //
  //     var response = await dio.post(baseurl + 'user/UpdateProfilePicture2', data: formData);
  //
  //     if(response.statusCode == 200){
  //       Map<String, dynamic> bodymap = response.data;
  //
  //       if(bodymap["success"]== true){
  //         return DataResult<bool>.withoutData(true, bodymap["message"]);
  //       } else{
  //         return DataResult<bool>.withoutData(false, bodymap["message"]);
  //       }
  //     }
  //
  //     return DataResult<bool>.withoutData(false, "false");
  //   } catch (e){
  //     return DataResult<bool>.withoutData(false, ResultMessage.eRequest);
  //   }
  // }
}
