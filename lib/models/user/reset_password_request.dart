import 'package:json_annotation/json_annotation.dart';

part 'reset_password_request.g.dart';

@JsonSerializable()
class ResetPasswordRequest {
  String? email;
  String? otp;
  String? password;

  ResetPasswordRequest(this.email, this.otp, this.password);

  factory ResetPasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ResetPasswordRequestToJson(this);
}
