
import 'package:nonqueue_app/api/result/result.dart';
import 'package:nonqueue_app/models/user.dart';

abstract class UserRepository{
  Future<Result<User>> login(User user);
  Future<Result<User>> register(User user);
  Future<Result<User>> forgetPassword(User user);
  Future<Result<User>> changePassword(User user);
  Future<Result<User>> verifySms(User user);
}