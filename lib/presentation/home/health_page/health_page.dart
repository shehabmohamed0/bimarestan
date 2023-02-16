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
    return ChangeNotifierProvider<HealthViewModel>(
      //TODO: change patient id to dynamic
      create: (context) => locator()..getAllAppointmentsByPatientId(0),
      builder: (context, child) => Scaffold(
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
          child: Builder(builder: (context) {
            final appointmentState = context
                .select((HealthViewModel model) => model.appointmentState);
            final appointmentsHistory =
                context.read<HealthViewModel>().appointments;
            switch (appointmentState) {
              case ViewState.initial:

              case ViewState.loading:
                return const Center(
                  child: CircularProgressIndicator(),
                );

              case ViewState.error:
                return const Center(
                  child: Text('Error'),
                );
              case ViewState.success:
                return AnimationLimiter(
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
                      children: appointmentsHistory
                          .map(
                            (e) => Column(
                              children: [
                                //TODO : Passing appointment to HealthCard
                                const HealthCard(),
                                SizedBox(
                                  height: 20.h,
                                ),
                              ],
                            ),
                          )
                          .toList(),
                    ),
                  ),
                );
            }
          }),
        ),
      ),
    );
  }
}
