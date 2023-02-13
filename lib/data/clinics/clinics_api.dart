import 'package:injectable/injectable.dart';

import '../../core/apis/api_utils.dart';
import '../../models/clinics/clinic.dart';
import '../../models/clinics/get_clinics_request.dart';

@lazySingleton
class ClinicsAPI {
  final featurePath = '/clinic';

  Future<List<Clinic>> getClinics(GetClinicsRequest request) async {
    final response = await DioFactory.dio.get<List<dynamic>>(
      '$featurePath/getAllClinicsByDoctor${request.doctorId}',
      queryParameters: request.toJson(),
    );

    final clinics = response.data!
        .map((e) => Clinic.fromJson(e as Map<String, dynamic>))
        .toList();
    return clinics;
  }
}
