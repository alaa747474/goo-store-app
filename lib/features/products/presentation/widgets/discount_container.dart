import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DiscountContainer extends StatelessWidget {
  const DiscountContainer({super.key, required this.discount});
  final num discount;
  @override
  Widget build(BuildContext context) {
    return discount==0?const SizedBox(): Container(
      margin: EdgeInsets.all(8.r),
      width: 45.w,
      height: 25.h,
      decoration: BoxDecoration(
          color: Colors.red, borderRadius: BorderRadius.circular(20.r)),
      child: Center(
        child: Text('-$discount%',style: const TextStyle(color: Colors.white),),
      ),
    );
  }
}
