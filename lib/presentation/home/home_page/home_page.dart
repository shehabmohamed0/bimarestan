import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../core/resources/assets_manager.dart';
import '../../../router/routes.dart';
import 'home_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        title: const Text('Home'),
      ),
      body: SingleChildScrollView(
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
                verticalOffset: -50.0,
                child: FadeInAnimation(
                  duration: const Duration(milliseconds: 1000),
                  child: widget,
                ),
              ),
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 20.h),
                  child: HomeCard(
                    title: 'Visit Doctor',
                    description:
                        'Book your doctor and enjoy excellent medical service',
                    icon: Icons.person_2_rounded,
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        Routes.specialities,
                        arguments: Routes.specialitiesDoctors,
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20.h),
                  child: HomeCard(
                    title: 'Radiological analyzes',
                    description: 'Send your tests to your doctor from home',
                    // radiology icon flutter
                    icon: Icons.radio_button_checked_rounded,
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        Routes.specialities,
                        arguments: Routes.specialitiesRadiology,
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20.h),
                  child: const HomeCard(
                    title: 'Surgery booking',
                    description: 'Book your operation and enjoy special offers',
                    // surgery icon
                    icon: Icons.medical_services_rounded,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
