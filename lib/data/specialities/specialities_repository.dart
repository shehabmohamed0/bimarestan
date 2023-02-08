import 'package:bimarestan/core/apis/error_handler.dart';
import 'package:bimarestan/data/specialities/specialities_api.dart';
import 'package:bimarestan/locator/locator.dart';
import 'package:injectable/injectable.dart';

import '../../models/specialities/speciality.dart';
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
