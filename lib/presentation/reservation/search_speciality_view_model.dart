import 'dart:async';
import 'dart:developer';

import 'package:bimarestan/presentation/reservation/search_speciality_view.dart';
import 'package:bimarestan/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stream_transform/stream_transform.dart';

import '../../core/resources/assets_manager.dart';
import '../../locator/locator.dart';

@injectable
class SearchSpecialityViewModel extends ChangeNotifier {
  final _navigationService = locator<NavigationService>();
  final ScrollController scrollController = ScrollController();
  final GlobalKey builderKey = GlobalKey();
  final GlobalKey gridViewKey = GlobalKey();

  final StreamController<String> _streamController = StreamController();
  late final StreamSubscription _streamSubscription;
  late List<Widget> filteredWidgets;
  void init() {
    filteredWidgets = widgets;
    _streamSubscription = _streamController.stream
        .debounce(const Duration(milliseconds: 200))
        .listen((searchText) => searchSpeciality(searchText));
  }

  void searchSpeciality(String text) {
    if (text.isEmpty) {
      filteredWidgets = widgets;
      notifyListeners();
      return;
    }
    log(text);
    filteredWidgets = widgets.where((element) {
      log(element.name.toLowerCase());
      return element.name.toLowerCase().contains(text.trim().toLowerCase());
    }).toList();
    notifyListeners();
  }

  @override
  void dispose() {
    scrollController.dispose();
    _streamSubscription.cancel();
    _streamController.close();

    super.dispose();
  }

  void searchTextChanged(String text) {
    _streamController.add(text);
  }

  void navigateToSearchDoctorView(Speciality speciality) {
    _navigationService.navigateTo(Routes.departmentDoctors,
        arguments: speciality);
  }
}

var list = [
  Speciality('Anesthsiology', ImageAssets.anesthsiology),
  Speciality('Cardiology', ImageAssets.cardiology),
  Speciality('Colorectal Surgery', ImageAssets.colorectal_surgery),
  Speciality('Dental Health', ImageAssets.dental_health),
  Speciality('Dermatology', ImageAssets.dermatology),
  Speciality('Endocrinology', ImageAssets.endocrinology),
  Speciality('Gastroenterology', ImageAssets.gastroenterology),
  Speciality('geriatrics', ImageAssets.geriatrics),
  Speciality('Gynecology', ImageAssets.gynecology),
  Speciality('Hematology', ImageAssets.hematology),
  Speciality('Immunology', ImageAssets.immunology),
  Speciality('Intensive Care', ImageAssets.intensive_care),
  Speciality('Medical Genetics', ImageAssets.medical_genetics),
  Speciality('Nephrology', ImageAssets.nephrology),
  Speciality('Neurology', ImageAssets.neurology),
  Speciality('Neurosurgery', ImageAssets.neurosurgery),
  Speciality('Nuclear Medicine', ImageAssets.nuclear_medicine),
  Speciality('Obstetrics And Gynaecology', ImageAssets.obstetrics_and_gynaecology),
  Speciality('Occupational Medicine', ImageAssets.occupational_medicine),
  Speciality('Oncology', ImageAssets.oncology),
  Speciality('Ophthalmology', ImageAssets.ophthalmology),
  Speciality('Otorhinolaryngology', ImageAssets.otorhinolaryngology),
  Speciality('Pathology', ImageAssets.pathology),
  Speciality('Pediatrics', ImageAssets.pediatrics),
  Speciality('Physical Therapy', ImageAssets.physical_therapy),
  Speciality('Plastic Surgery', ImageAssets.plastic_surgery),
  Speciality('Psychiatry', ImageAssets.psychiatry),
  Speciality('Pulmonology', ImageAssets.pulmonology),
  Speciality('Radiology', ImageAssets.radiology),
  Speciality('Rheumatology', ImageAssets.rheumatology),
  Speciality('Urology', ImageAssets.urology),
  Speciality('Surgery', ImageAssets.surgery),
];

final widgets = list
    .map((e) => SpecialityGridWidget(
          key: Key(e.name),
          imagePath: e.image,
          name: e.name,
        ))
    .toList();
