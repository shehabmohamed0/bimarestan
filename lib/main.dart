import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'app.dart';
import 'locator/locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(
    // DevicePreview(
    //   enabled: false,
    //   // !kReleaseMode,
    //   builder: (context) =>
    const MyApp(),
    // ),
  );
}
