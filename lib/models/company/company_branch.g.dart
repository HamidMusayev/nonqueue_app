// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_branch.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyBranch _$CompanyBranchFromJson(Map<String, dynamic> json) =>
    CompanyBranch(
      id: json['id'] as int,
      name: json['name'] as String,
      companyId: json['companyId'] as int,
      description: json['description'] as String?,
      locationX: (json['locationX'] as num?)?.toDouble(),
      locationY: (json['locationY'] as num?)?.toDouble(),
      adress: json['adress'] as String?,
      stars: (json['stars'] as num).toDouble(),
      status: json['status'] as String,
    );

Map<String, dynamic> _$CompanyBranchToJson(CompanyBranch instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'companyId': instance.companyId,
      'description': instance.description,
      'locationX': instance.locationX,
      'locationY': instance.locationY,
      'adress': instance.adress,
      'stars': instance.stars,
      'status': instance.status,
    };
