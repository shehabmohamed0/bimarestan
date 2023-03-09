import 'package:bimarestan/core/state_management/view_state.dart';
import 'package:bimarestan/data/appointments/appointments_repository.dart';
import 'package:bimarestan/data/clinics/clinic_repository.dart';
import 'package:bimarestan/models/appointments/appointment.dart';
import 'package:bimarestan/models/clinics/clinic.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../locator/locator.dart';
import 'appointment_booking_view_model.dart';

@injectable
class AppointmentDetailsViewModel extends ChangeNotifier {
  final ClinicRepository _clinicRepository = locator<ClinicRepository>();
  final AppointmentsRepository _appointmentsRepository =
      locator<AppointmentsRepository>();
  late Clinic clinic;

  ViewState viewState = ViewState.initial;
  List<DateTime> clinicTimes = [];
  List<DateTime> reservedTimes = [];
  Future<void> init({
    required Appointment appointment,
  }) async {
    try {
      viewState = ViewState.loading;
      notifyListeners();
      final data = await Future.wait([
        _clinicRepository.getClinic(appointment.clinicId),
        _appointmentsRepository.getClinicReservedDayTimes(
          clinicId: appointment.clinicId,
          date: appointment.appointmentDate,
        ),
      ]);
      clinic = data[0] as Clinic;
      final reservedTimesDouble = data[1] as List<double>;
      clinicTimes = getAllTimesOf(clinic)
          .map((e) => e.copyWith(
                year: appointment.appointmentDate.year,
                month: appointment.appointmentDate.month,
                day: appointment.appointmentDate.day,
              ))
          .toList();
      reservedTimes = reservedTimesDouble
          .map((e) => convertDoubleToDate(e).copyWith(
                year: appointment.appointmentDate.year,
                month: appointment.appointmentDate.month,
                day: appointment.appointmentDate.day,
              ))
          .toList();
      viewState = ViewState.success;
      notifyListeners();
    } catch (e) {
      viewState = ViewState.error;
      notifyListeners();
    }
  }
}
