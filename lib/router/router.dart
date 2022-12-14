import 'package:bimarestan/presentation/auth/signup/signup_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../locator/locator.dart';
import '../presentation/auth/login/login_view.dart';
import '../presentation/auth/login/login_view_model.dart';
import '../presentation/home/home_view.dart';
import '../presentation/home/home_view_model.dart';
import '../presentation/startup/startup_view.dart';
import 'routes.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.startup:
        return _getPageRoute(
          settings: settings,
          builder: (context) => const StartupView(),
        );

      case Routes.login:
        return _getPageRoute(
          settings: settings,
          builder: (context) => ChangeNotifierProvider<LoginViewModel>(
            create: (context) => locator(),
            child: const LoginView(),
          ),
        );
      case Routes.signup:
        return _getPageRoute(
          settings: settings,
          builder: (context) => ChangeNotifierProvider<LoginViewModel>(
            create: (context) => locator(),
            child: const SignupView(),
          ),
        );
      case Routes.home:
        return _getPageRoute(
          settings: settings,
          builder: (context) => ChangeNotifierProvider(
            create: (context) => locator<HomeViewModel>(),
            child: const HomeView(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(
              title: const Text('Route not found'),
            ),
          ),
        );
    }
  }
}

PageRoute _getPageRoute({
  required RouteSettings settings,
  required Widget Function(BuildContext context) builder,
  bool fullscreenDialog = false,
}) {
  return MaterialPageRoute(
    settings: settings,
    builder: builder,
    fullscreenDialog: fullscreenDialog,
  );
}
