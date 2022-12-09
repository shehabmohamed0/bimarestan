import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../core/apis/error_handler.dart';
import '../../locator/locator.dart';
import '../../models/profile.dart';
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
}

class ImageFailure extends Failure {
  ImageFailure._(
    super.statusCode,
    super.message,
  );

  factory ImageFailure() => ImageFailure._(400, 'asdasdasd');
}
