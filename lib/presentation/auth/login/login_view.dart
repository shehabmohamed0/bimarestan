import 'package:bimarestan/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/resources/color_manager.dart';
import '../../../shared/app_elevated_button.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 280.h,
              color: ColorManager.primary,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 56.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 94.h),
                  Text(
                    'Email address',
                    style: TextStyle(fontSize: 18.sp),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      hintText: 'Type your email',
                    ),
                  ),
                  SizedBox(height: 28.h),
                  Text(
                    'Email address',
                    style: TextStyle(fontSize: 18.sp),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      hintText: 'Type your password',
                    ),
                  ),
                  SizedBox(height: 60.h),
                  AppElevatedButton(
                    height: 60.h,
                    onPressed: () {},
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 26.sp),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: EdgeInsets.all(4),
                      child: Text(
                        'Forgot password?',
                        style: TextStyle(fontSize: 18.sp),
                      ),
                    ),
                  ),
                  SizedBox(height: 35.h),
                  Row(
                    children: [
                      Text('don\'t have an account?'),
                      SizedBox(width: 8),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(Routes.signup);
                        },
                        child: Padding(
                          padding: EdgeInsets.all(4),
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              fontSize: 26.sp,
                              color: ColorManager.primary,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
