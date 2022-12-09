import 'package:flutter/material.dart' show FittedBox, Colors;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Future<void> showLoadingDialog([String? message]) {
  return EasyLoading.show(
    status: message,
    indicator: const FittedBox(
      child: SpinKitRipple(
        duration: Duration(milliseconds: 1200),
        color: Colors.white,
      ),
    ),
  );
}

Future<void> dismissLoadingDialog() {
  return EasyLoading.dismiss();
}
