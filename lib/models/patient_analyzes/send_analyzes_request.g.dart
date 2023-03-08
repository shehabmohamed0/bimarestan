// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_analyzes_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendAnalyzesRequest _$SendAnalyzesRequestFromJson(Map<String, dynamic> json) =>
    SendAnalyzesRequest(
      userId: json['userId'] as int,
      images: (json['data'] as List<dynamic>).map((e) => e as String).toList(),
      description: json['description'] as String,
    );

Map<String, dynamic> _$SendAnalyzesRequestToJson(
        SendAnalyzesRequest instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'data': instance.images,
      'description': instance.description,
    };
