// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:bimarestan/core/services/firebase_notification_service.dart'
    as _i21;
import 'package:bimarestan/core/services/notification_service.dart' as _i20;
import 'package:bimarestan/core/services/snack_bar_service.dart' as _i35;
import 'package:bimarestan/data/appointments/appointments_api.dart' as _i4;
import 'package:bimarestan/data/appointments/appointments_repository.dart'
    as _i5;
import 'package:bimarestan/data/auth/auth_api.dart' as _i6;
import 'package:bimarestan/data/auth/auth_repository.dart' as _i7;
import 'package:bimarestan/data/auth/auth_service.dart' as _i41;
import 'package:bimarestan/data/clinics/clinic_repository.dart' as _i42;
import 'package:bimarestan/data/clinics/clinics_api.dart' as _i9;
import 'package:bimarestan/data/doctors/doctors_api.dart' as _i11;
import 'package:bimarestan/data/doctors/doctors_repository.dart' as _i12;
import 'package:bimarestan/data/health_care/health_care_api.dart' as _i14;
import 'package:bimarestan/data/health_care/health_care_repository.dart'
    as _i16;
import 'package:bimarestan/data/patient_analyzes/patient_analyzes_api.dart'
    as _i22;
import 'package:bimarestan/data/patient_analyzes/patient_analyzes_repository.dart'
    as _i23;
import 'package:bimarestan/data/payments/payments_api.dart' as _i24;
import 'package:bimarestan/data/payments/payments_repository.dart' as _i25;
import 'package:bimarestan/data/profiles/profiles_api.dart' as _i27;
import 'package:bimarestan/data/profiles/profiles_repository.dart' as _i28;
import 'package:bimarestan/data/specialities/specialities_api.dart' as _i36;
import 'package:bimarestan/data/specialities/specialities_repository.dart'
    as _i38;
import 'package:bimarestan/presentation/appointment/appointment_booking_view_model.dart'
    as _i3;
import 'package:bimarestan/presentation/auth/app/app_model.dart' as _i43;
import 'package:bimarestan/presentation/auth/login/login_view_model.dart'
    as _i19;
import 'package:bimarestan/presentation/auth/signup/signup_view_model.dart'
    as _i34;
import 'package:bimarestan/presentation/clinics/clinics_view_model.dart'
    as _i10;
import 'package:bimarestan/presentation/doctors/radiological_analyzes_view_model.dart'
    as _i29;
import 'package:bimarestan/presentation/doctors/send_radiological_analysis_view_model.dart'
    as _i31;
import 'package:bimarestan/presentation/doctors/surgery_booking_view_model.dart'
    as _i39;
import 'package:bimarestan/presentation/doctors/visit_doctors_view_model.dart'
    as _i40;
import 'package:bimarestan/presentation/home/health_care_page/health_care_page_model.dart'
    as _i15;
import 'package:bimarestan/presentation/home/home_landing_view_model.dart'
    as _i17;
import 'package:bimarestan/presentation/home/settings_page/settings_page_view_model.dart'
    as _i32;
import 'package:bimarestan/presentation/profile/profile_view_model.dart'
    as _i26;
import 'package:bimarestan/presentation/specialities/search_speciality_view_model.dart'
    as _i30;
import 'package:bimarestan/presentation/specialities/specialities_model.dart'
    as _i37;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i13;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i18;
import 'package:shared_preferences/shared_preferences.dart' as _i33;
import 'package:stacked_services/stacked_services.dart' as _i8;

