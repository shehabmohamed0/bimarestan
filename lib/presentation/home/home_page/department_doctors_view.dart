import 'package:bimarestan/presentation/home/health_page/health_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class DepartmentDoctorsView extends StatelessWidget {
  const DepartmentDoctorsView({super.key});

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
            hintText: 'Governate',
          ),
        ),
      ),
      body: AnimationLimiter(
        child: ListView.separated(
          padding: EdgeInsets.symmetric(
            horizontal: 42.w,
            vertical: 24.h,
          ),
          itemCount: 4,
          itemBuilder: (context, index) => AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 1000),
            child: SlideAnimation(
              verticalOffset: -50.0,
              delay: Duration(milliseconds: 100 * index),
              child: FadeInAnimation(
                duration: const Duration(milliseconds: 1000),
                child: HealthCard(),
              ),
            ),
          ),
          separatorBuilder: (context, index) => SizedBox(height: 20.h),
        ),
      ),
    );
  }
}
