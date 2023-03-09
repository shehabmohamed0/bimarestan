import 'dart:developer';

import 'package:bimarestan/core/services/snack_bar_service.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../core/resources/color_manager.dart';
import '../../core/state_management/view_state.dart';
import '../../locator/locator.dart';
import '../../models/clinics/clinic.dart';
import '../../shared/app_elevated_button.dart';
import '../../shared/loading_widget.dart';
import '../../shared/something_went_wrong_widget.dart';
import '../auth/app/app_model.dart';
import '../prices/price.dart';
import 'appointment_booking_view_model.dart';

part 'components/appointment_times_component.dart';
part 'components/days_calendar_component.dart';
part 'components/clinic_price_component.dart';

class AppointmentBookingView extends StatelessWidget {
  const AppointmentBookingView({super.key});

  @override
  Widget build(BuildContext context) {
    final profile = context.read<AppModel>().profile;
    final clinic = ModalRoute.of(context)!.settings.arguments;

    // log(clinic.id.toString());
    // log(clinic.doctorId.toString());
    // log(clinic..toString());
    // log(context.read<AppModel>().profile!.id.toString());

    return ChangeNotifierProvider<AppointmentViewModel>(
      create: (context) => locator()
        ..init(
          clinic,
          profile!,
        ),
      builder: (context, child) => Scaffold(
        appBar: AppBar(
          title: const Text('Appointment'),
        ),
        body: Selector<AppointmentViewModel, Tuple2<ViewState, DateTime?>>(
          selector: (context, model) => Tuple2(
            model.viewState,
            model.selectedAppointmentDate,
          ),
          shouldRebuild: (previous, next) => previous.value1 != next.value1,
          builder: (context, tuple, child) {
            switch (tuple.value1) {
              case ViewState.initial:
              case ViewState.loading:
                return const LoadingWidget();
              case ViewState.error:
                return SomethingWentWrongWidget(onTap: () {
                  context.read<AppointmentViewModel>().init(
                        clinic,
                        profile!,
                      );
                });
              case ViewState.success:
                final model = context.read<AppointmentViewModel>();
                return SingleChildScrollView(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 24.w, vertical: 15.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 60.r,
                          child: const Text(
                            'Photo',
                          ),
                        ),
                        Text(
                          model.clinic.doctorName,
                        ),
                        Text(
                          model.clinic.doctorJobTitle,
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Day',
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 8.h),
                        const _DaysCalenderComponent(),
                        SizedBox(height: 14.h),
                        Row(
                          children: [
                            Text(
                              'Time',
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 8.h),
                            Selector<AppointmentViewModel, ViewState>(
                              selector: (context, model) =>
                                  model.dayTimesViewState,
                              builder: (context, viewState, child) {
                                if (viewState == ViewState.loading) {
                                  return const SizedBox(
                                    width: 10,
                                    height: 10,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                    ),
                                  );
                                } else if (viewState == ViewState.error) {
                                  return const Icon(
                                    Icons.error,
                                    size: 20,
                                    color: Colors.red,
                                  );
                                }
                                return const SizedBox();
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: double.infinity,
                          child: _AppointmentTimesComponent(),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        const _ClinicPriceComponent(),
                        SizedBox(
                          height: 30.h,
                        ),
                        AppElevatedButton(
                          height: 60.h,
                          onPressed: () => context
                              .read<AppointmentViewModel>()
                              .bookAppointment(context),
                          child: Text(
                            'Book Appointment',
                            style: TextStyle(fontSize: 18.sp),
                          ),
                        ),
                      ],
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
