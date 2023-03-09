// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bimarestan/core/state_management/view_state.dart';
import 'package:bimarestan/data/health_care/health_care_repository.dart';
import 'package:bimarestan/locator/locator.dart';
import 'package:bimarestan/models/appointments/appointment.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@injectable
class HealthCarePageModel extends ChangeNotifier {
  final HealthcareRepository _repository = locator<HealthcareRepository>();
  List<Appointment> appointments = [];
  ViewState appointmentState = ViewState.initial;
  Future<void> init(int patientId) async {
    appointmentState = ViewState.loading;
    notifyListeners();
    try {
      appointments = await _repository.getAllAppointmentsByPatientId(patientId);
      sortByDateDesc();
      appointmentState = ViewState.success;
    } catch (e) {
      appointmentState = ViewState.error;
      notifyListeners();
      rethrow;
    }
    notifyListeners();
  }

  List<Appointment> sortByDateDesc() {
    appointments.sort((a, b) => b.appointmentDate.compareTo(a.appointmentDate));
    return appointments;
  }

  add(Appointment appointment) {
    appointments.add(appointment);
    notifyListeners();
  }
}
