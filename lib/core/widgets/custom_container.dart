import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key,required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 100.h, minHeight: 80.h),
      child: Container(
          margin: EdgeInsets.only(bottom: 5.h, right: 10.w, left: 10.w),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: Theme.of(context).cardColor),
          child: child),
    );
  }
}
