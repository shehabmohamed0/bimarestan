import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

import '../../../core/resources/assets_manager.dart';
import '../../../core/state_management/view_state.dart';
import '../../../shared/loading_widget.dart';
import '../../../shared/something_went_wrong_widget.dart';
import '../../auth/app/app_model.dart';
import 'health_card.dart';
import 'health_care_page_model.dart';

class HealthCarePage extends StatelessWidget {
  const HealthCarePage({super.key});

  @override
  Widget build(BuildContext context) {
    final profile = context.read<AppModel>().profile;
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
        child: Consumer<HealthCarePageModel>(
          builder: (context, model, _) {
            final appointmentsHistory =
                context.read<HealthCarePageModel>().appointments;
            switch (model.appointmentState) {
              case ViewState.initial:

              case ViewState.loading:
                return const LoadingWidget();

              case ViewState.error:
                return SomethingWentWrongWidget(onTap: () {
                  context.read<HealthCarePageModel>().init(profile!.id);
                });
              case ViewState.success:
                if (model.appointments.isEmpty) {
                  return Center(
                    child: Text(
                      'No appointments yet',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  );
                }

                return AnimationLimiter(
                  child: ListView.builder(
                    itemCount: appointmentsHistory.length,
                    itemBuilder: (context, index) {
                      return AnimationConfiguration.staggeredList(
                        position: index,
                        duration: const Duration(milliseconds: 1000),
                        child: SlideAnimation(
                          horizontalOffset: 50,
                          child: FadeInAnimation(
                            duration: const Duration(milliseconds: 1000),
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 12.h),
                              child: HealthCard(
                                appointment: appointmentsHistory[index],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
            }
          },
        ),
      ),
    );
  }
}
