import 'package:json_annotation/json_annotation.dart';

part 'token_response.g.dart';

@JsonSerializable()
class TokenResponse {
  String? accessToken;
  DateTime? expiration;
  String? refreshToken;
  int? userId;

  TokenResponse({this.accessToken, this.expiration, this.refreshToken, this.userId});

  factory TokenResponse.fromJson(Map<String, dynamic> json) =>
      _$TokenResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TokenResponseToJson(this);
}
