import 'package:bimarestan/presentation/profile/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../locator/locator.dart';
import '../presentation/auth/app/landing_view.dart';
import '../presentation/auth/login/login_view_model.dart';
import '../presentation/auth/signup/signup_view.dart';
import '../presentation/home/home_landing_view.dart';
import '../presentation/home/home_landing_view_model.dart';
import '../presentation/home/home_page/department_doctors_view.dart';
import '../presentation/reservation/search_speciality_view.dart';
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

      case Routes.signup:
        return _getPageRoute(
          settings: settings,
          builder: (context) => ChangeNotifierProvider<LoginViewModel>(
            create: (context) => locator(),
            child: const SignupView(),
          ),
        );

      case Routes.landing:
        return _getPageRoute(
          settings: settings,
          builder: (context) => const LandingView(),
        );
      case Routes.profile:
        return _getPageRoute(
          settings: settings,
          builder: (context) => const ProfileView(),
        );
      case Routes.departments:
        return _getPageRoute(
          settings: settings,
          builder: (context) => const SearchSpecialtyView(),
        );
      case Routes.departmentDoctors:
        return _getPageRoute(
          settings: settings,
          builder: (context) => const DepartmentDoctorsView(),
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
