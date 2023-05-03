import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductImageInCard extends StatelessWidget {
  const ProductImageInCard({
    Key? key,
    required this.image,
  }) : super(key: key);
  final String image;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: 100.h,
                maxWidth: 110.w,
                minHeight: 90.h
              ),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.r),
                      bottomLeft: Radius.circular(10.r)
                    ),
                    image: DecorationImage(
                        image: NetworkImage(image),fit: BoxFit.cover)),
              ),
            );
  }
}
