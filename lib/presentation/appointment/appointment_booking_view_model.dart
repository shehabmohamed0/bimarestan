import 'dart:collection';

import 'package:bimarestan/core/utils/dialogs.dart';
import 'package:bimarestan/models/profiles/profile.dart';
import 'package:bimarestan/presentation/home/health_care_page/health_care_page_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:provider/provider.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../core/apis/error_handler.dart';
import '../../core/services/snack_bar_service.dart';
import '../../core/state_management/view_state.dart';
import '../../data/appointments/appointments_api.dart';
import '../../data/appointments/appointments_repository.dart';
import '../../data/clinics/clinic_repository.dart';
import '../../locator/locator.dart';
import '../../models/appointments/create_appointment_request.dart';
import '../../models/clinics/clinic.dart';
import '../../router/routes.dart';
import '../prices/price.dart';

@injectable
class AppointmentViewModel extends ChangeNotifier {
  final AppointmentsRepository _repository = locator<AppointmentsRepository>();
  final ClinicRepository _clinicRepository = locator<ClinicRepository>();
  final NavigationService _navigationService = locator<NavigationService>();
  final SnackBarService _snackBarService = locator<SnackBarService>();

  late Profile patient;
  late Clinic clinic;
  HashSet<int> workingDays = HashSet();
  DateTime? selectedAppointmentDate = DateTime.now();
  List<DateTime> allPossibleTimes = [];
  List<DateTime> availableTimes = [];
  DateTime? selectedTime;
  List<Price> prices = [];
  ViewState viewState = ViewState.initial;
  ViewState dayTimesViewState = ViewState.initial;
  bool isLoading = false;

  Future<void> init(dynamic object, Profile patient) async {
    try {
      if (viewState != ViewState.loading) {
        viewState = ViewState.loading;
        notifyListeners();
      }
      this.patient = patient;

      if (object is int) {
        clinic = await _clinicRepository.getClinic(object);
      } else {
        clinic = object;
      }
      allPossibleTimes = getAllTimesOf(clinic);
      availableTimes = await _getAvailableTime();
      final prices = await _clinicRepository.getPrices(clinic.id);
      this.prices = prices;

      workingDays = HashSet.from(clinic.days);
      selectedAppointmentDate = _getDefaultSelectedDate();

      viewState = ViewState.success;
      notifyListeners();
    } catch (e) {
      viewState = ViewState.error;
      notifyListeners();
      rethrow;
    }
  }

