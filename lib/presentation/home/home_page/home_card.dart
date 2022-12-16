import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../shared/app_card.dart';
import '../../../shared/app_elevated_button.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({
    Key? key,
    required this.title,
    required this.description,
    required this.onPressed,
  }) : super(key: key);
  final String title;
  final String description;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: EdgeInsets.symmetric(
        horizontal: 24.w,
        vertical: 10.h,
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4.h),
                    Text(description)
                  ],
                ),
              ),
              SizedBox(width: 16.w),
              Container(
                width: 86.w,
                height: 86.w,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          AppElevatedButton(
            onPressed: onPressed,
            child: const Text('Book now'),
          )
        ],
      ),
    );
  }
}
