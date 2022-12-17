import 'package:injectable/injectable.dart';

import '../../core/apis/error_handler.dart';
import '../../locator/locator.dart';
import '../../models/auth/login_request.dart';
import '../../models/auth/login_response.dart';
import '../../models/auth/signup_request.dart';
import '../../models/auth/signup_response.dart';
import 'auth_api.dart';

@lazySingleton
class AuthRepository {
  final AuthAPI _api = locator<AuthAPI>();

  Future<SignupResponse> signup(SignupRequest request) async {
    try {
      final response = await _api.signup(request);
      return response;
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }

  Future<LoginResponse> login(LoginRequest request) async {
    try {
      final response = await _api.login(request);
      return response;
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }
}
