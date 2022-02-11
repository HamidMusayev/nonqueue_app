import 'package:json_annotation/json_annotation.dart';

part 'token_response.g.dart';

@JsonSerializable()
class TokenResponse {
  String? accessToken;
  DateTime? expiration;
  String? refreshToken;

  TokenResponse(this.accessToken,this.expiration,this.refreshToken,);

  factory TokenResponse.fromJson(Map<String, dynamic> json) => _$TokenResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TokenResponseToJson(this);
}