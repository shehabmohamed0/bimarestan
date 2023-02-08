import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:stream_transform/stream_transform.dart';

import '../../models/specialities/speciality.dart';
import 'search_speciality_view.dart';

@injectable
class SearchSpecialityViewModel extends ChangeNotifier {
  final ScrollController scrollController = ScrollController();
  final GlobalKey builderKey = GlobalKey();
  final GlobalKey gridViewKey = GlobalKey();

  final StreamController<String> _streamController = StreamController();
  late final StreamSubscription _streamSubscription;

  List<SpecialityGridWidget> widgets = [];
  List<Widget> filteredWidgets = [];

  Future<void> init(
    List<Speciality> specialities,
    Function(Speciality speciality) onTap,
  ) async {
    _streamSubscription = _streamController.stream
        .debounce(const Duration(milliseconds: 300))
        .listen((searchText) {
      searchSpeciality(searchText);
    });
    widgets = _buildWidgets(specialities, onTap);
    filteredWidgets = widgets;
  }

  List<SpecialityGridWidget> _buildWidgets(
    List<Speciality> s,
    Function(Speciality speciality) onTap,
  ) {
    return s
        .map((e) => SpecialityGridWidget(
              key: Key(e.name),
              imagePath: e.image,
              name: e.name,
              onTap: () => onTap(e),
            ))
        .toList();
  }

  void searchSpeciality(String text) {
    if (text.isEmpty) {
      filteredWidgets = widgets;
      notifyListeners();
      return;
    }
    filteredWidgets = widgets
        .where((element) => element.name.toLowerCase().contains(
              text.trim().toLowerCase(),
            ))
        .toList();
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
}
