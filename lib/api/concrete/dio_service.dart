import 'dart:io';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:nonqueue_app/api/abstract/api_repository.dart';
import 'package:nonqueue_app/api/result/result.dart';

//DIO METODLARI JSON FORMATINDA DATA ALIB SERVERE SORGULARI GONDERIR
//VE RESPONSE CODU YOXLAYIB GERIYE JSON QAYTARIR

class DioService implements ApiRepository {
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
