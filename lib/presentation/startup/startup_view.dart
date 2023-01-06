import 'package:flutter/material.dart';

import '../../core/resources/assets_manager.dart';
import '../../core/resources/constants_manager.dart';
import '../../router/routes.dart';

class StartupView extends StatefulWidget {
  const StartupView({super.key});

  @override
  State<StartupView> createState() => _StartupViewState();
}

class _StartupViewState extends State<StartupView> {
  @override
  void initState() {
    Future.delayed(AppConstants.duration3s).then((value) {
      Navigator.of(context).pushReplacementNamed(Routes.landing);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(ImageAssets.logo),
      ),
    );
  }
}
