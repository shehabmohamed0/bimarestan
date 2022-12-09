import 'package:bimarestan/core/resources/assets_manager.dart';
import 'package:bimarestan/locator/locator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'startup_view_model.dart';

class StartupView extends StatelessWidget {
  const StartupView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<StartupViewModel>(
      create: (context) => locator<StartupViewModel>()..handleStartupLogic(),
      child: Scaffold(
        body: Consumer<StartupViewModel>(
          builder: (context, model, child) => Scaffold(
            body: Center(
              child: Image.asset(ImageAssets.logo),
            ),
          ),
        ),
      ),
    );
  }
}
