import 'package:bimarestan/core/state_management/view_state.dart';
import 'package:bimarestan/data/clinics/clinic_repository.dart';
import 'package:bimarestan/models/clinics/clinic.dart';
import 'package:bimarestan/models/clinics/get_clinics_request.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../locator/locator.dart';

@injectable
class ClinicsViewModel extends ChangeNotifier {
  final ClinicRepository _repository = locator<ClinicRepository>();

  List<Clinic> clinics = [];
  ViewState viewState = ViewState.loading;
  Future<void> init(int doctorId) async {
    try {
      if (!viewState.isLoading) {
        viewState = ViewState.loading;
        notifyListeners();
      }
      final clinics =
          await _repository.getClinics(GetClinicsRequest(doctorId: doctorId));
      this.clinics = clinics;
      viewState = ViewState.success;
      notifyListeners();
    } catch (e) {
      viewState = ViewState.error;
      notifyListeners();
      rethrow;
    }
  }
}
