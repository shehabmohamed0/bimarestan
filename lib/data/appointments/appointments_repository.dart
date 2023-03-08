import 'package:injectable/injectable.dart';

import '../../core/apis/error_handler.dart';
import '../../locator/locator.dart';
import '../../models/appointments/appointment.dart';
import '../../models/appointments/create_appointment_request.dart';
import 'appointments_api.dart';

@lazySingleton
class AppointmentsRepository {
  final AppointmentsAPI _api = locator<AppointmentsAPI>();

  Future<List<double>> getClinicReservedDayTimes({
    required int clinicId,
    required DateTime date,
  }) async {
    try {
      final appointments =
          await _api.getClinicReservedDayTimes(clinicId: clinicId, date: date);
      return appointments;
    } catch (e) {
      rethrow;
      // throw ErrorHandler.handle(e);
    }
  }

  Future<Appointment> createAppointment(
    CreateAppointmentRequest request,
  ) async {
    try {
      final appointment = await _api.createAppointment(request);
      return appointment;
    } on AppointmentReservedException {
      rethrow;
    } catch (e) {

      throw ErrorHandler.handle(e);
    }
  }

  Future<List<Appointment>> getAppointments() async {
    try {
      final appointments = await _api.getAppointments();
      return appointments;
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }
}
