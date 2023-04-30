import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:goo_store_app/features/categories/data/models/category.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.category});
  final ProductCategory category;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(color: Colors.white,image: DecorationImage(image: NetworkImage(category.image!))),
      child: Stack(
        children: [
          Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Theme.of(context).primaryColor.withOpacity(0.3),
                Colors.black.withOpacity(0.6),
              ],
            ))),
          Align(alignment: Alignment.bottomCenter,child: Padding(
            padding:  EdgeInsets.only(bottom: 15.h),
            child: Text(category.name!.toUpperCase(),textAlign: TextAlign.center,style: Theme.of(context).textTheme.labelMedium,),
          )),
        ],
      ),
    );
  }
}
