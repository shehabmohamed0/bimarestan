import 'package:json_annotation/json_annotation.dart';

part 'clinic.g.dart';

@JsonSerializable()
class Clinic {
  final int id;
  final String name;
  final String address;
  final String phone;
  final String? email;
  final String description;
  final List<int> days;
  final double startWork;
  final double endWork;
  final int doctorId;
  @JsonKey(name: 'doctorFullName')
  final String doctorName;
  final String doctorJobTitle;
  final String doctorPhone;
  final String doctorDescription;

  Clinic({
    required this.id,
    required this.name,
    required this.address,
    required this.phone,
    required this.email,
    required this.description,
    required this.days,
    required this.startWork,
    required this.endWork,
    required this.doctorId,
    required this.doctorName,
    required this.doctorJobTitle,
    required this.doctorPhone,
    required this.doctorDescription,
  });
  factory Clinic.fromJson(Map<String, dynamic> json) => _$ClinicFromJson(json);
  Map<String, dynamic> toJson() => _$ClinicToJson(this);
}

DateTime convertDoubleToDate(double date) {
  if (date < 0) throw Exception('Date must be positive');
  if (date > 23.59) throw Exception('Date must be less than 24');

  final fractionalPart = date % 1;
  if (fractionalPart == 0) return DateTime(0, 0, 0, date.floor().toInt(), 0);
  if (fractionalPart > 0.59) throw Exception('Minute must be less than 60');

  final hour = date - fractionalPart;
  final minute = (fractionalPart * 60).round();
  return DateTime(0, 0, 0, hour.toInt(), minute);
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
List<DateTime> getWorkingHours(Clinic clinic) {
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