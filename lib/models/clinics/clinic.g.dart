// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clinic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Clinic _$ClinicFromJson(Map<String, dynamic> json) => Clinic(
      id: json['id'] as int,
      name: json['name'] as String,
      address: json['address'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String?,
      description: json['description'] as String,
      days: (json['days'] as List<dynamic>).map((e) => e as int).toList(),
      startWork: (json['startWork'] as num).toDouble(),
      endWork: (json['endWork'] as num).toDouble(),
      doctorId: json['doctorId'] as int,
      doctorName: json['doctorFullName'] as String,
      doctorJobTitle: json['doctorJobTitle'] as String?,
      doctorPhone: json['doctorPhone'] as String,
      doctorDescription: json['doctorDescription'] as String?,
    );

Map<String, dynamic> _$ClinicToJson(Clinic instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'phone': instance.phone,
      'email': instance.email,
      'description': instance.description,
      'days': instance.days,
      'startWork': instance.startWork,
      'endWork': instance.endWork,
      'doctorId': instance.doctorId,
      'doctorFullName': instance.doctorName,
      'doctorJobTitle': instance.doctorJobTitle,
      'doctorPhone': instance.doctorPhone,
      'doctorDescription': instance.doctorDescription,
    };
