import 'package:bimarestan/core/resources/color_manager.dart';
import 'package:bimarestan/locator/locator.dart';
import 'package:bimarestan/models/appointments/appointment.dart';
import 'package:bimarestan/presentation/appointment/appointment_booking_view_model.dart';
import 'package:bimarestan/presentation/appointment/appointment_details_view_model.dart';
import 'package:bimarestan/shared/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

import '../../core/state_management/view_state.dart';

class AppointmentDetailsView extends StatelessWidget {
  const AppointmentDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final appointment =
        ModalRoute.of(context)!.settings.arguments as Appointment;
    return ChangeNotifierProvider<AppointmentDetailsViewModel>(
      create: (context) => locator()..init(appointment: appointment),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Appointments Details'),
        ),
        body: Consumer<AppointmentDetailsViewModel>(
          builder: (context, model, child) {
            switch (model.viewState) {
              case ViewState.initial:
              case ViewState.loading:
                return const LoadingWidget();
              case ViewState.error:
                return const Center(
                  child: Text('Error'),
                );
              case ViewState.success:
                final now = DateTime.now();
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AnimationLimiter(
                    child: ListView.builder(
                      itemCount: model.clinicTimes.length,
                      itemBuilder: (context, index) {
                        final userTime =
                            convertDoubleToDate(appointment.time).copyWith(
                          year: appointment.appointmentDate.year,
                          month: appointment.appointmentDate.month,
                          day: appointment.appointmentDate.day,
                        );
                        final currentAppointmentTime = model.clinicTimes[index];
                        final isReserved = model.reservedTimes
                            .contains(currentAppointmentTime);
                        final isPassed = currentAppointmentTime.isBefore(now);
                        final isUserAppointment =
                            userTime == currentAppointmentTime;
                        final bool isCheckingNow = now.isAfter(userTime) &&
                            now.isBefore(currentAppointmentTime);
                        return AnimationConfiguration.staggeredList(
                          position: index,
                          duration: const Duration(milliseconds: 1000),
                          child: SlideAnimation(
                            verticalOffset: 50,
                            child: FadeInAnimation(
                              duration: const Duration(milliseconds: 1000),
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: AppointmentListTile(
                                  index: index,
                                  isUserAppointment: isUserAppointment,
                                  isPassed: isPassed,
                                  currentAppointmentTime:
                                      currentAppointmentTime,
                                  isCheckingNow: isCheckingNow,
                                  isReserved: isReserved,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
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

class AppointmentListTile extends StatelessWidget {
  const AppointmentListTile({
    super.key,
    required this.index,
    required this.isUserAppointment,
    required this.isPassed,
    required this.currentAppointmentTime,
    required this.isCheckingNow,
    required this.isReserved,
  });
  final int index;
  final bool isUserAppointment;
  final bool isPassed;
  final DateTime currentAppointmentTime;
  final bool isCheckingNow;
  final bool isReserved;

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Colors.white,
      color: _getCardColor(isUserAppointment, isPassed),
      elevation: isUserAppointment ? 3 : 1,
      child: SizedBox(
        height: 60,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 16.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${index + 1}',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: 4),
                  if (isUserAppointment)
                    Text(
                      'Your appointment',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    formatTime(currentAppointmentTime),
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: 4),
                  if (isPassed)
                    Text(
                      'Passed',
                      style: TextStyle(
                        color: Colors.red.shade900,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  else if (isCheckingNow)
                    Text(
                      'In check',
                      style: TextStyle(
                        color: isUserAppointment ? Colors.amber : Colors.green,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  else
                    Text(
                      isReserved ? 'Waiting' : 'Available',
                      style: TextStyle(
                        color: isReserved ? Colors.black87 : Colors.blue,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Color? _getCardColor(bool isUserAppointment, bool isPassed) {
  if (isPassed) {
    return Colors.grey.shade300;
  } else if (isUserAppointment) {
    return ColorManager.primary;
  } else {
    return null;
  }
}

String formatTime(DateTime time) {
  final hour = time.hour;
  final minute = time.minute;
  final isPm = hour >= 12;
  final hour12 = hour % 12;
  final hour12String = hour12 == 0 ? '12' : hour12.toString();
  final minuteString = minute < 10 ? '0$minute' : minute.toString();
  final amPm = isPm ? 'PM' : 'AM';
  return '$hour12String:$minuteString $amPm';
}
