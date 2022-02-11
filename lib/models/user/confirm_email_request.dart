import 'package:json_annotation/json_annotation.dart';

part 'confirm_email_request.g.dart';

@JsonSerializable()
class ConfirmEmailRequest {
  String? email;
  String? otp;

  ConfirmEmailRequest(this.email, this.otp);

  factory ConfirmEmailRequest.fromJson(Map<String, dynamic> json) =>
      _$ConfirmEmailRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ConfirmEmailRequestToJson(this);
}
