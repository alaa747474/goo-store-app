import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OldNewPriceRow extends StatelessWidget {
  const OldNewPriceRow(
      {super.key,
      required this.oldPrice,
      required this.newPrice,
      required this.discount});
  final String? oldPrice;
  final String newPrice;
  final num discount;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$newPrice\$',
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: Colors.red),
        ),
        SizedBox(width: 5.h,),
        discount == 0
            ? const SizedBox()
            : Text(
                '$oldPrice\$',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.grey, decoration: TextDecoration.lineThrough),
              ),
      ],
    );
  }
}
