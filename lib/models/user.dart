import 'package:json_annotation/json_annotation.dart';

import 'access_token.dart';
part 'user.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name: 'piN_APPUSMAST')
  final String? pinappusmast;
  final String? pinusmastgrup;
  final String? tcident;
  final String? username;
  final String email;
  String? sifre;
  final String? telkod;
  final String? telno;
  final String? birtdate;
  final AccessToken? token;

  User(
      {this.pinappusmast,
      this.pinusmastgrup,
      this.tcident,
      this.username,
      required this.email,
      required this.sifre,
      this.telkod,
      this.telno,
      this.birtdate,
      this.token});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
