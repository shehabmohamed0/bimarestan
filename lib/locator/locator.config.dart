// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:bimarestan/core/services/firebase_notification_service.dart'
    as _i13;
import 'package:bimarestan/core/services/notification_service.dart' as _i12;
import 'package:bimarestan/core/services/snack_bar_service.dart' as _i22;
import 'package:bimarestan/data/auth/auth_api.dart' as _i3;
import 'package:bimarestan/data/auth/auth_repository.dart' as _i4;
import 'package:bimarestan/data/auth/auth_service.dart' as _i28;
import 'package:bimarestan/data/doctors/doctors_api.dart' as _i6;
import 'package:bimarestan/data/doctors/doctors_repository.dart' as _i7;
import 'package:bimarestan/data/profiles/profiles_api.dart' as _i15;
import 'package:bimarestan/data/profiles/profiles_repository.dart' as _i16;
import 'package:bimarestan/data/specialities/specialities_api.dart' as _i23;
import 'package:bimarestan/data/specialities/specialities_repository.dart'
    as _i24;
import 'package:bimarestan/presentation/auth/app/app_view_model.dart' as _i29;
import 'package:bimarestan/presentation/auth/login/login_view_model.dart'
    as _i11;
import 'package:bimarestan/presentation/auth/signup/signup_view_model.dart'
    as _i21;
import 'package:bimarestan/presentation/doctors/radiological_analyzes_view_model.dart'
    as _i17;
import 'package:bimarestan/presentation/doctors/surgery_booking_view_model.dart'
    as _i26;
import 'package:bimarestan/presentation/doctors/visit_doctors_view_model.dart'
    as _i27;
import 'package:bimarestan/presentation/home/home_landing_view_model.dart'
    as _i9;
import 'package:bimarestan/presentation/home/settings_page/settings_page_view_model.dart'
    as _i19;
import 'package:bimarestan/presentation/profile/profile_view_model.dart'
    as _i14;
import 'package:bimarestan/presentation/specialities/search_speciality_view_model.dart'
    as _i18;
import 'package:bimarestan/presentation/specialities/specialities_view_model.dart'
    as _i25;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i8;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i10;
import 'package:shared_preferences/shared_preferences.dart' as _i20;
import 'package:stacked_services/stacked_services.dart' as _i5;

import 'register_module.dart' as _i30;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of main-scope dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.AuthAPI>(() => _i3.AuthAPI());
  gh.lazySingleton<_i4.AuthRepository>(() => _i4.AuthRepository());
  gh.singleton<_i5.BottomSheetService>(registerModule.bottomSheetService);
  gh.singleton<_i5.DialogService>(registerModule.dialogService);
  gh.lazySingleton<_i6.DoctorsAPI>(() => _i6.DoctorsAPI());
  gh.lazySingleton<_i7.DoctorsRepository>(() => _i7.DoctorsRepository());
  gh.factory<_i8.GoogleSignIn>(() => registerModule.googleSignIn);
  gh.factory<_i9.HomeViewModel>(() => _i9.HomeViewModel());
  gh.lazySingleton<_i10.InternetConnectionChecker>(
      () => registerModule.internetConnectionChecker);
  gh.factory<_i11.LoginViewModel>(() => _i11.LoginViewModel());
  gh.singleton<_i5.NavigationService>(registerModule.navigationService);
  gh.lazySingleton<_i12.NotificationService>(
      () => _i13.FirebaseNotificationService());
  gh.factory<_i14.ProfileViewModel>(() => _i14.ProfileViewModel());
  gh.lazySingleton<_i15.ProfilesAPI>(() => _i15.ProfilesAPI());
  gh.lazySingleton<_i16.ProfilesRepository>(() => _i16.ProfilesRepository());
  gh.factory<_i17.RadiologicalAnalyzesViewModel>(
      () => _i17.RadiologicalAnalyzesViewModel());
  gh.factory<_i18.SearchSpecialityViewModel>(
      () => _i18.SearchSpecialityViewModel());
  gh.factory<_i19.SettingsPageViewModel>(() => _i19.SettingsPageViewModel());
  await gh.factoryAsync<_i20.SharedPreferences>(
    () => registerModule.prefs,
    preResolve: true,
  );
  gh.factory<_i21.SignupViewModel>(() => _i21.SignupViewModel());
  gh.lazySingleton<_i22.SnackBarService>(() => _i22.SnackBarService());
  gh.lazySingleton<_i23.SpecialitiesApi>(() => _i23.SpecialitiesApi());
  gh.lazySingleton<_i24.SpecialitiesRepository>(
      () => _i24.SpecialitiesRepository());
  gh.factory<_i25.SpecialitiesViewModel>(() => _i25.SpecialitiesViewModel());
  gh.factory<_i26.SurgeryBookingViewModel>(
      () => _i26.SurgeryBookingViewModel());
  gh.factory<_i27.VisitDoctorsViewModel>(() => _i27.VisitDoctorsViewModel());
  gh.lazySingleton<_i28.AuthService>(() => _i28.AuthService(
        gh<_i4.AuthRepository>(),
        gh<_i20.SharedPreferences>(),
      ));
  gh.factory<_i29.AppViewModel>(
      () => _i29.AppViewModel(gh<_i28.AuthService>()));
  return getIt;
}

class _$RegisterModule extends _i30.RegisterModule {}
