import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:goo_store_app/features/home/data/models/home_data.dart';

class BannersCarouselSlider extends StatelessWidget {
  const BannersCarouselSlider({super.key,required this.banners});
  final List<Banners>banners;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
  options: CarouselOptions(aspectRatio: 3/2,autoPlay: true,),
  items: banners.map((banner) {
    return Builder(
      builder: (BuildContext context) {
        return Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(horizontal: 5.0.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            image: DecorationImage(image: NetworkImage(banner.image!),fit: BoxFit.cover)
          ),
          child: Image.network(banner.image!),
        );
      },
    );
  }).toList(),
);
  }
}