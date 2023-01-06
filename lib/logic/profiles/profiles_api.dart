import 'package:injectable/injectable.dart';

import '../../core/apis/api_utils.dart';
import '../../core/apis/error_handler.dart';
import '../../core/resources/constants_manager.dart';
import '../../models/profiles/profile.dart';
import '../../models/profiles/update_profile_request.dart';

@lazySingleton
class ProfilesAPI {
  Future<List<Profile>> getProfiles() async {
    try {
      await Future.delayed(AppConstants.duration3s);
      return profiles;
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }

  Future<Profile> updateProfile(UpdateProfileRequest request) async {
    try {
      final response = await DioFactory.dio.put<Map<String, dynamic>>(
        '/bimarestan/user/updateUser',
        data: request.toJson(),
      );

      return Profile.fromJson(response.data!);
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }
}
