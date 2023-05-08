import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PriceRow extends StatelessWidget {
  const PriceRow({Key? key, required this.text, required this.price})
      : super(key: key);
  final num price;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).hintColor,fontSize: 18.sp),
        ),
        Text('$price \$', style: Theme.of(context).textTheme.bodyLarge)
      ],
    );
  }
}
