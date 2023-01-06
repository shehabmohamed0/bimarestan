import 'package:json_annotation/json_annotation.dart';

import '../../core/enums.dart';
part 'update_profile_request.g.dart';

@JsonSerializable(createFactory: false)
class UpdateProfileRequest {
  final int id;
  final String address;
  final int age;
  final String description;
  final String email;
  final String fullName;
  final String password;
  final String phone;
  final RoleId roleId = RoleId.patient;
  UpdateProfileRequest({
    required this.id,
    required this.address,
    required this.age,
    required this.description,
    required this.email,
    required this.fullName,
    required this.password,
    required this.phone,
  });

  Map<String, dynamic> toJson() => _$UpdateProfileRequestToJson(this);
}
