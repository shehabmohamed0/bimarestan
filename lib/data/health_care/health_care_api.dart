import 'package:bimarestan/models/clinics/clinic.dart';
import 'package:bimarestan/models/health_care/appointment.dart';
import 'package:injectable/injectable.dart';

import '../../core/apis/api_utils.dart';

@lazySingleton
class HealthCareApi {
  Future<List<Appointment>> fetchAllAppointmentsByPatientId(
      int patientId) async {
    final response = await DioFactory.dio.get<Map<String, dynamic>>(
      '/appointment/getAllAppointmentsByPatientId$patientId',
    );

    return (response.data as List<dynamic>)
        .map((e) => Appointment.fromJson(e))
        .toList();
  }
}
