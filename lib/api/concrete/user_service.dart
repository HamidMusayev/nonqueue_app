import 'package:nonqueue_app/api/abstract/api_repository.dart';
import 'package:nonqueue_app/api/abstract/user_repository.dart';
import 'package:nonqueue_app/api/result/result.dart';
import 'package:nonqueue_app/models/user/token_request.dart';
import 'package:nonqueue_app/models/user/token_response.dart';

//SERVICE METODLARI ALINAN OBYEKLERI JSON SERIALIZE EDIB
// DIO METODLARINA GONDER VE GERI DONEN CAVABI
// JSON DESERIALIZE EDIB OBYEKT QAYTARIR

class UserService implements UserRepository {
  final ApiRepository _dio;
  final String _baseUrl = 'http://161.97.137.220:5000/Home';
  UserService(this._dio);

  @override
  Future<Result<String>> userSignUp(Map<String, dynamic> request) async {
    var res = await _dio.post(request, '$_baseUrl/UserSignUp');

    if (res.success) {
      return res.data['success']
          ? Result.succes(res.data['data'])
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
          ? Result.succes(res.data['data'])
          : Result.error(message: res.data['message']);
    } else {
      return Result.error(message: res.message);
    }
  }

  @override
  Future<Result<TokenResponse>> getResourceOwnerPasswordToken(
      TokenRequest request) {
    // TODO: implement getResourceOwnerPasswordToken
    throw UnimplementedError();
  }

  @override
  Future<Result<TokenResponse>> getResourceOwnerPasswordTokenByRefreshToken(
      TokenRequest request) {
    // TODO: implement getResourceOwnerPasswordTokenByRefreshToken
    throw UnimplementedError();
  }

  @override
  Future<Result> confirmEmail(Map<String, dynamic> request) {
    // TODO: implement confirmEmail
    throw UnimplementedError();
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
