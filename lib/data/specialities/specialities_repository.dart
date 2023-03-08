import 'package:injectable/injectable.dart';

import '../../core/apis/error_handler.dart';
import '../../locator/locator.dart';
import '../../models/specialities/speciality.dart';
import 'specialities_api.dart';

@lazySingleton
class SpecialitiesRepository {
  final SpecialitiesApi _api = locator<SpecialitiesApi>();

  Future<List<Speciality>> getSpecialities() async {
    try {
      final specialities = await _api.getSpecialities();
      return specialities;
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }
}
