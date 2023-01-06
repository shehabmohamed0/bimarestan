import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/apis/error_handler.dart';
import '../../locator/locator.dart';
import '../../models/profiles/profile.dart';
import '../../models/profiles/update_profile_request.dart';
import 'profiles_api.dart';

@lazySingleton
class ProfilesRepository {
  final ProfilesAPI _api = locator<ProfilesAPI>();

  Future<Either<Failure, List<Profile>>> getProfiles() async {
    try {
      final profiles = await _api.getProfiles();
      return Right(profiles);
    } on ErrorHandler catch (e) {
      return Left(e.failure);
    }
  }

  Future<Profile> updateProfile(UpdateProfileRequest request) async {
    try {
      final profile = await _api.updateProfile(request);
      return profile;
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }
}

class ImageFailure extends Failure {
  ImageFailure._(
    super.statusCode,
    super.message,
  );

  factory ImageFailure() => ImageFailure._(400, 'asdasdasd');
}
