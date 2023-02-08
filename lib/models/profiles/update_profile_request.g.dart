// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_profile_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$UpdateProfileRequestToJson(
        UpdateProfileRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
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
  RoleId.doctor: 1,
  RoleId.patient: 2,
  RoleId.nurse: 3,
};
