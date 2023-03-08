import 'package:bimarestan/models/appointments/appointment.dart';
import 'package:bimarestan/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../shared/app_card.dart';
import '../../../shared/app_elevated_button.dart';

class HealthCard extends StatelessWidget {
  const HealthCard({
    super.key,
    required this.appointment,
  });
  final Appointment appointment;
  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: EdgeInsets.symmetric(
        vertical: 16.h,
        horizontal: 16.w,
      ),
      child: Column(
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
                    appointment.clinicName ?? 'clinic name',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 16.sp),
                  ),
                  Text(
                    appointment.clinicAddress ?? 'clinic address',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 16.sp),
                  ),
                  Text(
                    '${DateFormat('yyyy-MM-dd').format(appointment.appointmentDate)} ${DateFormat('H:mm a').format(
                      convertdoubleToTime(appointment.time),
                    )}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 16.sp),
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: 8.h),
          AppElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(
                Routes.appointment,
                arguments: appointment.clinicId,
              );
            },
            child: const Text('Book again'),
          )
        ],
      ),
    );
  }
}

DateTime convertdoubleToTime(double time) {
  final fraction = time % 1;
  final hour = time.toInt();
  final minute = (fraction * 100).toInt();

  return DateTime(0, 0, 0, hour, minute);
}
