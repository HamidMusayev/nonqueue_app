import 'package:json_annotation/json_annotation.dart';

part 'sign_up_request.g.dart';

@JsonSerializable()
class SignUpRequest {
  String? email;
  String? name;
  String? password;
  String? phoneNumber;
  String? signUpType;
  String? numberPrefix;

  SignUpRequest(this.email,this.name,this.password,this.phoneNumber,this.signUpType,);

  factory SignUpRequest.fromJson(Map<String, dynamic> json) => _$SignUpRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpRequestToJson(this);
}