  DateTime? _getDefaultSelectedDate() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    if (isAvailable(today)) return today;
    final tomorrow = today.add(const Duration(days: 1));
    if (isAvailable(tomorrow)) return tomorrow;
    final nextDay = tomorrow.add(const Duration(days: 1));
    if (isAvailable(nextDay)) return nextDay;
    final nextNextDay = nextDay.add(const Duration(days: 1));
    if (isAvailable(nextNextDay)) return nextNextDay;
    final nextNextNextDay = nextNextDay.add(const Duration(days: 1));
    if (isAvailable(nextNextNextDay)) return nextNextNextDay;
    final nextNextNextNextDay = nextNextNextDay.add(const Duration(days: 1));
    if (isAvailable(nextNextNextNextDay)) return nextNextNextNextDay;
    final nextNextNextNextNextDay =
        nextNextNextNextDay.add(const Duration(days: 1));
    if (isAvailable(nextNextNextNextNextDay)) return nextNextNextNextNextDay;
    return null;
  }

  void setSelectedAppointmentDay(DateTime date) async {
    if (!isAvailable(date)) return;
    final oldDate = selectedAppointmentDate;
    selectedAppointmentDate = date;
    selectedTime = null;
    notifyListeners();
    try {
      dayTimesViewState = ViewState.loading;
      notifyListeners();
      await _getAvailableTime();
      dayTimesViewState = ViewState.success;
      notifyListeners();
    } on ErrorHandler catch (e) {
      dayTimesViewState = ViewState.error;
      selectedAppointmentDate = oldDate;
      notifyListeners();
      _snackBarService.showErrorSnackBar(e.failure.message);
    }
  }

  void setSelectedAppointmentTime(DateTime date) {
    selectedTime = date;
    notifyListeners();
  }

  Future<List<DateTime>> _getAvailableTime() async {
    final dayReservedTimes = await _repository.getClinicReservedDayTimes(
      clinicId: clinic.id,
      date: selectedAppointmentDate!,
    );
    availableTimes = filterAvailableTime(
      dayReservedTimes,
      allPossibleTimes,
    );
    notifyListeners();
    return availableTimes;
  }

  bool selectedDayPredicate(DateTime day) {
    final weekDay = convertISO8601WeekDayToStartFromSaturday(day);
    if (!workingDays.contains(weekDay)) {
      return false;
    }
    return isSameDay(selectedAppointmentDate, day);
  }

  bool isAvailable(DateTime day) {
    final weekDay = convertISO8601WeekDayToStartFromSaturday(day);
    return workingDays.contains(weekDay);
  }

  void bookAppointment(BuildContext context) async {
    if (isLoading) return;
    final healthCareModel = context.read<HealthCarePageModel>();

    if (selectedAppointmentDate == null) {
      _snackBarService.showSnackBar('Please select a date');
      return;
    }

    if (selectedTime == null) {
      _snackBarService.showSnackBar('Please select a time');
      return;
    }

    isLoading = true;
    showLoadingDialog();
    try {
      final appointment =
          await _repository.createAppointment(CreateAppointmentRequest(
        clinicId: clinic.id,
        appointmentDate: selectedAppointmentDate!,
        time: _convertDateTimeToDouble(selectedTime!),
        doctorId: clinic.doctorId,
        patientId: patient.id,
        patientFullName: patient.fullName,
        clinicName: clinic.name,
        clinicAddress: clinic.address,
        doctorName: clinic.doctorName,
        numPatient: _getTimeIndex(selectedTime!),
        paymentId: 1,
        priceId: 1,
      ));
      healthCareModel.add(appointment);
      _navigationService.popUntil(
        (route) => route.settings.name == Routes.landing,
      );
      dismissLoadingDialog();
      _snackBarService.showSuccessSnackBar('appointment created successfully');
    } on AppointmentReservedException catch (e) {
      dismissLoadingDialog();

      availableTimes = filterAvailableTime(
        e.reservedTimes,
        allPossibleTimes,
      );
      notifyListeners();
      _snackBarService.showErrorSnackBar(
        'We are sorry, this appointment is reserved',
      );
    } on ErrorHandler catch (e) {
      dismissLoadingDialog();

      _snackBarService.showErrorSnackBar(e.failure.message);
    }
  }

  List<DateTime> filterAvailableTime(
      List<double> reservedTimes, List<DateTime> allPossibleTimes) {
    final reservedTimesConverted = reservedTimes
        .map((e) => convertDoubleToDate(e))
        .toList(growable: false);
    final availableTimes = allPossibleTimes
        .where((element) => !reservedTimesConverted.contains(element))
        .toList(growable: false);
    return availableTimes;
  }

  double _convertDateTimeToDouble(DateTime date) {
    return date.hour + date.minute / 100;
  }

  int _getTimeIndex(DateTime selectedTime) {
    return allPossibleTimes.indexWhere((element) => element == selectedTime);
  }
}

int convertISO8601WeekDayToStartFromSaturday(DateTime date) {
  final day = date.weekday;
  switch (day) {
    case DateTime.saturday:
      return 0;
    case DateTime.sunday:
      return 1;
    case DateTime.monday:
      return 2;
    case DateTime.tuesday:
      return 3;
    case DateTime.wednesday:
      return 4;
    case DateTime.thursday:
      return 5;
    case DateTime.friday:
      return 6;
    default:
      return -1;
  }
}

// by am or pm
String format(DateTime date) {
  final hour = date.hour;
  final minute = date.minute;
  final amPm = hour < 12 ? 'AM' : 'PM';
  final hour12 = hour % 12;
  final hour12String = hour12 == 0 ? '12' : hour12.toString();
  final minuteString = minute < 10 ? '0$minute' : minute.toString();
  return '$hour12String:$minuteString $amPm';
}

// split working hours to 30 minutes
List<DateTime> getAllTimesOf(Clinic clinic) {
  final startWork = convertDoubleToDate(clinic.startWork);
  final endWork = convertDoubleToDate(clinic.endWork);
  final workingHours = <DateTime>[];
  var currentHour = startWork;
  while (currentHour.isBefore(endWork)) {
    workingHours.add(currentHour);
    currentHour = currentHour.add(const Duration(minutes: 30));
  }
  return workingHours;
}

DateTime convertDoubleToDate(double date) {
  if (date < 0) throw Exception('Date must be positive');
  if (date > 23.59) throw Exception('Date must be less than 24');

  final fractionalPart = date % 1;
  if (fractionalPart == 0) return DateTime(0, 0, 0, date.floor().toInt(), 0);
  if (fractionalPart > 0.59) throw Exception('Minute must be less than 60');

  final hour = date - fractionalPart;
  final minute = (fractionalPart * 100).round();
  return DateTime(0, 0, 0, hour.toInt(), minute);
}
