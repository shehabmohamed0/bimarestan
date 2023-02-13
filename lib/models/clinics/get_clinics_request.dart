import 'package:json_annotation/json_annotation.dart';
part 'get_clinics_request.g.dart';

@JsonSerializable()
class GetClinicsRequest {
  final int doctorId;

  GetClinicsRequest({
    required this.doctorId,
  });

  factory GetClinicsRequest.fromJson(Map<String, dynamic> json) =>
      _$GetClinicsRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetClinicsRequestToJson(this);
}
