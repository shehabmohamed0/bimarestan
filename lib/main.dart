import 'package:flutter/material.dart';

import 'app.dart';
import 'locator/locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MyApp());
}
