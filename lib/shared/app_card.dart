import 'package:bimarestan/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppCard extends StatelessWidget {
  const AppCard({
    super.key,
    this.padding,
    required this.child,
    this.disabled = false,
  });
  final EdgeInsetsGeometry? padding;
  final Widget child;
  final bool disabled;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ??
          EdgeInsets.symmetric(
            horizontal: 8.w,
            vertical: 10.h,
          ),
      decoration: BoxDecoration(
        color: disabled
            ? context.colorScheme.onSurface.withOpacity(0.12)
            : context.colorScheme.primary.withOpacity(0.12),
        borderRadius: BorderRadius.circular(16),
      ),
      child: child,
    );
  }
}
