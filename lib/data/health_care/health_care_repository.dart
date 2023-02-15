import 'package:bimarestan/core/apis/error_handler.dart';
import 'package:bimarestan/models/health_care/appointment.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'health_care_api.dart';

@lazySingleton
class HealthcareRepository {
  final HealthCareApi healthcareApi;

  HealthcareRepository({required this.healthcareApi});

  Future<List<Appointment>> getAllAppointmentsByPatientId(int patientId) async {
    try {
      final response =
          await healthcareApi.fetchAllAppointmentsByPatientId(patientId);
      return response;
    } catch (e) {
     
      throw ErrorHandler.handle(e);
    }
  }
}
