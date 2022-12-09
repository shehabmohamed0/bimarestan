import 'package:bimarestan/core/apis/api_utils.dart';
import 'package:bimarestan/core/apis/error_handler.dart';
import 'package:bimarestan/core/resources/constants_manager.dart';
import 'package:injectable/injectable.dart';

import '../../core/mixin/api_mixin.dart';
import '../../models/profile.dart';

@lazySingleton
class ProfilesAPI with APIMixin {
  @override
  String get featurePath => '/profiles';

  Future<List<Profile>> getProfiles() async {
    try {
      await Future.delayed(AppConstants.duration3s);
      return profiles;
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }
}
