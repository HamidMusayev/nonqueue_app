import 'package:json_annotation/json_annotation.dart';

part 'phone_number.g.dart';

@JsonSerializable()
class PhoneNumber {
  String? phoneNumber;

  PhoneNumber({this.phoneNumber});

  factory PhoneNumber.fromJson(Map<String, dynamic> json) =>
      _$PhoneNumberFromJson(json);

  Map<String, dynamic> toJson() => _$PhoneNumberToJson(this);
}
