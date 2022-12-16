import 'package:bimarestan/presentation/home/health_page/health_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 42.w,
          vertical: 24.h,
        ),
        children: [
          HealthCard(),
          SizedBox(height: 20.h),
          HealthCard(),
          SizedBox(height: 20.h),
          HealthCard(),
          SizedBox(height: 20.h),
          HealthCard(),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
