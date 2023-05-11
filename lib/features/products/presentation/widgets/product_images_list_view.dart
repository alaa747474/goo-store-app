import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductImagesListView extends StatelessWidget {
  const ProductImagesListView({super.key, required this.images});
 final List<String>images;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
            height: 250.h,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              shrinkWrap: false,
              itemCount: images.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.only(right: 2.w),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: 300.w,
                    ),
                    child: Image.network(
                      images[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          );
  }
}