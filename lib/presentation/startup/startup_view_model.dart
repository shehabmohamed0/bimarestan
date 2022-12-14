import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart' hide SnackbarService;

import '../../core/resources/constants_manager.dart';
import '../../core/services/snack_bar_service.dart';
import '../../locator/locator.dart';
import '../../router/routes.dart';

@injectable
class StartupViewModel extends ChangeNotifier {
  final NavigationService _navigationService = locator<NavigationService>();
  final SnackBarService _snackBar = locator<SnackBarService>();

  Future<void> handleStartupLogic() async {
    await Future.delayed(AppConstants.duration3s);
    _navigationService.navigateTo(Routes.login);
  }
}
