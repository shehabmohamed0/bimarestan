// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bimarestan/core/state_management/view_state.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import 'package:bimarestan/data/health_care/health_care_repository.dart';
import 'package:bimarestan/models/clinics/clinic.dart';
import 'package:bimarestan/models/health_care/appointment.dart';

@injectable
class HealthViewModel extends ChangeNotifier {
  final HealthcareRepository healthcareRepository;
  HealthViewModel({
    required this.healthcareRepository,
  });
  List<Appointment> appointments = [];
  ViewState appointmentState = ViewState.initial;
  Future<void> getAllAppointmentsByPatientId(int patientId) async {
    appointmentState = ViewState.loading;
    notifyListeners();
    appointments =
        await healthcareRepository.getAllAppointmentsByPatientId(patientId);
    appointmentState = ViewState.success;
    notifyListeners();
  }
}
