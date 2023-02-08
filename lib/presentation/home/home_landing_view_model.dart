import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../core/services/snack_bar_service.dart';
import '../../locator/locator.dart';
import '../../data/profiles/profiles_repository.dart';

@injectable
class HomeViewModel extends ChangeNotifier {
  final ProfilesRepository _repository = locator<ProfilesRepository>();
  final SnackBarService _snackBarService = locator<SnackBarService>();
}
