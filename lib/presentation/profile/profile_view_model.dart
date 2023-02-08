import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../core/apis/error_handler.dart';
import '../../core/services/snack_bar_service.dart';
import '../../core/utils/dialogs.dart';
import '../../data/auth/auth_service.dart';
import '../../data/profiles/profiles_repository.dart';
import '../../locator/locator.dart';
import '../../models/profiles/profile.dart';
import '../../models/profiles/update_profile_request.dart';
import '../auth/signup/signup_view.dart';

@injectable
class ProfileViewModel extends ChangeNotifier {
  final AuthService _authService = locator<AuthService>();

  final ProfilesRepository _profilesRepository = locator<ProfilesRepository>();
  final NavigationService _navigationService = locator<NavigationService>();
  final SnackBarService _snackBarService = locator<SnackBarService>();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController phone = TextEditingController();
  // final TextEditingController address = TextEditingController();
  final TextEditingController age = TextEditingController();
  final TextEditingController description = TextEditingController();

  PhoneNumber? phoneNumber;
  bool validPhoneNumber = false;
  late Profile profile;
  Governate? selectedGovernate;

  Future<void> init(Profile profile) async {
    this.profile = profile;
    name.text = profile.fullName;
    email.text = profile.email;
    selectedGovernate = Governate(id: 0, name: profile.address);
    age.text = profile.age.toString();
    description.text = profile.description;
    phoneNumber = await _preparePhone(profile);
    notifyListeners();
  }

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    password.dispose();
    phone.dispose();
    // address.dispose();
    age.dispose();
    description.dispose();

    super.dispose();
  }

  Future<PhoneNumber> _preparePhone(Profile profile) async {
    try {
      return await PhoneNumber.getRegionInfoFromPhoneNumber(
        profile.phone,
      );
    } catch (e) {
      phone.text = profile.phone;
      return PhoneNumber(phoneNumber: profile.phone, isoCode: 'EGY');
    }
  }

  void phoneNumberChanged(PhoneNumber phoneNumber) {
    this.phoneNumber = phoneNumber;

    final validPhoneNumber = (phoneNumber.phoneNumber!.startsWith('+2015') ||
            phoneNumber.phoneNumber!.startsWith('+2010') ||
            phoneNumber.phoneNumber!.startsWith('+2011') ||
            phoneNumber.phoneNumber!.startsWith('+2012')) &&
        phoneNumber.phoneNumber!.length == 13;

    this.validPhoneNumber = validPhoneNumber;
    notifyListeners();
  }

  Future<void> submit() async {
    if (formKey.currentState!.validate()) {
      try {
        showLoadingDialog();
        final updateProfile = await _profilesRepository.updateProfile(
          UpdateProfileRequest(
            id: profile.id,
            fullName: name.text.trim(),
            email: email.text.trim(),
            password: password.text,
            phone: phoneNumber!.phoneNumber!,
            age: int.parse(age.text),
            address: selectedGovernate!.name,
            description: description.text,
          ),
        );
        _authService.profileChanged(updateProfile);
        dismissLoadingDialog();
        _navigationService.back();
        _snackBarService.showSuccessSnackBar('Email created successfully');
      } on ErrorHandler catch (e) {
        dismissLoadingDialog();
        _snackBarService.showErrorSnackBar(e.failure.message);
      }
    }
  }

  void governateChanged(Governate? value) {
    if (value != null) {
      selectedGovernate = value;
      notifyListeners();
    }
  }
}
