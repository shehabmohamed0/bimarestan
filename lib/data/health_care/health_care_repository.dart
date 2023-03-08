import '../../locator/locator.dart';

import '../../core/apis/error_handler.dart';
import '../../models/appointments/appointment.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'health_care_api.dart';

@lazySingleton
class HealthcareRepository {
  final HealthCareAPI _api = locator<HealthCareAPI>();

  Future<List<Appointment>> getAllAppointmentsByPatientId(int patientId) async {
    try {
      final response = await _api.fetchAllAppointmentsByPatientId(patientId);
      return response;
    } catch (e) {
      rethrow;
      throw ErrorHandler.handle(e);
    }
  }
}
