import 'package:json_annotation/json_annotation.dart';
part 'login_response.g.dart';

@JsonSerializable(createToJson: false)
class LoginResponse {
  LoginResponse();

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}
