import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../core/resources/constants_manager.dart';
import '../../core/services/snack_bar_service.dart';
import '../../core/state_management/view_state.dart';
import '../../core/utils/dialogs.dart';
import '../../locator/locator.dart';
import '../../logic/profiles/profiles_repository.dart';
import '../../models/profile.dart';

@injectable
class HomeViewModel extends ChangeNotifier {
  final ProfilesRepository _repository = locator<ProfilesRepository>();
  final SnackBarService _snackBarService = locator<SnackBarService>();

  ViewState viewState1 = ViewState.initial;
  ViewState viewState2 = ViewState.initial;

  List<Profile> profiles = [];
  List<Profile> profiles2 = [];

  Future<void> init1() async {
    viewState1 = ViewState.loading;
    notifyListeners();
    final profiles2OrFailure = await _repository.getProfiles();
    profiles2OrFailure.fold(
      (failure) {
        viewState1 = ViewState.error;
        notifyListeners();
      },
      (profiles) {
        this.profiles = profiles;
        viewState1 = ViewState.success;
        notifyListeners();
      },
    );
  }

  Future<void> init2() async {
    viewState2 = ViewState.loading;
    notifyListeners();

    final profilesOrFailure = await _repository.getProfiles();

    profilesOrFailure.fold(
      (failure) {
        viewState2 = ViewState.error;
        notifyListeners();
      },
      (profiles2) {
        this.profiles2 = profiles2;
        viewState2 = ViewState.success;
        notifyListeners();
      },
    );
  }

  void copyWithAtIndex(int index, Profile Function(Profile) changeProfile) {
    final newProfile = changeProfile(profiles[index]);
    profiles[index] = newProfile;
  }

  Future<void> toggle() async {
    showLoadingDialog();
    await Future.delayed(AppConstants.duration1s);
    profiles = profiles.take(5).toList();
    notifyListeners();
    dismissLoadingDialog();
    _snackBarService.showSuccessSnackBar('Toggle succeffully');
  }
}
