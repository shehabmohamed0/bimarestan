import 'package:injectable/injectable.dart';

import '../../core/apis/api_utils.dart';
import '../../models/appointments/appointment.dart';
import '../../models/appointments/create_appointment_request.dart';

@lazySingleton
class AppointmentsAPI {
  final featurePath = '/appointment';
  Future<List<double>> getClinicReservedDayTimes({
    required int clinicId,
    required DateTime date,
  }) async {
    final response = await DioFactory.dio.get<List>(
      '$featurePath/getClinicTimesDay/$clinicId/${date.millisecondsSinceEpoch}',
    );
    return response.data!.cast<double>();
  }

  Future<Appointment> createAppointment(
      CreateAppointmentRequest request) async {
    final response = await DioFactory.dio.post(
      '$featurePath/addAppointment',
      data: request.toJson(),
    );
    if (response.data is List) {
      throw AppointmentReservedException(
        (response.data as List).cast<double>(),
      );
    }

    return Appointment.fromJson(response.data! as Map<String, dynamic>);
  }

  Future<void> cancelAppointment(Appointment appointment, int userId) async {
    await DioFactory.dio.get(
      '$featurePath/cancelAppointment${appointment.id}/$userId',
    );
  }
}

class AppointmentReservedException implements Exception {
  final List<double> reservedTimes;

  AppointmentReservedException(this.reservedTimes);
}
