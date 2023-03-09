import 'package:bimarestan/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/resources/color_manager.dart';
import '../../../shared/app_card.dart';
import '../../../shared/app_elevated_button.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({
    Key? key,
    required this.title,
    required this.description,
    this.onPressed,
    required this.icon,
  }) : super(key: key);
  final String title;
  final String description;
  final IconData icon;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return AppCard(
      disabled: onPressed == null,
      padding: EdgeInsets.symmetric(
        horizontal: 18.w,
        vertical: 10.h,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4.h),
                    Text(description)
                  ],
                ),
              ),
              SizedBox(width: 16.w),
              Container(
                width: 42.w,
                height: 42.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: onPressed == null
                      ? context.colorScheme.onSurface.withOpacity(0.12)
                      : ColorManager.primary,
                ),
                child: Icon(
                  icon,
                  color: onPressed == null
                      ? context.colorScheme.onSurface.withOpacity(0.38)
                      : Colors.white,
                  size: 24.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          AppElevatedButton(
            onPressed: onPressed,
            child: onPressed == null
                ? const Text('Coming soon')
                : const Text('Book now'),
          )
        ],
      ),
    );
  }
}
