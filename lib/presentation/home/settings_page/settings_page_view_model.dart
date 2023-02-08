import 'package:bimarestan/data/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../locator/locator.dart';
@injectable
class SettingsPageViewModel extends ChangeNotifier {
  final AuthService _authService = locator<AuthService>();
  // togglle switch
  bool _isSwitched = false;
  bool get isSwitched => _isSwitched;
  void toggleSwitch(bool value) {
    _isSwitched = value;
    notifyListeners();
  }

  // logout
  Future<void> logout() async{
   await _authService.logout();
  }
}
