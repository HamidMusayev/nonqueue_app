import 'package:nonqueue_app/api/result/result.dart';

abstract class ApiRepository {
  Future<Result<Map<String, dynamic>>> post(
    dynamic body,
    String url, {
    String? token,
  });

  Future<Result<Map<String, dynamic>>> get(String url, {String? token});

  Future<Result<Map<String, dynamic>>> put(
    dynamic body,
    String url, {
    String? token,
  });
}
