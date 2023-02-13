import 'package:injectable/injectable.dart';

import '../../core/apis/api_utils.dart';
import '../../models/specialities/speciality.dart';

@lazySingleton
class SpecialitiesApi {
  final featurePath = '/category/getAllCategories';

  Future<List<Speciality>> getSpecialities() async {
    final response = await DioFactory.dio.get<List<dynamic>>(featurePath);
    final specialities = response.data!
        .map((e) => Speciality.fromJson(e as Map<String, dynamic>))
        .toList();

    return specialities;
  }
}
