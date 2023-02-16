import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@injectable
class AppointmentViewModel extends ChangeNotifier {
  DateTime? selectedAppointmentDate;
  DateTime selectedAppointmentDay = DateTime.now();
  void setSelectedAppointmentDate(DateTime date) {
    selectedAppointmentDate = date;
    notifyListeners();
  }

  void setSelectedAppointmentDay(DateTime date) {
    selectedAppointmentDay = date;
    notifyListeners();
  }
}
