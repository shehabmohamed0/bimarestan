// ignore_for_file: depend_on_referenced_packages, implementation_imports

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:intl_phone_number_input/src/utils/phone_number.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../core/apis/error_handler.dart';
import '../../../core/services/snack_bar_service.dart';
import '../../../core/utils/dialogs.dart';
import '../../../locator/locator.dart';
import '../../../logic/auth/auth_service.dart';
import '../../../models/auth/signup_request.dart';

@injectable
class SignupViewModel extends ChangeNotifier {
  final AuthService _authService = locator<AuthService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final SnackBarService _snackBarService = locator<SnackBarService>();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController age = TextEditingController();
  final TextEditingController description = TextEditingController();

  PhoneNumber? phoneNumber;
  bool validPhoneNumber = false;

  void phoneNumberChanged(PhoneNumber phoneNumber) {
    this.phoneNumber = phoneNumber;

    final validPhoneNumber = (phoneNumber.phoneNumber!.startsWith('+2015') ||
            phoneNumber.phoneNumber!.startsWith('+2010') ||
            phoneNumber.phoneNumber!.startsWith('+2011') ||
            phoneNumber.phoneNumber!.startsWith('+2012')) &&
        phoneNumber.phoneNumber!.length == 13;

    this.validPhoneNumber = validPhoneNumber;
    notifyListeners();
  }

  Future<void> submit() async {
    if (formKey.currentState!.validate()) {
      try {
        showLoadingDialog();
        await _authService.signup(
          SignupRequest(
            fullName: name.text.trim(),
            email: email.text.trim(),
            password: password.text,
            phone: phoneNumber!.phoneNumber!,
            age: int.parse(age.text),
            address: address.text,
            description: description.text,
          ),
        );
        dismissLoadingDialog();
        _navigationService.back();
        // _snackBarService.showSuccessSnackBar('Email created successfully');
      } on ErrorHandler catch (e) {
        dismissLoadingDialog();
        _snackBarService.showErrorSnackBar(e.failure.message);
      }
    }
  }

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    password.dispose();
    phone.dispose();
    address.dispose();
    age.dispose();
    description.dispose();
    super.dispose();
  }
}
