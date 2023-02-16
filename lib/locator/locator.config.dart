// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:bimarestan/core/services/firebase_notification_service.dart'
    as _i18;
import 'package:bimarestan/core/services/notification_service.dart' as _i17;
import 'package:bimarestan/core/services/snack_bar_service.dart' as _i27;
import 'package:bimarestan/data/auth/auth_api.dart' as _i4;
import 'package:bimarestan/data/auth/auth_repository.dart' as _i5;
import 'package:bimarestan/data/auth/auth_service.dart' as _i33;
import 'package:bimarestan/data/clinics/clinic_repository.dart' as _i34;
import 'package:bimarestan/data/clinics/clinics_api.dart' as _i7;
import 'package:bimarestan/data/doctors/doctors_api.dart' as _i9;
import 'package:bimarestan/data/doctors/doctors_repository.dart' as _i10;
import 'package:bimarestan/data/health_care/health_care_api.dart' as _i12;
import 'package:bimarestan/data/health_care/health_care_repository.dart'
    as _i13;
import 'package:bimarestan/data/profiles/profiles_api.dart' as _i20;
import 'package:bimarestan/data/profiles/profiles_repository.dart' as _i21;
import 'package:bimarestan/data/specialities/specialities_api.dart' as _i28;
import 'package:bimarestan/data/specialities/specialities_repository.dart'
    as _i29;
import 'package:bimarestan/presentation/appointment/appointment_view_model.dart'
    as _i3;
import 'package:bimarestan/presentation/auth/app/app_model.dart' as _i36;
import 'package:bimarestan/presentation/auth/login/login_view_model.dart'
    as _i16;
import 'package:bimarestan/presentation/auth/signup/signup_view_model.dart'
    as _i26;
import 'package:bimarestan/presentation/clinics/clinics_view_model.dart' as _i8;
import 'package:bimarestan/presentation/doctors/radiological_analyzes_view_model.dart'
    as _i22;
import 'package:bimarestan/presentation/doctors/surgery_booking_view_model.dart'
    as _i31;
import 'package:bimarestan/presentation/doctors/visit_doctors_view_model.dart'
    as _i32;
import 'package:bimarestan/presentation/home/health_page/health_view_model.dart'
    as _i35;
import 'package:bimarestan/presentation/home/home_landing_view_model.dart'
    as _i14;
import 'package:bimarestan/presentation/home/settings_page/settings_page_view_model.dart'
    as _i24;
import 'package:bimarestan/presentation/profile/profile_view_model.dart'
    as _i19;
import 'package:bimarestan/presentation/specialities/search_speciality_view_model.dart'
    as _i23;
import 'package:bimarestan/presentation/specialities/specialities_view_model.dart'
    as _i30;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i11;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i15;
import 'package:shared_preferences/shared_preferences.dart' as _i25;
import 'package:stacked_services/stacked_services.dart' as _i6;

import 'register_module.dart' as _i37;

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
  gh.factory<_i3.AppointmentViewModel>(() => _i3.AppointmentViewModel());
  gh.lazySingleton<_i4.AuthAPI>(() => _i4.AuthAPI());
  gh.lazySingleton<_i5.AuthRepository>(() => _i5.AuthRepository());
  gh.singleton<_i6.BottomSheetService>(registerModule.bottomSheetService);
  gh.lazySingleton<_i7.ClinicsAPI>(() => _i7.ClinicsAPI());
  gh.factory<_i8.ClinicsViewModel>(() => _i8.ClinicsViewModel());
  gh.singleton<_i6.DialogService>(registerModule.dialogService);
  gh.lazySingleton<_i9.DoctorsAPI>(() => _i9.DoctorsAPI());
  gh.lazySingleton<_i10.DoctorsRepository>(() => _i10.DoctorsRepository());
  gh.factory<_i11.GoogleSignIn>(() => registerModule.googleSignIn);
  gh.lazySingleton<_i12.HealthCareApi>(() => _i12.HealthCareApi());
  gh.lazySingleton<_i13.HealthcareRepository>(
      () => _i13.HealthcareRepository(healthcareApi: gh<_i12.HealthCareApi>()));
  gh.factory<_i14.HomeViewModel>(() => _i14.HomeViewModel());
  gh.lazySingleton<_i15.InternetConnectionChecker>(
      () => registerModule.internetConnectionChecker);
  gh.factory<_i16.LoginViewModel>(() => _i16.LoginViewModel());
  gh.singleton<_i6.NavigationService>(registerModule.navigationService);
  gh.lazySingleton<_i17.NotificationService>(
      () => _i18.FirebaseNotificationService());
  gh.factory<_i19.ProfileViewModel>(() => _i19.ProfileViewModel());
  gh.lazySingleton<_i20.ProfilesAPI>(() => _i20.ProfilesAPI());
  gh.lazySingleton<_i21.ProfilesRepository>(() => _i21.ProfilesRepository());
  gh.factory<_i22.RadiologicalAnalyzesViewModel>(
      () => _i22.RadiologicalAnalyzesViewModel());
  gh.factory<_i23.SearchSpecialityViewModel>(
      () => _i23.SearchSpecialityViewModel());
  gh.factory<_i24.SettingsPageViewModel>(() => _i24.SettingsPageViewModel());
  await gh.factoryAsync<_i25.SharedPreferences>(
    () => registerModule.prefs,
    preResolve: true,
  );
  gh.factory<_i26.SignupViewModel>(() => _i26.SignupViewModel());
  gh.lazySingleton<_i27.SnackBarService>(() => _i27.SnackBarService());
  gh.lazySingleton<_i28.SpecialitiesApi>(() => _i28.SpecialitiesApi());
  gh.lazySingleton<_i29.SpecialitiesRepository>(
      () => _i29.SpecialitiesRepository());
  gh.factory<_i30.SpecialitiesViewModel>(() => _i30.SpecialitiesViewModel());
  gh.factory<_i31.SurgeryBookingViewModel>(
      () => _i31.SurgeryBookingViewModel());
  gh.factory<_i32.VisitDoctorsViewModel>(() => _i32.VisitDoctorsViewModel());
  gh.lazySingleton<_i33.AuthService>(() => _i33.AuthService(
        gh<_i5.AuthRepository>(),
        gh<_i25.SharedPreferences>(),
      ));
  gh.lazySingleton<_i34.ClinicRepository>(
      () => _i34.ClinicRepository(gh<_i7.ClinicsAPI>()));
  gh.factory<_i35.HealthViewModel>(() => _i35.HealthViewModel(
      healthcareRepository: gh<_i13.HealthcareRepository>()));
  gh.factory<_i36.AppModel>(() => _i36.AppModel(gh<_i33.AuthService>()));
  return getIt;
}

class _$RegisterModule extends _i37.RegisterModule {}
