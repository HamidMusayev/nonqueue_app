// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenResponse _$TokenResponseFromJson(Map<String, dynamic> json) =>
    TokenResponse(
      accessToken: json['accessToken'] as String?,
      expiration: json['expiration'] == null
          ? null
          : DateTime.parse(json['expiration'] as String),
      refreshToken: json['refreshToken'] as String?,
      userId: json['userId'] as int?,
    );

Map<String, dynamic> _$TokenResponseToJson(TokenResponse instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'expiration': instance.expiration?.toIso8601String(),
      'refreshToken': instance.refreshToken,
      'userId': instance.userId,
    };
