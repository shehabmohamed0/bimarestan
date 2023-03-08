import '../../models/appointments/appointment.dart';
import 'package:injectable/injectable.dart';

import '../../core/apis/api_utils.dart';

@lazySingleton
class HealthCareAPI {
  Future<List<Appointment>> fetchAllAppointmentsByPatientId(
    int patientId,
  ) async {
    final response = await DioFactory.dio.get<List>(
      '/appointment/getAllAppointmentsByPatientId$patientId',
    );

    return (response.data as List<dynamic>)
        .map((e) => Appointment.fromJson(e))
        .toList();
  }
}
