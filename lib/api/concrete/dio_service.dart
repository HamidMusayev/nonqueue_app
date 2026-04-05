import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:nonqueue_app/api/abstract/api_repository.dart';
import 'package:nonqueue_app/api/result/result.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioService implements ApiRepository {
  DioService(this._dio);

  final dio.Dio _dio;

  static DioService create() {
    final client = dio.Dio(
      dio.BaseOptions(
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: <String, dynamic>{
          HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
        },
      ),
    );

    client.interceptors.add(
      dio.InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers[HttpHeaders.acceptLanguageHeader] =
              Get.locale?.languageCode ?? 'en';
          handler.next(options);
        },
      ),
    );

    if (kDebugMode) {
      client.interceptors.add(
        PrettyDioLogger(
          requestBody: true,
          responseBody: true,
          requestHeader: true,
        ),
      );
    }

    return DioService(client);
  }

  dio.Options _authOptions(String? token) {
    if (token == null) return dio.Options();
    return dio.Options(
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
    );
  }

  Future<Result<Map<String, dynamic>>> _handle(
    Future<dio.Response<dynamic>> call,
  ) async {
    try {
      final response = await call;
      final code = response.statusCode ?? 0;
      if (code >= 200 && code < 300) {
        final raw = response.data;
        if (raw is Map<String, dynamic>) {
          return Success<Map<String, dynamic>>(raw);
        }
        if (raw is Map) {
          return Success<Map<String, dynamic>>(
            Map<String, dynamic>.from(raw),
          );
        }
        return Failure<Map<String, dynamic>>('erequest'.tr);
      }
      if (code == 401 || code == 403) {
        return Failure<Map<String, dynamic>>('eauthor'.tr);
      }
      return Failure<Map<String, dynamic>>('erequest'.tr);
    } on dio.DioException catch (e) {
      final sc = e.response?.statusCode;
      if (sc == 401 || sc == 403) {
        return Failure<Map<String, dynamic>>('eauthor'.tr);
      }
      return Failure<Map<String, dynamic>>('econnection'.tr);
    }
  }

  @override
  Future<Result<Map<String, dynamic>>> post(
    dynamic body,
    String url, {
    String? token,
  }) {
    return _handle(
      _dio.post<dynamic>(url, data: body, options: _authOptions(token)),
    );
  }

  @override
  Future<Result<Map<String, dynamic>>> put(
    dynamic body,
    String url, {
    String? token,
  }) {
    return _handle(
      _dio.put<dynamic>(url, data: body, options: _authOptions(token)),
    );
  }

  @override
  Future<Result<Map<String, dynamic>>> get(String url, {String? token}) {
    return _handle(_dio.get<dynamic>(url, options: _authOptions(token)));
  }
}
