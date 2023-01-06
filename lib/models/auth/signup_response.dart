import 'package:json_annotation/json_annotation.dart';

import '../profiles/profile.dart';
// part 'signup_response.g.dart';

@JsonSerializable(createToJson: false)
class SignupResponse {
  final Profile profile;
  SignupResponse(this.profile);

  factory SignupResponse.fromJson(Map<String, dynamic> json) => SignupResponse(
        Profile.fromJson(json),
      );
}
