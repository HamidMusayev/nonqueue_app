import 'package:json_annotation/json_annotation.dart';

part 'company_branch.g.dart';

@JsonSerializable()
class CompanyBranch {
  final int id;
  final String name;
  final int companyId;
  final String? description;
  final double? locationX;
  final double? locationY;
  final String adress;
  final double stars;
  final String status;

  CompanyBranch(
      {required this.id,
      required this.name,
      required this.companyId,
      this.description,
      this.locationX,
      this.locationY,
      required this.adress,
      required this.stars,
      required this.status});

  factory CompanyBranch.fromJson(Map<String, dynamic> json) =>
      _$CompanyBranchFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyBranchToJson(this);
}
