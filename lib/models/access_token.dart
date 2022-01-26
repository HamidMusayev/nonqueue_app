import 'package:json_annotation/json_annotation.dart';
part 'access_token.g.dart';

@JsonSerializable()
class AccessToken {
  final String token;
  final DateTime expiration;

  AccessToken({required this.token, required this.expiration});

  factory AccessToken.fromJson(Map<String, dynamic> json) =>
      _$AccessTokenFromJson(json);

  Map<String, dynamic> toJson() => _$AccessTokenToJson(this);
}
