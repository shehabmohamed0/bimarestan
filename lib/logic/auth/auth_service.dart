// ignore_for_file: constant_identifier_names

import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:bimarestan/logic/auth/auth_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/auth/login_request.dart';
import '../../models/auth/login_response.dart';
import '../../models/auth/signup_request.dart';
import '../../models/auth/signup_response.dart';
import '../../models/profiles/profile.dart';

const _RX_PROFILE_KEY = 'RX_PROFILE_KEY';

@lazySingleton
class AuthService {
  final AuthRepository _authRepository;
  final SharedPreferences _sharedPreferences;
  late final StreamController<Profile?> _controller;

  AuthService(
    this._authRepository,
    this._sharedPreferences,
  ) {
    _controller = StreamController<Profile?>();
    _init();
  }

  Future<void> _init() async {
    final json = _sharedPreferences.getString(_RX_PROFILE_KEY);
    if (json == null) {
      _controller.add(null);
      log('message');
      return;
    }
    final profile = Profile.fromJson(jsonDecode(json));
    try {
      final newProfile = await _authRepository.decodeToken(profile.token);
      _controller.add(newProfile);
    } catch (e) {
      _controller.add(null);
    }
  }

  Stream<Profile?> get userStateChanges => _controller.stream;

  Future<LoginResponse> login(LoginRequest request) async {
    final response = await _authRepository.login(request);
    await _saveProfile(response.profile);
    return response;
  }

  Future<SignupResponse> signup(SignupRequest request) async {
    final response = await _authRepository.signup(request);
    await _saveProfile(response.profile);
    return response;
  }

  void profileChanged(Profile profile) async {
    final json = jsonEncode(profile.toJson());
    await _sharedPreferences.setString(_RX_PROFILE_KEY, json);
    _controller.add(profile);
  }

  Future<void> _saveProfile(Profile profile) async {
    final json = jsonEncode(profile.toJson());
    await _sharedPreferences.setString(_RX_PROFILE_KEY, json);
    await _sharedPreferences.setString('token', profile.token);
    _controller.add(profile);
  }

  Future<void> logout() async {
    return _deleteSavedPofile();
  }

  Future<void> _deleteSavedPofile() async {
    await Future.wait([
      _sharedPreferences.remove(_RX_PROFILE_KEY),
      _sharedPreferences.remove('token'),
    ]);
    _controller.add(null);
  }
}
