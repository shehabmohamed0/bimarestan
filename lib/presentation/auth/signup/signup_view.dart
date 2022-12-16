import 'package:bimarestan/core/resources/assets_manager.dart';
import 'package:bimarestan/shared/app_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/resources/color_manager.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ColoredBox(
              color: ColorManager.primary,
              child: Container(
                height: 270.h,
                color: ColorManager.primary,
                child: Image.asset(
                  ImageAssets.logo_white,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 48.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16.h),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      alignLabelWithHint: true,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      alignLabelWithHint: true,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      alignLabelWithHint: true,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Birth date',
                      alignLabelWithHint: true,
                      suffixIcon: Icon(Icons.calendar_today),
                    ),
                  ),
                  SizedBox(height: 4.h),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Country Region',
                      alignLabelWithHint: true,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'State',
                      alignLabelWithHint: true,
                    ),
                  ),
                  SizedBox(height: 32.h),
                  AppElevatedButton(
                    height: 60.h,
                    child: Text(
                      'Create account',
                      style: TextStyle(fontSize: 20.sp),
                    ),
                    onPressed: () {},
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
