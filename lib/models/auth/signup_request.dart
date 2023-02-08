import 'package:bimarestan/core/enums.dart';
import 'package:json_annotation/json_annotation.dart';
part 'signup_request.g.dart';

@JsonSerializable(createFactory: false)
class SignupRequest {
  final String address;
  final int age;
  final String description;
  final String email;
  final String fullName;
  final String password;
  final String phone;
  @JsonKey(name: 'fireBaseToken')
  final String firebaseMessagingToken;
  final RoleId roleId = RoleId.patient;

  const SignupRequest({
    required this.address,
    required this.age,
    required this.description,
    required this.email,
    required this.fullName,
    required this.password,
    required this.phone,
    required this.firebaseMessagingToken,
  });

  Map<String, dynamic> toJson() => _$SignupRequestToJson(this);
}
