// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'speciality.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Speciality _$SpecialityFromJson(Map<String, dynamic> json) => Speciality(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String?,
      image: json['image'] as String,
    );

Map<String, dynamic> _$SpecialityToJson(Speciality instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
    };
