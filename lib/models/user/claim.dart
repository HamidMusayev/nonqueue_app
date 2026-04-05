import 'package:json_annotation/json_annotation.dart';

part 'claim.g.dart';

@JsonSerializable()
class Claim {
  final int? id;
  final int? userId;
  final String? type;
  final String? value;

  Claim({this.id, this.userId, this.type, this.value});

  factory Claim.fromJson(Map<String, dynamic> json) => _$ClaimFromJson(json);

  Map<String, dynamic> toJson() => _$ClaimToJson(this);
}
