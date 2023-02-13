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
