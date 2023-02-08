import 'package:injectable/injectable.dart';

import '../../core/apis/api_utils.dart';
import '../../models/doctors/get_doctors_request.dart';
import '../../models/profiles/profile.dart';

@lazySingleton
class DoctorsAPI {
  final String featurePath = '/bimarestan/user/getAllUserByCategory';

  Future<List<Profile>> getDoctors(GetDoctorsRequest request) async {
    final response = await DioFactory.dio.get<List<dynamic>>(
      '$featurePath${request.specialityId}',
      queryParameters: request.toJson(),
    );

    final doctors = response.data!
        .map((e) => Profile.fromJson(e as Map<String, dynamic>))
        .toList();
    return doctors;
  }
}
