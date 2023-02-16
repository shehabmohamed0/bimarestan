import 'package:bimarestan/core/resources/color_manager.dart';
import 'package:bimarestan/core/utils/media_query_values.dart';
import 'package:bimarestan/locator/locator.dart';
import 'package:bimarestan/models/clinics/clinic.dart';
import 'package:bimarestan/presentation/appointment/appointment_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../shared/app_elevated_button.dart';

class AppointmentBookingView extends StatefulWidget {
  const AppointmentBookingView({super.key});

  @override
  State<AppointmentBookingView> createState() => _AppointmentBookingViewState();
}

class _AppointmentBookingViewState extends State<AppointmentBookingView> {
  @override
  Widget build(BuildContext context) {
    // final clinic = ModalRoute.of(context)!.settings.arguments as Clinic;
    final clinic = Clinic(
      id: 0,
      name: 'name',
      address: 'address',
      phone: '01060',
      email: 'email',
      description: 'description',
      days: [0, 1, 2, 3, 4, 5, 6],
      startWork: 10,
      endWork: 16,
      doctorId: 10,
      doctorName: 'doctorName',
      doctorJobTitle: 'doctorJobTitle',
      doctorPhone: '01060',
      doctorDescription: 'doctorDescription',
    );

    return ChangeNotifierProvider<AppointmentViewModel>(
      create: (context) => locator(),
      builder: (context, child) => Scaffold(
        appBar: AppBar(
          title: const Text('Appointment'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
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
                  clinic.doctorName,
                ),
                Text(
                  clinic.doctorJobTitle,
                ),
                SizedBox(
                  height: 30.h,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Select day',
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Builder(
                  builder: (context) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 30.w),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: TableCalendar(
                        headerStyle: const HeaderStyle(
                          formatButtonVisible: false,
                          titleCentered: true,
                        ),
                        calendarStyle: CalendarStyle(
                          tablePadding: EdgeInsets.symmetric(horizontal: 10.w),
                        ),
                        firstDay: DateTime.utc(2023, 2, 15),
                        lastDay: DateTime.utc(2023, 3, 14),
                        focusedDay: context
                            .watch<AppointmentViewModel>()
                            .selectedAppointmentDay,
                        calendarFormat: CalendarFormat.week,
                        rowHeight: 40.h,
                        selectedDayPredicate: (day) {
                          return isSameDay(
                              context
                                  .read<AppointmentViewModel>()
                                  .selectedAppointmentDay,
                              day);
                        },
                        onDaySelected: (selectedDay, focusedDay) => context
                            .read<AppointmentViewModel>()
                            .setSelectedAppointmentDay(selectedDay),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 10.h,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Time',
                  ),
                ),
                AppointmentTimes(clinic: clinic),
                SizedBox(
                  height: 15.h,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Booking salary: 90 \$',
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                AppElevatedButton(
                  height: 60.h,
                  onPressed: () {
                    //TODO: book appointment
                  },
                  child: Text(
                    'Book Appointment',
                    style: TextStyle(fontSize: 20.sp),
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

class AppointmentTimes extends StatelessWidget {
  const AppointmentTimes({
    super.key,
    required this.clinic,
  });

  final Clinic clinic;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final selectedDate = context.select<AppointmentViewModel, DateTime?>(
            (value) => value.selectedAppointmentDate);

        return Wrap(
          children: getWorkingHours(clinic)
              .map(
                (e) => Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 4.w, 0),
                  child: RawChip(
                    showCheckmark: false,
                    selectedColor: ColorManager.primary.withOpacity(0.5),
                    selected: selectedDate == e,
                    onSelected: (_) => context
                        .read<AppointmentViewModel>()
                        .setSelectedAppointmentDate(e),
                    label: Text(
                      format(e),
                    ),
                  ),
                ),
              )
              .toList(),
        );
      },
    );
  }
}
