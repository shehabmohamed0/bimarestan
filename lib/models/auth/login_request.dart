import 'package:json_annotation/json_annotation.dart';

part 'login_request.g.dart';

@JsonSerializable(createFactory: false)
class LoginRequest {
  @JsonKey(name: 'username')
  final String email;
  final String password;

  LoginRequest({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}
