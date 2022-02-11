import 'package:nonqueue_app/api/result/result.dart';

abstract class ApiRepository{
  Future<Result> post(Map<String, dynamic> body, String url, {String? token, String? language});
  Future<Result> get(Map<String, dynamic> body, String url);
  Future<Result> put(Map<String, dynamic> body, String url);
  Future<Result> delete(Map<String, dynamic> body, String url);
}