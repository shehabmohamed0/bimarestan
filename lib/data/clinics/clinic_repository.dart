import '../../presentation/prices/price.dart';
import 'package:injectable/injectable.dart';

import '../../core/apis/error_handler.dart';
import '../../models/clinics/clinic.dart';
import '../../models/clinics/get_clinics_request.dart';
import 'clinics_api.dart';

@lazySingleton
class ClinicRepository {
  final ClinicsAPI _api;

  ClinicRepository(this._api);

  Future<List<Clinic>> getClinics(GetClinicsRequest request) async {
    try {
      final clinics = await _api.getClinics(request);
      return clinics;
    } catch (e, s) {
      print(e.toString());
      print(s.toString());
      throw ErrorHandler.handle(e);
    }
  }

  Future<Clinic> getClinic(int clinicId) async {
    try {
      final clinic = await _api.getClinic(clinicId);
      return clinic;
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }

  Future<List<Price>> getPrices(int clinicId) async {
    try {
      final prices = await _api.getClinicPrices(clinicId);
      return prices;
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }
}
