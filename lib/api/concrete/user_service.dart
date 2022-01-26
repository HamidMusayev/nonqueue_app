import 'package:flutter/foundation.dart';
import 'package:nonqueue_app/api/abstract/api_repository.dart';
import 'package:nonqueue_app/api/abstract/user_repository.dart';
import 'package:nonqueue_app/api/result/result.dart';
import 'package:nonqueue_app/models/user.dart';

class UserService implements UserRepository {
  final ApiRepository _apiRepository;
  UserService(this._apiRepository);

  @override
  Future<Result<User>> login(User user) async {
    var result = await _apiRepository.post(user.toJson(),
        'http://194.135.95.23:8081/medicaldirector/api/user/login',
        language: 'az');
    if (result.success) {
      return result.data!["success"]
          ? Result<User>.succes(User.fromJson(result.data!["data"]),
              message: result.data!["message"])
          : Result<User>.error(message: result.data!["message"]);
    } else {
      return Result<User>.error(message: result.message);
    }
  }

  @override
  Future<Result<User>> updateData(User user) async {
    var result = await _apiRepository.post(user.toJson(),
        'http://194.135.95.23:8081/agrodirector_merkez/api/user/updatedata');
    if (result.success) {
      return result.data!["success"]
          ? Result<User>.succes(User.fromJson(result.data!["data"]),
              message: result.data!["message"])
          : Result<User>.error(message: result.data!["message"]);
    } else {
      return Result<User>.error(message: result.message);
    }
  }

  @override
  Future<Result<User>> updateProfilePicture(User user) async {
    var result = await _apiRepository.post(
        user.toJson(), 'user/updateprofilepicture',
        token: user.token?.token);
    if (result.success) {
      return result.data!["success"]
          ? Result<User>.succes(User.fromJson(result.data!["data"]),
              message: result.data!["message"])
          : Result<User>.error(message: result.data!["message"]);
    } else {
      return Result<User>.error(message: result.message);
    }
  }

  @override
  Future<Result<User>> changePassword(User user) {
    // TODO: implement changePassword
    throw UnimplementedError();
  }

  @override
  Future<Result<User>> forgetPassword(User user) {
    // TODO: implement forgetPassword
    throw UnimplementedError();
  }

  @override
  Future<Result<User>> register(User user) {
    // TODO: implement register
    throw UnimplementedError();
  }

  @override
  Future<Result<User>> verifySms(User user) {
    // TODO: implement verifySms
    throw UnimplementedError();
  }

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
