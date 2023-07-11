import 'package:injectable/injectable.dart';

import '../../core/apis/error_handler.dart';
import '../../locator/locator.dart';
import '../../models/doctors/get_doctors_request.dart';
import '../../models/profiles/profile.dart';
import 'doctors_api.dart';

@lazySingleton
class DoctorsRepository {
  final DoctorsAPI _api = locator<DoctorsAPI>();

  Future<List<Profile>> getDoctors(GetDoctorsRequest request) async {
    try {
      final doctors = await _api.getDoctors(request);
      return doctors;
    } catch (e, s) {
      print(e.toString());
      print(s.toString());
      throw ErrorHandler.handle(e);
    }
  }
}
