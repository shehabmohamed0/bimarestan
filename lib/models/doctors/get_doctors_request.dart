import 'package:json_annotation/json_annotation.dart';

part 'get_doctors_request.g.dart';

@JsonSerializable(createFactory: false)
class GetDoctorsRequest {
  @JsonKey(name: 'categoryId')
  final int specialityId;
  final int page = 0;
  final int size = 10000;

  const GetDoctorsRequest({
    required this.specialityId,
  });

  Map<String, dynamic> toJson() => _$GetDoctorsRequestToJson(this);
}
