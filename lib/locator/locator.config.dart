// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:bimarestan/core/services/snack_bar_service.dart' as _i11;
import 'package:bimarestan/logic/profiles/profiles_api.dart' as _i8;
import 'package:bimarestan/logic/profiles/profiles_repository.dart' as _i9;
import 'package:bimarestan/presentation/home/home_view_model2.dart' as _i5;
import 'package:bimarestan/presentation/home/home_view_model.dart' as _i6;
import 'package:bimarestan/presentation/startup/startup_view_model.dart'
    as _i12;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i4;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i7;
import 'package:shared_preferences/shared_preferences.dart' as _i10;
import 'package:stacked_services/stacked_services.dart' as _i3;

import 'register_module.dart' as _i13;

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
  gh.singleton<_i3.BottomSheetService>(registerModule.bottomSheetService);
  gh.singleton<_i3.DialogService>(registerModule.dialogService);
  gh.factory<_i4.GoogleSignIn>(() => registerModule.googleSignIn);
  gh.factory<_i5.HomeViewModel2>(() => _i5.HomeViewModel2());
  gh.factory<_i6.HomeViewModel>(() => _i6.HomeViewModel());
  gh.lazySingleton<_i7.InternetConnectionChecker>(
      () => registerModule.internetConnectionChecker);
  gh.singleton<_i3.NavigationService>(registerModule.navigationService);
  gh.lazySingleton<_i8.ProfilesAPI>(() => _i8.ProfilesAPI());
  gh.lazySingleton<_i9.ProfilesRepository>(() => _i9.ProfilesRepository());
  await gh.factoryAsync<_i10.SharedPreferences>(
    () => registerModule.prefs,
    preResolve: true,
  );
  gh.lazySingleton<_i11.SnackBarService>(() => _i11.SnackBarService());
  gh.factory<_i12.StartupViewModel>(() => _i12.StartupViewModel());
  return getIt;
}

class _$RegisterModule extends _i13.RegisterModule {}