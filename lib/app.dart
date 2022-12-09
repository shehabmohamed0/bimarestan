import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:stacked_services/stacked_services.dart' hide SnackbarService;

import 'core/resources/theme_manager.dart';
import 'core/services/snack_bar_service.dart';
import 'localizations/l10n.dart';
import 'locator/locator.dart';
import 'router/router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: StackedService.navigatorKey,
      scaffoldMessengerKey: locator<SnackBarService>().key,
      onGenerateRoute: AppRouter.generateRoute,
      builder: EasyLoading.init(),
      theme: getApplicationTheme(),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback: (deviceLocale, supportedLocales) {
        if (supportedLocales
            .map((e) => e.languageCode)
            .contains(deviceLocale?.languageCode)) {
          return deviceLocale;
        } else {
          return const Locale('en', '');
        }
      },
      supportedLocales: AppLocalizations.delegate.supportedLocales,
    );
  }
}
