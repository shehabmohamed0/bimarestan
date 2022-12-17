import 'package:json_annotation/json_annotation.dart';
part 'signup_response.g.dart';

@JsonSerializable(createToJson: false)
class SignupResponse {
  SignupResponse();

  factory SignupResponse.fromJson(Map<String, dynamic> json) =>
      _$SignupResponseFromJson(json);
}
