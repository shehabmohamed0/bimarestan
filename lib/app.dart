import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';
import 'package:stacked_services/stacked_services.dart' hide SnackbarService;

import 'core/resources/theme_manager.dart';
import 'core/services/notification_service.dart';
import 'core/services/snack_bar_service.dart';
import 'localizations/l10n.dart';
import 'locator/locator.dart';
import 'presentation/auth/app/app_view_model.dart';
import 'presentation/notifications/notifications_model.dart';
import 'presentation/specialities/specialities_view_model.dart';
import 'router/router.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App>
    with WidgetsBindingObserver
    implements NotificationDelegate {
  final _notificationModel = NotificationModel();

  @override
  void initState() {
    _appInitialModules();
    super.initState();
  }

  void _appInitialModules() {
    final notificationService = locator<NotificationService>();
    notificationService.init(notificationDelegate: this);
    notificationService.requestPermission();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      _notificationModel.checkGranted();
    }
  }

  @override
  void onMessage(Object notification) {
    // _notificationCubit.add(NotificationReceived(notification));
  }

  @override
  void onMessageOpenedApp(Object notification) {
    // _notificationCubit.add(NotificationReceived(notification));
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(
              lazy: false,
              create: (context) => locator<AppViewModel>()..init(),
            ),
            ChangeNotifierProvider(
              create: (context) => locator<SpecialitiesViewModel>()..init(),
            ),
          ],
          child: MaterialApp(
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
              FormBuilderLocalizations.delegate,
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
          ),
        );
      },
    );
  }
}
