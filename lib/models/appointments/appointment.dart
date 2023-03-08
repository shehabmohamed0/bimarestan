class Appointment {
  final DateTime added;
  final DateTime appointmentDate;
  final bool cancelled;
  final String? clinicAddress;
  final int clinicId;
  final String? clinicName;
  final String? clinicPhone;
  final bool finish;
  final int id;
  final int numPatient;
  final String? nurseFullName;
  final int? nurseId;
  final String? patientFullName;
  final int patientId;
  final String? patientPhone;
  final bool pay;
  final String? paymentDescription;
  final int paymentId;
  final String? paymentName;
  final double time;
  final DateTime updated;
  Appointment({
    required this.added,
    required this.appointmentDate,
    required this.cancelled,
    required this.clinicAddress,
    required this.clinicId,
    required this.clinicName,
    required this.clinicPhone,
    required this.finish,
    required this.id,
    required this.numPatient,
    required this.nurseFullName,
    required this.nurseId,
    required this.patientFullName,
    required this.patientId,
    required this.patientPhone,
    required this.pay,
    required this.paymentDescription,
    required this.paymentId,
    required this.paymentName,
    required this.time,
    required this.updated,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) => Appointment(
        added: DateTime.parse(json["added"]),
        appointmentDate: DateTime.parse(json["appointmentDate"]),
        cancelled: json["cancelled"],
        clinicAddress: json["clinicAddress"],
        clinicId: json["clinicId"],
        clinicName: json["clinicName"],
        clinicPhone: json["clinicPhone"],
        finish: json["finish"],
        id: json["id"],
        numPatient: json["numPatient"],
        nurseFullName: json["nurseFullName"],
        nurseId: json["nurseId"],
        patientFullName: json["patientFullName"],
        patientId: json["patientId"],
        patientPhone: json["patientPhone"],
        pay: json["pay"],
        paymentDescription: json["paymentDescription"],
        paymentId: json["paymentId"],
        paymentName: json["paymentName"],
        time: json["time"],
        updated: DateTime.parse(json["updated"]),
      );

  Map<String, dynamic> toJson() => {
        "added": added.toIso8601String(),
        "appointmentDate": appointmentDate.toIso8601String(),
        "cancelled": cancelled,
        "clinicAddress": clinicAddress,
        "clinicId": clinicId,
        "clinicName": clinicName,
        "clinicPhone": clinicPhone,
        "finish": finish,
        "id": id,
        "numPatient": numPatient,
        "nurseFullName": nurseFullName,
        "nurseId": nurseId,
        "patientFullName": patientFullName,
        "patientId": patientId,
        "patientPhone": patientPhone,
        "pay": pay,
        "paymentDescription": paymentDescription,
        "paymentId": paymentId,
        "paymentName": paymentName,
        "time": time,
        "updated": updated.toIso8601String(),
      };
}
