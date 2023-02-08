import 'package:bimarestan/data/specialities/specialities_repository.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../core/state_management/view_state.dart';
import '../../locator/locator.dart';
import '../../models/specialities/speciality.dart';

@injectable
class SpecialitiesViewModel extends ChangeNotifier {
  final SpecialitiesRepository _repository = locator<SpecialitiesRepository>();

  ViewState viewState = ViewState.loading;
  List<Speciality> specialities = [];

  Future<void> init() async {
    try {
      if (!viewState.isLoading) {
        viewState = ViewState.loading;
        notifyListeners();
      }
      specialities = await _repository.getSpecialities();
      viewState = ViewState.success;
      notifyListeners();
    } catch (e) {
      viewState = ViewState.error;
      notifyListeners();
    }
  }
}
