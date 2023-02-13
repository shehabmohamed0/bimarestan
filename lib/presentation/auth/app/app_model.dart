import 'dart:async';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../data/auth/auth_service.dart';
import '../../../models/profiles/profile.dart';

@injectable
class AppModel extends ChangeNotifier {
  final AuthService _authService;

  late final StreamSubscription<Profile?> _subscription;
  AppStatus status = AppStatus.loading;

  Profile? _profile;

  AppModel(this._authService);
  Profile? get profile => _profile;

  void init() {
    _subscription = _authService.userStateChanges.listen((profile) {
      if (profile != null) {
        _profile = profile;
      }
      profile != null
          ? status = AppStatus.authenticated
          : status = AppStatus.unauthenticated;
      notifyListeners();

      if (profile == null) {
        WidgetsBinding.instance.addPostFrameCallback((_) => _profile = profile);
      } else {}
    });
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

enum AppStatus {
  authenticated,
  unauthenticated,
  loading;
}
