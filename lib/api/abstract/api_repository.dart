import 'package:nonqueue_app/api/result/result.dart';

abstract class ApiRepository{
  Future<Result<Map<String, dynamic>>> post(Map<String, dynamic> body, String url, {String? token, String? language});
  Future<Result<Map<String, dynamic>>> get(Map<String, dynamic> body, String url);
  Future<Result<Map<String, dynamic>>> put(Map<String, dynamic> body, String url);
  Future<Result<Map<String, dynamic>>> delete(Map<String, dynamic> body, String url);
}