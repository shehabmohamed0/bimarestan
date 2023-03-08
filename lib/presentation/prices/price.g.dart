// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Price _$PriceFromJson(Map<String, dynamic> json) => Price(
      id: json['id'] as int,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      description: json['description'] as String,
      clinicId: json['clinicId'] as int,
      clinicName: json['clinicName'] as String?,
      clinicAddress: json['clinicAddress'] as String?,
      clinicPhone: json['clinicPhone'] as String?,
    );

Map<String, dynamic> _$PriceToJson(Price instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'description': instance.description,
      'clinicId': instance.clinicId,
      'clinicName': instance.clinicName,
      'clinicAddress': instance.clinicAddress,
      'clinicPhone': instance.clinicPhone,
    };
