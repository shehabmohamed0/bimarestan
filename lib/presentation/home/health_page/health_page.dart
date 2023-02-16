import 'package:bimarestan/locator/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

import '../../../core/resources/assets_manager.dart';
import '../../../core/state_management/view_state.dart';
import 'health_card.dart';
import 'health_view_model.dart';

class HealthPage extends StatelessWidget {
  const HealthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Health Care'),
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
        child: AnimationLimiter(
          child: Column(
            children: AnimationConfiguration.toStaggeredList(
              duration: const Duration(milliseconds: 1000),
              // delay: Duration(milliseconds: 100),
              childAnimationBuilder: (widget) => SlideAnimation(
                horizontalOffset: 50,
                child: FadeInAnimation(
                  duration: const Duration(milliseconds: 1000),
                  child: widget,
                ),
              ),
              children: [
                HealthCard(),
                SizedBox(height: 20.h),
                HealthCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