import 'register_module.dart' as _i44;

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
  gh.lazySingleton<_i4.AppointmentsAPI>(() => _i4.AppointmentsAPI());
  gh.lazySingleton<_i5.AppointmentsRepository>(
      () => _i5.AppointmentsRepository());
  gh.lazySingleton<_i6.AuthAPI>(() => _i6.AuthAPI());
  gh.lazySingleton<_i7.AuthRepository>(() => _i7.AuthRepository());
  gh.singleton<_i8.BottomSheetService>(registerModule.bottomSheetService);
  gh.lazySingleton<_i9.ClinicsAPI>(() => _i9.ClinicsAPI());
  gh.factory<_i10.ClinicsViewModel>(() => _i10.ClinicsViewModel());
  gh.singleton<_i8.DialogService>(registerModule.dialogService);
  gh.lazySingleton<_i11.DoctorsAPI>(() => _i11.DoctorsAPI());
  gh.lazySingleton<_i12.DoctorsRepository>(() => _i12.DoctorsRepository());
  gh.factory<_i13.GoogleSignIn>(() => registerModule.googleSignIn);
  gh.lazySingleton<_i14.HealthCareAPI>(() => _i14.HealthCareAPI());
  gh.factory<_i15.HealthCarePageModel>(() => _i15.HealthCarePageModel());
  gh.lazySingleton<_i16.HealthcareRepository>(
      () => _i16.HealthcareRepository());
  gh.factory<_i17.HomeViewModel>(() => _i17.HomeViewModel());
  gh.lazySingleton<_i18.InternetConnectionChecker>(
      () => registerModule.internetConnectionChecker);
  gh.factory<_i19.LoginViewModel>(() => _i19.LoginViewModel());
  gh.singleton<_i8.NavigationService>(registerModule.navigationService);
  gh.lazySingleton<_i20.NotificationService>(
      () => _i21.FirebaseNotificationService());
  gh.lazySingleton<_i22.PatientAnalyzesAPI>(() => _i22.PatientAnalyzesAPI());
  gh.lazySingleton<_i23.PatientAnalyzesRepository>(
      () => _i23.PatientAnalyzesRepository());
  gh.lazySingleton<_i24.PaymentsAPI>(() => _i24.PaymentsAPI());
  gh.lazySingleton<_i25.PaymentsRepository>(() => _i25.PaymentsRepository());
  gh.factory<_i26.ProfileViewModel>(() => _i26.ProfileViewModel());
  gh.lazySingleton<_i27.ProfilesAPI>(() => _i27.ProfilesAPI());
  gh.lazySingleton<_i28.ProfilesRepository>(() => _i28.ProfilesRepository());
  gh.factory<_i29.RadiologicalAnalyzesViewModel>(
      () => _i29.RadiologicalAnalyzesViewModel());
  gh.factory<_i30.SearchSpecialityViewModel>(
      () => _i30.SearchSpecialityViewModel());
  gh.factory<_i31.SendRadiologicalAnalysisViewModel>(
      () => _i31.SendRadiologicalAnalysisViewModel());
  gh.factory<_i32.SettingsPageViewModel>(() => _i32.SettingsPageViewModel());
  await gh.factoryAsync<_i33.SharedPreferences>(
    () => registerModule.prefs,
    preResolve: true,
  );
  gh.factory<_i34.SignupViewModel>(() => _i34.SignupViewModel());
  gh.lazySingleton<_i35.SnackBarService>(() => _i35.SnackBarService());
  gh.lazySingleton<_i36.SpecialitiesApi>(() => _i36.SpecialitiesApi());
  gh.factory<_i37.SpecialitiesModel>(() => _i37.SpecialitiesModel());
  gh.lazySingleton<_i38.SpecialitiesRepository>(
      () => _i38.SpecialitiesRepository());
  gh.factory<_i39.SurgeryBookingViewModel>(
      () => _i39.SurgeryBookingViewModel());
  gh.factory<_i40.VisitDoctorsViewModel>(() => _i40.VisitDoctorsViewModel());
  gh.lazySingleton<_i41.AuthService>(() => _i41.AuthService(
        gh<_i7.AuthRepository>(),
        gh<_i33.SharedPreferences>(),
      ));
  gh.lazySingleton<_i42.ClinicRepository>(
      () => _i42.ClinicRepository(gh<_i9.ClinicsAPI>()));
  gh.factory<_i43.AppModel>(() => _i43.AppModel(gh<_i41.AuthService>()));
  return getIt;
}

class _$RegisterModule extends _i44.RegisterModule {}
