// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$SignupRequestToJson(SignupRequest instance) =>
    <String, dynamic>{
      'address': instance.address,
      'age': instance.age,
      'description': instance.description,
      'email': instance.email,
      'fullName': instance.fullName,
      'password': instance.password,
      'phone': instance.phone,
      'roleId': _$RoleIdEnumMap[instance.roleId]!,
    };

const _$RoleIdEnumMap = {
  RoleId.patient: 1,
  RoleId.doctor: 2,
  RoleId.nurse: 3,
};
