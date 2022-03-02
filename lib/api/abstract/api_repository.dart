import 'package:nonqueue_app/api/result/result.dart';

abstract class ApiRepository{
  Future<Result> post(dynamic body, String url, {String? token, String? language});
  Future<Result> get(String url, {String? token, String? language});
  Future<Result> put(dynamic body, String url, {String? token, String? language});
  //Future<Result> delete(Map<String, dynamic> body, String url);
}