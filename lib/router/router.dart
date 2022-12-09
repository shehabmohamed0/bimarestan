import '../locator/locator.dart';
import 'package:bimarestan/presentation/home/home_view.dart';
import 'package:bimarestan/presentation/home/home_view_model.dart';
import 'package:bimarestan/presentation/home/home_view_model2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../presentation/home/home_view2.dart';
import '../presentation/startup/startup_view.dart';
import 'routes.dart';

class AppRouter {
  final homeVM = locator<HomeViewModel>();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.startup:
        return _getPageRoute(
          settings: settings,
          builder: (context) => const StartupView(),
        );
      case '${Routes.home}2':
        return _getPageRoute(
          settings: settings,
          builder: (context) => const HomeView2(),
        );
      case Routes.home:
        final model = settings.arguments as HomeViewModel2;

        return _getPageRoute(
          settings: settings,
          builder: (context) => ChangeNotifierProvider.value(
            value: model,
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
