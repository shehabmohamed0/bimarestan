import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reorderable_grid_view/widgets/reorderable_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../core/resources/color_manager.dart';
import '../../locator/locator.dart';
import 'search_speciality_view_model.dart';

class SearchSpecialtyView extends StatelessWidget {
  const SearchSpecialtyView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SearchSpecialityViewModel>(
      create: (context) => locator<SearchSpecialityViewModel>()..init(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          surfaceTintColor: ColorManager.primary,
          foregroundColor: Colors.black,
          toolbarHeight: 74,
          elevation: 8,
          title: Builder(
            builder: (context) => TextField(
              autofocus: true,
              onChanged:
                  context.read<SearchSpecialityViewModel>().searchTextChanged,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Search specialty',
              ),
            ),
          ),
        ),
        body: Consumer<SearchSpecialityViewModel>(
          builder: (context, model, _) => ReorderableBuilder(
            key: model.builderKey,
            enableDraggable: false,
            enableScrollingWhileDragging: false,
            enableLongPress: false,
            scrollController: model.scrollController,
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
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8.w,
                  mainAxisSpacing: 8.h,
                ),
                children: children,
              );
            },
            children: model.filteredWidgets,
          ),
        ),
      ),
    );
  }
}

class SpecialityGridWidget extends StatelessWidget {
  const SpecialityGridWidget({
    Key? key,
    required this.imagePath,
    required this.name,
  }) : super(key: key);
  final String name;
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: () {
          // Navigator.of(context).pushNamed(Routes.departmentDoctors);
        },
        child: Padding(
          padding: EdgeInsets.all(8.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(imagePath),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8.h),
              Flexible(
                child: AutoSizeText(
                  name,
                  maxLines: 2,
                  wrapWords: false,
                  minFontSize: 8,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Speciality {
  final String name;
  final String image;

  Speciality(this.name, this.image);
}
