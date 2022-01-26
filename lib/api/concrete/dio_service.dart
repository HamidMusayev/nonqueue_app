import 'dart:io';

import 'package:dio/dio.dart';
import 'package:nonqueue_app/api/abstract/api_repository.dart';
import 'package:nonqueue_app/api/result/result.dart';
import 'package:nonqueue_app/api/result/result_message.dart';

class DIOService implements ApiRepository {
  @override
  Future<Result<Map<String, dynamic>>> delete(
      Map<String, dynamic> body, String url) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Result<Map<String, dynamic>>> get(
      Map<String, dynamic> body, String url) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future<Result<Map<String, dynamic>>> put(
      Map<String, dynamic> body, String url) {
    // TODO: implement put
    throw UnimplementedError();
  }

  @override
  Future<Result<Map<String, dynamic>>> post(
      Map<String, dynamic> body, String url,
      {String? token, String? language}) async {
    var options = BaseOptions(headers: <String, String>{
      HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8'
    });

    if (token != null) {
      options.headers
          .addAll({HttpHeaders.authorizationHeader: 'Bearer $token'});
    }
    if (language != null) {
      options.headers.addAll({HttpHeaders.acceptLanguageHeader: language});
    }

    try {
      Dio dio = Dio(options);
      Response response = await dio.post(url, data: body);

      if (response.statusCode == 200) {
        return Result.succes(response.data);
      } else if (response.statusCode == 401) {
        return Result.error(message: ResultMessage.eAuthorization);
      } else {
        return Result.error(message: ResultMessage.eConnection);
      }
    } catch (e) {
      return Result.error(message: ResultMessage.eRequest);
    }
  }
}
