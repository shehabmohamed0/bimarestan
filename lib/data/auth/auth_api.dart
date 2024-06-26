import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../core/apis/api_utils.dart';
import '../../core/resources/strings_manager.dart';
import '../../models/auth/login_request.dart';
import '../../models/auth/login_response.dart';
import '../../models/auth/signup_request.dart';
import '../../models/auth/signup_response.dart';
import '../../models/profiles/profile.dart';

@lazySingleton
class AuthAPI {
  Future<SignupResponse> signup(SignupRequest request) async {
    try {
      final response = await Dio()
          .post<Map<String, dynamic>>('${AppStrings.apiURL}/user/addUser',
              data: request.toJson(),
              options: Options(
                contentType: Headers.jsonContentType,
              ));
      final model = SignupResponse.fromJson(response.data!);
      return model;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<LoginResponse> login(LoginRequest request) async {
    final response = await Dio().post<Map<String, dynamic>>(
        '${AppStrings.apiURL}/authentication/generate-token',
        data: request.toJson(),
        options: Options(
          contentType: Headers.jsonContentType,
        ));
    final model = LoginResponse.fromJson(response.data!);
    return model;
  }

  Future<Profile> decodeToken(String token) async {
    final response = await DioFactory.dio.get<Map<String, dynamic>>(
      '/authentication/current-user',
    );
    final model = Profile.fromJson(
      response.data!..['token'] = token,
    );
    return model;
  }
}
