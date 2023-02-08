import 'dart:async';

import 'package:flutter/cupertino.dart';

import '../../core/services/notification_service.dart';
import '../../locator/locator.dart';

class NotificationModel extends ChangeNotifier {
  final _service = locator<NotificationService>();
  bool enable = true;

  Future<void> checkGranted() async {
    final isGranted = await _service.isGranted();
    if (isGranted != enable) {
      if (isGranted) {
        await enableNotification();
      } else {
        disableNotification();
      }
    }
  }

  Future<void> enableNotification() async {
    if (!(await _service.isGranted())) {
      final granted = await _service.requestPermission();
      if (!granted) {
        return;
      }
    }
    enable = true;
    // _fStoreNotification = _fStoreNotification.copyWith(enable: true);
    _service.enableNotification();
    notifyListeners();
    // unawaited(_saveDataToLocal());
  }

  void disableNotification() {
    enable = false;
    // _fStoreNotification = _fStoreNotification.copyWith(enable: false);
    _service.disableNotification();
    // _saveDataToLocal();
    notifyListeners();
  }
}
