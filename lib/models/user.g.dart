// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      pinappusmast: json['piN_APPUSMAST'] as String?,
      pinusmastgrup: json['pinusmastgrup'] as String?,
      tcident: json['tcident'] as String?,
      username: json['username'] as String?,
      email: json['email'] as String,
      sifre: json['sifre'] as String?,
      telkod: json['telkod'] as String?,
      telno: json['telno'] as String?,
      birtdate: json['birtdate'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'piN_APPUSMAST': instance.pinappusmast,
      'pinusmastgrup': instance.pinusmastgrup,
      'tcident': instance.tcident,
      'username': instance.username,
      'email': instance.email,
      'sifre': instance.sifre,
      'telkod': instance.telkod,
      'telno': instance.telno,
      'birtdate': instance.birtdate,
    };
