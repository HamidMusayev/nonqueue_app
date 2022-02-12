import 'dart:io';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:nonqueue_app/api/abstract/api_repository.dart';
import 'package:nonqueue_app/api/result/result.dart';

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
  Future<Result> post(Map<String, dynamic> body, String url,
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
      if (kDebugMode) {
        dio.interceptors.add(PrettyDioLogger(
          request: true,
          requestHeader: true,
          requestBody: true,
          responseBody: true,
        ));
      }
      Response response = await dio.post(url, data: body);

      if (response.statusCode == 200) {
        return Result.succes(response.data);
      } else if (response.statusCode == 401) {
        return Result.error(message: 'Eauthor');
      } else {
        return Result.error(message: 'Erequest');
      }
    } catch (e) {
      return Result.error(message: 'Econnection');
    }
  }
}
