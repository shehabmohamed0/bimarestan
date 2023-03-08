import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reorderable_grid_view/widgets/reorderable_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../core/resources/color_manager.dart';
import '../../core/state_management/view_state.dart';
import '../../locator/locator.dart';
import '../../shared/loading_widget.dart';
import '../../shared/something_went_wrong_widget.dart';
import 'search_speciality_view_model.dart';
import 'specialities_model.dart';

part 'widgets/speciality_grid_widget.dart';

class SearchSpecialtyView extends StatefulWidget {
  const SearchSpecialtyView({super.key});

  @override
  State<SearchSpecialtyView> createState() => _SearchSpecialtyViewState();
}

class _SearchSpecialtyViewState extends State<SearchSpecialtyView> {
  @override
  Widget build(BuildContext context) {
    final route = ModalRoute.of(context)!.settings.arguments as String;
    return Consumer<SpecialitiesModel>(
      builder: (context, model, _) {
        switch (model.viewState) {
          case ViewState.initial:
          case ViewState.loading:
            return const Center(child: LoadingAnimation());
          case ViewState.error:
            return SomethingWentWrongWidget(onTap: () {});
          case ViewState.success:
            return ChangeNotifierProvider(
              create: (context) => locator<SearchSpecialityViewModel>()
                ..init(
                  model.specialities,
                  (speciality) => Navigator.of(context).pushNamed(
                    route,
                    arguments: speciality,
                  ),
                ),
              child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  surfaceTintColor: ColorManager.primary,
                  foregroundColor: Colors.black,
                  toolbarHeight: 74,
                  title: Builder(
                    builder: (context) => TextField(
                      enabled: model.viewState.isSuccess,
                      onChanged: context
                          .read<SearchSpecialityViewModel>()
                          .searchTextChanged,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search specialty',
                      ),
                    ),
                  ),
                ),
                body: Consumer<SearchSpecialityViewModel>(
                  builder: (context, model, _) {
                    return ReorderableBuilder(
                      key: model.builderKey,
                      enableDraggable: false,
                      enableScrollingWhileDragging: false,
                      enableLongPress: false,
                      scrollController: model.scrollController,
                      children: model.filteredWidgets,
                      builder: (children) {
                        if (children.isEmpty) {
                          return const Center(
                            child: Text('No result found'),
                          );
                        }
                        return GridView(
                          key: model.gridViewKey,
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 16.h,
                          ),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 8.w,
                            mainAxisSpacing: 8.h,
                          ),
                          children: children,
                        );
                      },
                    );
                  },
                ),
              ),
            );
        }
      },
    );
  }
}
