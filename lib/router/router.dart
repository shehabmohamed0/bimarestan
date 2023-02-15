import 'package:bimarestan/presentation/appointment/appointment_view.dart';
import 'package:bimarestan/presentation/clinics/clinics_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../locator/locator.dart';
import '../presentation/auth/app/landing_view.dart';
import '../presentation/auth/login/login_view_model.dart';
import '../presentation/auth/signup/signup_view.dart';
import '../presentation/doctors/radiological_analyzes_view.dart';
import '../presentation/doctors/visit_doctors_view.dart';
import '../presentation/doctors/surgery_booking_view.dart';
import '../presentation/profile/profile_view.dart';
import '../presentation/specialities/search_speciality_view.dart';
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
      case Routes.specialities:
        return _getPageRoute(
          settings: settings,
          builder: (context) => const SearchSpecialtyView(),
        );
      case Routes.specialitiesDoctors:
        return _getPageRoute(
          settings: settings,
          builder: (context) => const VisitDoctorsView(),
        );
      case Routes.specialitiesSurgery:
        return _getPageRoute(
          settings: settings,
          builder: (context) => const SurgeryBookingView(),
        );
      case Routes.specialitiesRadiology:
        return _getPageRoute(
          settings: settings,
          builder: (context) => const RadiologicalAnalyzesView(),
        );
      case Routes.clinics:
        return _getPageRoute(
          settings: settings,
          builder: (context) => const ClinicsView(),
        );
      case Routes.appointment:
        return _getPageRoute(
          settings: settings,
          builder: (context) => const AppointmentView(),
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
