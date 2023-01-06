import '../profiles/profile.dart';
// part 'login_response.g.dart';

class LoginResponse {
  final Profile profile;
  LoginResponse(this.profile);

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      LoginResponse(Profile.fromJson(json));
}
