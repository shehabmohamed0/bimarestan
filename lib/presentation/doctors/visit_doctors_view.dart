import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

import '../../core/state_management/view_state.dart';
import '../../models/profiles/profile.dart';
import '../../models/specialities/speciality.dart';
import '../../router/routes.dart';
import '../../shared/app_card.dart';
import '../../shared/app_elevated_button.dart';
import '../../shared/loading_widget.dart';
import '../../shared/something_went_wrong_widget.dart';
import '../auth/app/app_model.dart';
import 'visit_doctors_view_model.dart';

class VisitDoctorsView extends StatelessWidget {
  const VisitDoctorsView({super.key});

  @override
  Widget build(BuildContext context) {
    final speciality = ModalRoute.of(context)!.settings.arguments as Speciality;
    final address = context.read<AppModel>().profile!.address;
    return ChangeNotifierProvider<VisitDoctorsViewModel>(
      create: (context) => VisitDoctorsViewModel()..init(address, speciality),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Visit Doctors'),
          leading: const BackButton(
            color: Colors.white,
          ),
        ),
        body: Consumer<VisitDoctorsViewModel>(
          builder: (context, model, _) {
            switch (model.viewState) {
              case ViewState.initial:
              case ViewState.loading:
                return const Center(child: LoadingAnimation());
              case ViewState.error:
                return SomethingWentWrongWidget(
                  onTap: () => model.init(address, speciality),
                );
              case ViewState.success:
                if (model.doctors.isEmpty) {
                  return const Center(
                    child: Text('No doctors found'),
                  );
                }
                return AnimationLimiter(
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(
                      horizontal: 42.w,
                      vertical: 24.h,
                    ),
                    itemCount: model.doctors.length,
                    itemBuilder: (context, index) =>
                        AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 1000),
                      child: SlideAnimation(
                        verticalOffset: -50.0,
                        delay: Duration(milliseconds: 100 * index),
                        child: FadeInAnimation(
                          duration: const Duration(milliseconds: 1000),
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 20.h),
                            child: HealthCard(
                              profile: model.doctors[index],
                              onPressed: () {
                                Navigator.of(context).pushNamed(
                                  Routes.clinics,
                                  arguments: model.doctors[index].id,
                                );
                              },
                              buttonText: 'Book Appointment',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
            }
          },
        ),
      ),
    );
  }
}

class HealthCard extends StatelessWidget {
  const HealthCard({
    super.key,
    required this.profile,
    required this.onPressed,
    required this.buttonText,
  });
  final Profile profile;
  final VoidCallback onPressed;
  final String buttonText;
  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: EdgeInsets.symmetric(
        vertical: 16.h,
        horizontal: 16.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 78.w,
                height: 78.h,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: 8.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    profile.fullName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 16.sp),
                  ),
                  Text(
                    profile.jobTitle!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 16.sp),
                  ),
                  // Text(
                  //   'has a 15 years of experience',
                  //   maxLines: 1,
                  //   overflow: TextOverflow.ellipsis,
                  //   style: TextStyle(fontSize: 16.sp),
                  // ),
                ],
              )
            ],
          ),
          SizedBox(height: 16.h),
          Text(
            profile.description,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Colors.black54),
          ),
          SizedBox(height: 8.h),
          AppElevatedButton(
            onPressed: onPressed,
            child: Text(buttonText),
          )
        ],
      ),
    );
  }
}
