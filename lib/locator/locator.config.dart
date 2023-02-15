// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:bimarestan/core/services/firebase_notification_service.dart'
    as _i17;
import 'package:bimarestan/core/services/notification_service.dart' as _i16;
import 'package:bimarestan/core/services/snack_bar_service.dart' as _i26;
import 'package:bimarestan/data/auth/auth_api.dart' as _i3;
import 'package:bimarestan/data/auth/auth_repository.dart' as _i4;
import 'package:bimarestan/data/auth/auth_service.dart' as _i32;
import 'package:bimarestan/data/clinics/clinic_repository.dart' as _i33;
import 'package:bimarestan/data/clinics/clinics_api.dart' as _i6;
import 'package:bimarestan/data/doctors/doctors_api.dart' as _i8;
import 'package:bimarestan/data/doctors/doctors_repository.dart' as _i9;
import 'package:bimarestan/data/health_care/health_care_api.dart' as _i11;
import 'package:bimarestan/data/health_care/health_care_repository.dart'
    as _i12;
import 'package:bimarestan/data/profiles/profiles_api.dart' as _i19;
import 'package:bimarestan/data/profiles/profiles_repository.dart' as _i20;
import 'package:bimarestan/data/specialities/specialities_api.dart' as _i27;
import 'package:bimarestan/data/specialities/specialities_repository.dart'
    as _i28;
import 'package:bimarestan/presentation/auth/app/app_model.dart' as _i35;
import 'package:bimarestan/presentation/auth/login/login_view_model.dart'
    as _i15;
import 'package:bimarestan/presentation/auth/signup/signup_view_model.dart'
    as _i25;
import 'package:bimarestan/presentation/clinics/clinics_view_model.dart' as _i7;
import 'package:bimarestan/presentation/doctors/radiological_analyzes_view_model.dart'
    as _i21;
import 'package:bimarestan/presentation/doctors/surgery_booking_view_model.dart'
    as _i30;
import 'package:bimarestan/presentation/doctors/visit_doctors_view_model.dart'
    as _i31;
import 'package:bimarestan/presentation/home/health_page/health_view_model.dart'
    as _i34;
import 'package:bimarestan/presentation/home/home_landing_view_model.dart'
    as _i13;
import 'package:bimarestan/presentation/home/settings_page/settings_page_view_model.dart'
    as _i23;
import 'package:bimarestan/presentation/profile/profile_view_model.dart'
    as _i18;
import 'package:bimarestan/presentation/specialities/search_speciality_view_model.dart'
    as _i22;
import 'package:bimarestan/presentation/specialities/specialities_view_model.dart'
    as _i29;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i10;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i14;
import 'package:shared_preferences/shared_preferences.dart' as _i24;
import 'package:stacked_services/stacked_services.dart' as _i5;

import 'register_module.dart' as _i36;

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
  gh.lazySingleton<_i6.ClinicsAPI>(() => _i6.ClinicsAPI());
  gh.factory<_i7.ClinicsViewModel>(() => _i7.ClinicsViewModel());
  gh.singleton<_i5.DialogService>(registerModule.dialogService);
  gh.lazySingleton<_i8.DoctorsAPI>(() => _i8.DoctorsAPI());
  gh.lazySingleton<_i9.DoctorsRepository>(() => _i9.DoctorsRepository());
  gh.factory<_i10.GoogleSignIn>(() => registerModule.googleSignIn);
  gh.lazySingleton<_i11.HealthCareApi>(() => _i11.HealthCareApi());
  gh.lazySingleton<_i12.HealthcareRepository>(
      () => _i12.HealthcareRepository(healthcareApi: gh<_i11.HealthCareApi>()));
  gh.factory<_i13.HomeViewModel>(() => _i13.HomeViewModel());
  gh.lazySingleton<_i14.InternetConnectionChecker>(
      () => registerModule.internetConnectionChecker);
  gh.factory<_i15.LoginViewModel>(() => _i15.LoginViewModel());
  gh.singleton<_i5.NavigationService>(registerModule.navigationService);
  gh.lazySingleton<_i16.NotificationService>(
      () => _i17.FirebaseNotificationService());
  gh.factory<_i18.ProfileViewModel>(() => _i18.ProfileViewModel());
  gh.lazySingleton<_i19.ProfilesAPI>(() => _i19.ProfilesAPI());
  gh.lazySingleton<_i20.ProfilesRepository>(() => _i20.ProfilesRepository());
  gh.factory<_i21.RadiologicalAnalyzesViewModel>(
      () => _i21.RadiologicalAnalyzesViewModel());
  gh.factory<_i22.SearchSpecialityViewModel>(
      () => _i22.SearchSpecialityViewModel());
  gh.factory<_i23.SettingsPageViewModel>(() => _i23.SettingsPageViewModel());
  await gh.factoryAsync<_i24.SharedPreferences>(
    () => registerModule.prefs,
    preResolve: true,
  );
  gh.factory<_i25.SignupViewModel>(() => _i25.SignupViewModel());
  gh.lazySingleton<_i26.SnackBarService>(() => _i26.SnackBarService());
  gh.lazySingleton<_i27.SpecialitiesApi>(() => _i27.SpecialitiesApi());
  gh.lazySingleton<_i28.SpecialitiesRepository>(
      () => _i28.SpecialitiesRepository());
  gh.factory<_i29.SpecialitiesViewModel>(() => _i29.SpecialitiesViewModel());
  gh.factory<_i30.SurgeryBookingViewModel>(
      () => _i30.SurgeryBookingViewModel());
  gh.factory<_i31.VisitDoctorsViewModel>(() => _i31.VisitDoctorsViewModel());
  gh.lazySingleton<_i32.AuthService>(() => _i32.AuthService(
        gh<_i4.AuthRepository>(),
        gh<_i24.SharedPreferences>(),
      ));
  gh.lazySingleton<_i33.ClinicRepository>(
      () => _i33.ClinicRepository(gh<_i6.ClinicsAPI>()));
  gh.factory<_i34.HealthViewModel>(() => _i34.HealthViewModel(
      healthcareRepository: gh<_i12.HealthcareRepository>()));
  gh.factory<_i35.AppModel>(() => _i35.AppModel(gh<_i32.AuthService>()));
  return getIt;
}

class _$RegisterModule extends _i36.RegisterModule {}
