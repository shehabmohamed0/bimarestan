// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:bimarestan/core/services/firebase_notification_service.dart'
    as _i24;
import 'package:bimarestan/core/services/notification_service.dart' as _i23;
import 'package:bimarestan/core/services/snack_bar_service.dart' as _i38;
import 'package:bimarestan/data/appointments/appointments_api.dart' as _i5;
import 'package:bimarestan/data/appointments/appointments_repository.dart'
    as _i6;
import 'package:bimarestan/data/auth/auth_api.dart' as _i7;
import 'package:bimarestan/data/auth/auth_repository.dart' as _i8;
import 'package:bimarestan/data/auth/auth_service.dart' as _i44;
import 'package:bimarestan/data/clinics/clinic_repository.dart' as _i45;
import 'package:bimarestan/data/clinics/clinics_api.dart' as _i11;
import 'package:bimarestan/data/doctors/doctors_api.dart' as _i13;
import 'package:bimarestan/data/doctors/doctors_repository.dart' as _i15;
import 'package:bimarestan/data/health_care/health_care_api.dart' as _i17;
import 'package:bimarestan/data/health_care/health_care_repository.dart'
    as _i19;
import 'package:bimarestan/data/patient_analyzes/patient_analyzes_api.dart'
    as _i25;
import 'package:bimarestan/data/patient_analyzes/patient_analyzes_repository.dart'
    as _i26;
import 'package:bimarestan/data/payments/payments_api.dart' as _i27;
import 'package:bimarestan/data/payments/payments_repository.dart' as _i28;
import 'package:bimarestan/data/profiles/profiles_api.dart' as _i30;
import 'package:bimarestan/data/profiles/profiles_repository.dart' as _i31;
import 'package:bimarestan/data/specialities/specialities_api.dart' as _i39;
import 'package:bimarestan/data/specialities/specialities_repository.dart'
    as _i41;
import 'package:bimarestan/presentation/appointment/appointment_booking_view_model.dart'
    as _i4;
import 'package:bimarestan/presentation/appointment/appointment_details_view_model.dart'
    as _i3;
import 'package:bimarestan/presentation/auth/app/app_model.dart' as _i46;
import 'package:bimarestan/presentation/auth/login/login_view_model.dart'
    as _i22;
import 'package:bimarestan/presentation/auth/signup/signup_view_model.dart'
    as _i37;
import 'package:bimarestan/presentation/chat/chat_view_model.dart' as _i10;
import 'package:bimarestan/presentation/chat/doctors_chats_view_model.dart'
    as _i14;
import 'package:bimarestan/presentation/clinics/clinics_view_model.dart'
    as _i12;
import 'package:bimarestan/presentation/doctors/radiological_analyzes_view_model.dart'
    as _i32;
import 'package:bimarestan/presentation/doctors/send_radiological_analysis_view_model.dart'
    as _i34;
import 'package:bimarestan/presentation/doctors/surgery_booking_view_model.dart'
    as _i42;
import 'package:bimarestan/presentation/doctors/visit_doctors_view_model.dart'
    as _i43;
import 'package:bimarestan/presentation/home/health_care_page/health_care_page_model.dart'
    as _i18;
import 'package:bimarestan/presentation/home/home_landing_view_model.dart'
    as _i20;
import 'package:bimarestan/presentation/home/settings_page/settings_page_view_model.dart'
    as _i35;
import 'package:bimarestan/presentation/profile/profile_view_model.dart'
    as _i29;
import 'package:bimarestan/presentation/specialities/search_speciality_view_model.dart'
    as _i33;
import 'package:bimarestan/presentation/specialities/specialities_model.dart'
    as _i40;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i16;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i21;
import 'package:shared_preferences/shared_preferences.dart' as _i36;
import 'package:stacked_services/stacked_services.dart' as _i9;

