import 'package:bimarestan/core/resources/color_manager.dart';
import 'package:bimarestan/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchDepartmentView extends StatelessWidget {
  const SearchDepartmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        toolbarHeight: 74,
        title: TextField(
          autofocus: true,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Search specialty',
          ),
        ),
      ),
      body: GridView.builder(
        padding: EdgeInsets.symmetric(
          horizontal: 42.w,
          vertical: 24.h,
        ),
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: InkWell(
                customBorder: CircleBorder(),
                onTap: () {
                  Navigator.of(context).pushNamed(Routes.departmentDoctors);
                },
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorManager.card.withOpacity(0.15),
                  ),
                ),
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'Heart',
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
