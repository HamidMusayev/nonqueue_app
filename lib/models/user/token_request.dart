import 'package:json_annotation/json_annotation.dart';

part 'token_request.g.dart';

@JsonSerializable()
class TokenRequest {
  String? clientId;
  String? clientSecrets;
  String? email;
  String? password;

  TokenRequest({this.clientId, this.clientSecrets, this.email, this.password});

  factory TokenRequest.fromJson(Map<String, dynamic> json) =>
      _$TokenRequestFromJson(json);

  Map<String, dynamic> toJson() => _$TokenRequestToJson(this);
}
