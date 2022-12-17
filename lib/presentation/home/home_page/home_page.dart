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
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              color: Colors.white,
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
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
      drawer: const Drawer(),
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
                HomeCard(
                  title: 'Visit Doctor',
                  description:
                      'Book your doctor and enjoy excellent medical service',
                  onPressed: () {
                    Navigator.of(context).pushNamed(Routes.departments);
                  },
                ),
                SizedBox(height: 36.h),
                HomeCard(
                  title: 'Surgery booking',
                  description: 'Book your operation and enjoy special offers',
                  onPressed: () {},
                ),
                SizedBox(height: 36.h),
                HomeCard(
                  title: 'Radiological analyzes',
                  description: 'Send your tests to your doctor from home',
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
