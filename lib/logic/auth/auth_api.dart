import 'package:injectable/injectable.dart';

import '../../core/apis/api_utils.dart';
import '../../core/mixin/api_mixin.dart';
import '../../models/auth/login_request.dart';
import '../../models/auth/login_response.dart';
import '../../models/auth/signup_request.dart';
import '../../models/auth/signup_response.dart';

@lazySingleton
class AuthAPI with APIMixin {
  @override
  String get featurePath => '/bimarestan/user/addUser';

  Future<SignupResponse> signup(SignupRequest request) async {
    final response = await DioFactory.dio.post<Map<String, dynamic>>(
      featurePath,
      data: request.toJson(),
    );
    final model = SignupResponse.fromJson(response.data!);
    return model;
  }

  Future<LoginResponse> login(LoginRequest request) async {
    final response = await DioFactory.dio.post<Map<String, dynamic>>(
      '/bimarestan/authentication/generate-token',
      data: request.toJson(),
    );
    final model = LoginResponse.fromJson(response.data!);
    return model;
  }
}
