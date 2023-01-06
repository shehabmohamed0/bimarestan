import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'app.dart';
import 'locator/locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  _initEasyLoading();
  runApp(const MyApp());
}

void _initEasyLoading() {
  EasyLoading.instance
    ..loadingStyle = EasyLoadingStyle.light
    ..radius = 14;
}
