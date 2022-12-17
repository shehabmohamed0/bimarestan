import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../core/apis/error_handler.dart';
import '../../../core/services/snack_bar_service.dart';
import '../../../core/utils/dialogs.dart';
import '../../../locator/locator.dart';
import '../../../logic/auth/auth_repository.dart';
import '../../../models/auth/login_request.dart';
import '../../../router/routes.dart';

@injectable
class LoginViewModel extends ChangeNotifier {
  final AuthRepository _authRepository = locator<AuthRepository>();

  final NavigationService _navigationService = locator<NavigationService>();
  final SnackBarService _snackBarService = locator<SnackBarService>();

  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  Future<void> submit() async {
    if (formKey.currentState!.validate()) {
      try {
        showLoadingDialog();
        final response = await _authRepository.login(LoginRequest(
          email: email.text,
          password: password.text,
        ));
        dismissLoadingDialog();
        _navigationService.navigateTo(Routes.home);
      } on ErrorHandler catch (e) {
        dismissLoadingDialog();
        _snackBarService.showErrorSnackBar(e.failure.message);
      }
    }
  }
}
