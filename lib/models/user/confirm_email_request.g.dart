// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'confirm_email_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfirmEmailRequest _$ConfirmEmailRequestFromJson(Map<String, dynamic> json) =>
    ConfirmEmailRequest(
      json['email'] as String?,
      json['otp'] as String?,
    );

Map<String, dynamic> _$ConfirmEmailRequestToJson(
        ConfirmEmailRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'otp': instance.otp,
    };
