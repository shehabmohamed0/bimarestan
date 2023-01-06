import 'package:bimarestan/presentation/auth/app/app_view_model.dart';
import 'package:bimarestan/presentation/auth/login/login_view.dart';
import 'package:bimarestan/presentation/home/home_landing_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../../../core/resources/color_manager.dart';
import '../../../locator/locator.dart';
import '../../home/home_landing_view_model.dart';

class LandingView extends StatelessWidget {
  const LandingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AppViewModel>(
        builder: (context, model, _) {
          switch (model.status) {
            case AppStatus.authenticated:
              return ChangeNotifierProvider(
                create: (context) => locator<HomeViewModel>(),
                child: const HomeView(),
              );
            case AppStatus.unauthenticated:
              return const LoginView();
            case AppStatus.loading:
              return const Scaffold(
                body: Center(
                  child: SpinKitCubeGrid(
                    duration: Duration(milliseconds: 1200),
                    color: ColorManager.primary,
                  ),
                ),
              );
          }
        },
      ),
    );
  }
}