import 'register_module.dart' as _i47;

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
  gh.factory<_i3.AppointmentDetailsViewModel>(
      () => _i3.AppointmentDetailsViewModel());
  gh.factory<_i4.AppointmentViewModel>(() => _i4.AppointmentViewModel());
  gh.lazySingleton<_i5.AppointmentsAPI>(() => _i5.AppointmentsAPI());
  gh.lazySingleton<_i6.AppointmentsRepository>(
      () => _i6.AppointmentsRepository());
  gh.lazySingleton<_i7.AuthAPI>(() => _i7.AuthAPI());
  gh.lazySingleton<_i8.AuthRepository>(() => _i8.AuthRepository());
  gh.singleton<_i9.BottomSheetService>(registerModule.bottomSheetService);
  gh.factory<_i10.ChatViewModel>(() => _i10.ChatViewModel());
  gh.lazySingleton<_i11.ClinicsAPI>(() => _i11.ClinicsAPI());
  gh.factory<_i12.ClinicsViewModel>(() => _i12.ClinicsViewModel());
  gh.singleton<_i9.DialogService>(registerModule.dialogService);
  gh.lazySingleton<_i13.DoctorsAPI>(() => _i13.DoctorsAPI());
  gh.factory<_i14.DoctorsChatsViewModel>(() => _i14.DoctorsChatsViewModel());
  gh.lazySingleton<_i15.DoctorsRepository>(() => _i15.DoctorsRepository());
  gh.factory<_i16.GoogleSignIn>(() => registerModule.googleSignIn);
  gh.lazySingleton<_i17.HealthCareAPI>(() => _i17.HealthCareAPI());
  gh.factory<_i18.HealthCarePageModel>(() => _i18.HealthCarePageModel());
  gh.lazySingleton<_i19.HealthcareRepository>(
      () => _i19.HealthcareRepository());
  gh.factory<_i20.HomeViewModel>(() => _i20.HomeViewModel());
  gh.lazySingleton<_i21.InternetConnectionChecker>(
      () => registerModule.internetConnectionChecker);
  gh.factory<_i22.LoginViewModel>(() => _i22.LoginViewModel());
  gh.singleton<_i9.NavigationService>(registerModule.navigationService);
  gh.lazySingleton<_i23.NotificationService>(
      () => _i24.FirebaseNotificationService());
  gh.lazySingleton<_i25.PatientAnalyzesAPI>(() => _i25.PatientAnalyzesAPI());
  gh.lazySingleton<_i26.PatientAnalyzesRepository>(
      () => _i26.PatientAnalyzesRepository());
  gh.lazySingleton<_i27.PaymentsAPI>(() => _i27.PaymentsAPI());
  gh.lazySingleton<_i28.PaymentsRepository>(() => _i28.PaymentsRepository());
  gh.factory<_i29.ProfileViewModel>(() => _i29.ProfileViewModel());
  gh.lazySingleton<_i30.ProfilesAPI>(() => _i30.ProfilesAPI());
  gh.lazySingleton<_i31.ProfilesRepository>(() => _i31.ProfilesRepository());
  gh.factory<_i32.RadiologicalAnalyzesViewModel>(
      () => _i32.RadiologicalAnalyzesViewModel());
  gh.factory<_i33.SearchSpecialityViewModel>(
      () => _i33.SearchSpecialityViewModel());
  gh.factory<_i34.SendRadiologicalAnalysisViewModel>(
      () => _i34.SendRadiologicalAnalysisViewModel());
  gh.factory<_i35.SettingsPageViewModel>(() => _i35.SettingsPageViewModel());
  await gh.factoryAsync<_i36.SharedPreferences>(
    () => registerModule.prefs,
    preResolve: true,
  );
  gh.factory<_i37.SignupViewModel>(() => _i37.SignupViewModel());
  gh.lazySingleton<_i38.SnackBarService>(() => _i38.SnackBarService());
  gh.lazySingleton<_i39.SpecialitiesApi>(() => _i39.SpecialitiesApi());
  gh.factory<_i40.SpecialitiesModel>(() => _i40.SpecialitiesModel());
  gh.lazySingleton<_i41.SpecialitiesRepository>(
      () => _i41.SpecialitiesRepository());
  gh.factory<_i42.SurgeryBookingViewModel>(
      () => _i42.SurgeryBookingViewModel());
  gh.factory<_i43.VisitDoctorsViewModel>(() => _i43.VisitDoctorsViewModel());
  gh.lazySingleton<_i44.AuthService>(() => _i44.AuthService(
        gh<_i8.AuthRepository>(),
        gh<_i36.SharedPreferences>(),
      ));
  gh.lazySingleton<_i45.ClinicRepository>(
      () => _i45.ClinicRepository(gh<_i11.ClinicsAPI>()));
  gh.factory<_i46.AppModel>(() => _i46.AppModel(gh<_i44.AuthService>()));
  return getIt;
}

class _$RegisterModule extends _i47.RegisterModule {}
