// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_appointment_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateAppointmentRequest _$CreateAppointmentRequestFromJson(
        Map<String, dynamic> json) =>
    CreateAppointmentRequest(
      clinicId: json['clinicId'] as int,
      patientId: json['patientId'] as int,
      doctorId: json['doctorId'] as int,
      appointmentDate: DateTime.parse(json['appointmentDate'] as String),
      time: (json['time'] as num).toDouble(),
      paymentId: json['paymentId'] as int,
      priceId: json['priceId'] as int,
      numPatient: json['numPatient'] as int,
      clinicAddress: json['clinicAddress'] as String,
      clinicName: json['clinicName'] as String,
      doctorName: json['doctorName'] as String,
      patientFullName: json['patientFullName'] as String,
    );

Map<String, dynamic> _$CreateAppointmentRequestToJson(
        CreateAppointmentRequest instance) =>
    <String, dynamic>{
      'clinicId': instance.clinicId,
      'patientId': instance.patientId,
      'doctorId': instance.doctorId,
      'appointmentDate': instance.appointmentDate.toIso8601String(),
      'time': instance.time,
      'paymentId': instance.paymentId,
      'priceId': instance.priceId,
      'numPatient': instance.numPatient,
      'clinicAddress': instance.clinicAddress,
      'clinicName': instance.clinicName,
      'doctorName': instance.doctorName,
      'patientFullName': instance.patientFullName,
    };
