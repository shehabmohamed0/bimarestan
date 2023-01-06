import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../core/apis/error_handler.dart';
import '../../../core/services/snack_bar_service.dart';
import '../../../core/utils/dialogs.dart';
import '../../../logic/auth/auth_service.dart';
import '../../../locator/locator.dart';
import '../../../models/auth/login_request.dart';
import '../../../router/routes.dart';

@injectable
class LoginViewModel extends ChangeNotifier {
  final AuthService _authService = locator<AuthService>();

  final NavigationService _navigationService = locator<NavigationService>();
  final SnackBarService _snackBarService = locator<SnackBarService>();

  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  Future<void> submit() async {
    if (formKey.currentState!.validate()) {
      try {
        showLoadingDialog();
        await _authService.login(LoginRequest(
          email: email.text,
          password: password.text,
        ));

        dismissLoadingDialog();
      } on ErrorHandler {
        dismissLoadingDialog();
        _snackBarService.showErrorSnackBar(
          'Invalid email or password',
        );
        // rethrow;
      }
    }
  }
}
