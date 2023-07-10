import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../core/apis/error_handler.dart';
import '../../core/services/snack_bar_service.dart';
import '../../core/utils/dialogs.dart';
import '../../data/patient_analyzes/patient_analyzes_repository.dart';
import '../../locator/locator.dart';
import '../../models/patient_analyzes/send_analyzes_request.dart';
import '../../router/routes.dart';

@injectable
class SendRadiologicalAnalysisViewModel extends ChangeNotifier {
  final PatientAnalyzesRepository _repository =
      locator<PatientAnalyzesRepository>();
  final NavigationService _navigationService = locator<NavigationService>();
  final SnackBarService _snackBarService = locator<SnackBarService>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController descriptionController = TextEditingController();

  late final int profileId;

  List<File> images = [];
  bool loading = false;

  init(int profileId) {
    this.profileId = profileId;
  }

  Future<void> pickImages() async {
    if (loading) return;
    loading = true;
    return ImagePicker()
        .pickMultiImage()
        .then((pickedImages) => pickedImages.map((e) => File(e.path)))
        .then((pickedFiles) {
      images.addAll(pickedFiles);
      loading = false;
      notifyListeners();
    }).onError((error, stackTrace) {
      loading = false;
    });
  }

  void unSelectImage(int index) {
    images.removeAt(index);
    notifyListeners();
  }

  Future<void> send() async {
    bool valid = true;
    if (!formKey.currentState!.validate()) {
      valid = false;
    }
    if (images.isEmpty) {
      _snackBarService.showErrorSnackBar(
        'Please select at least one image',
      );
      valid = false;
    }
    if (!valid) return;
    showLoadingDialog();
    final imagesBase64 = images
        .map((e) => base64Encode(
              e.readAsBytesSync(),
            ))
        .toList();

    try {
      await _repository.sendAnalyzes(SendAnalyzesRequest(
        userId: profileId,
        images: imagesBase64,
        description: descriptionController.text,
      ));
      dismissLoadingDialog();
      _snackBarService.showSuccessSnackBar(
        'Your analyzes sent successfully',
      );
      _navigationService.popUntil(
        (route) => route.settings.name == Routes.landing,
      );
    } on ErrorHandler catch (e) {
      dismissLoadingDialog();
      _snackBarService.showErrorSnackBar(
        e.failure.message,
      );
    }
  }
}
