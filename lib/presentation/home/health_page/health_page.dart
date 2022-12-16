import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/resources/assets_manager.dart';
import 'health_card.dart';

class HealthPage extends StatelessWidget {
  const HealthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Health Care'),
         actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                ImageAssets.logo_white,
                height: 38,
              ),
            ],
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 42.w,
          vertical: 24.h,
        ),
        child: Column(
          children: [
            HealthCard(),
            SizedBox(height: 20.h),
            HealthCard(),
          ],
        ),
      ),
    );
  }
}
