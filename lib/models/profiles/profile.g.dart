// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
      id: json['id'] as int,
      fullName: json['fullName'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      image: json['image'] as String?,
      address: json['address'] as String,
      description: json['description'] as String,
      jobTitle: json['jobTitle'] as String?,
      age: json['age'] as int,
      roleId: $enumDecode(_$RoleIdEnumMap, json['roleId']),
      roleName: json['roleName'] as String,
      token: json['token'] as String,
      catergoryId: json['catergoryId'] as String?,
      catergoryName: json['catergoryName'] as String?,
      clinicId: json['clinicId'] as String?,
      clinicName: json['clinicName'] as String?,
    );

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'email': instance.email,
      'phone': instance.phone,
      'image': instance.image,
      'address': instance.address,
      'description': instance.description,
      'jobTitle': instance.jobTitle,
      'age': instance.age,
      'roleId': _$RoleIdEnumMap[instance.roleId]!,
      'roleName': instance.roleName,
      'token': instance.token,
      'catergoryId': instance.catergoryId,
      'catergoryName': instance.catergoryName,
      'clinicId': instance.clinicId,
      'clinicName': instance.clinicName,
    };

const _$RoleIdEnumMap = {
  RoleId.patient: 1,
  RoleId.doctor: 2,
  RoleId.nurse: 3,
};
