// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:bimarestan/core/services/snack_bar_service.dart' as _i14;
import 'package:bimarestan/logic/auth/auth_api.dart' as _i3;
import 'package:bimarestan/logic/auth/auth_repository.dart' as _i4;
import 'package:bimarestan/logic/profiles/profiles_api.dart' as _i10;
import 'package:bimarestan/logic/profiles/profiles_repository.dart' as _i11;
import 'package:bimarestan/presentation/auth/login/login_view_model.dart'
    as _i9;
import 'package:bimarestan/presentation/auth/signup/sigup_view_model.dart'
    as _i13;
import 'package:bimarestan/presentation/home/home_landing_view_model.dart'
    as _i7;
import 'package:bimarestan/presentation/startup/startup_view_model.dart'
    as _i15;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i6;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i8;
import 'package:shared_preferences/shared_preferences.dart' as _i12;
import 'package:stacked_services/stacked_services.dart' as _i5;

import 'register_module.dart' as _i16;

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
  gh.factory<_i6.GoogleSignIn>(() => registerModule.googleSignIn);
  gh.factory<_i7.HomeViewModel>(() => _i7.HomeViewModel());
  gh.lazySingleton<_i8.InternetConnectionChecker>(
      () => registerModule.internetConnectionChecker);
  gh.factory<_i9.LoginViewModel>(() => _i9.LoginViewModel());
  gh.singleton<_i5.NavigationService>(registerModule.navigationService);
  gh.lazySingleton<_i10.ProfilesAPI>(() => _i10.ProfilesAPI());
  gh.lazySingleton<_i11.ProfilesRepository>(() => _i11.ProfilesRepository());
  await gh.factoryAsync<_i12.SharedPreferences>(
    () => registerModule.prefs,
    preResolve: true,
  );
  gh.factory<_i13.SignupViewModel>(() => _i13.SignupViewModel());
  gh.lazySingleton<_i14.SnackBarService>(() => _i14.SnackBarService());
  gh.factory<_i15.StartupViewModel>(() => _i15.StartupViewModel());
  return getIt;
}

class _$RegisterModule extends _i16.RegisterModule {}
