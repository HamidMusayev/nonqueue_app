// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenRequest _$TokenRequestFromJson(Map<String, dynamic> json) => TokenRequest(
      clientId: json['clientId'] as String?,
      clientSecrets: json['clientSecrets'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$TokenRequestToJson(TokenRequest instance) =>
    <String, dynamic>{
      'clientId': instance.clientId,
      'clientSecrets': instance.clientSecrets,
      'email': instance.email,
      'password': instance.password,
    };
