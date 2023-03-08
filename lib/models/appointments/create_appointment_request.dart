import 'package:json_annotation/json_annotation.dart';

part 'create_appointment_request.g.dart';

@JsonSerializable()
class CreateAppointmentRequest {
  final int clinicId;
  final int patientId;
  final int doctorId;
  final DateTime appointmentDate;
  final double time;
  final int paymentId;
  final int priceId;
  final int numPatient;
  final String clinicAddress;
  final String clinicName;
  final String doctorName;
  final String patientFullName;
  const CreateAppointmentRequest({
    required this.clinicId,
    required this.patientId,
    required this.doctorId,
    required this.appointmentDate,
    required this.time,
    required this.paymentId,
    required this.priceId,
    required this.numPatient,
    required this.clinicAddress,
    required this.clinicName,
    required this.doctorName,
    required this.patientFullName,
  });
  final bool pay = false;
  final bool cancelled = false;
  final bool finish = false;

  factory CreateAppointmentRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateAppointmentRequestFromJson(json);
  Map<String, dynamic> toJson() => _$CreateAppointmentRequestToJson(this);
}
