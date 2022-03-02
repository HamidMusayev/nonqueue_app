import 'package:json_annotation/json_annotation.dart';
import 'package:nonqueue_app/models/claim.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final String? id;
  final String? name;
  final String? email;
  final String? userName;
  final String? isActive;
  final String? phoneNumber;
  final List<Claim>? userClaims;

  User(
      {this.id,
      this.name,
      this.email,
      this.userName,
      this.isActive,
      this.phoneNumber,
      this.userClaims});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
