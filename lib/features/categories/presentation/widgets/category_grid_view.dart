import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:goo_store_app/features/categories/data/models/category.dart';
import 'package:goo_store_app/features/categories/presentation/widgets/category_card.dart';

class CategoryGridView extends StatelessWidget {
  const CategoryGridView({super.key, required this.categories});
  final List<ProductCategory> categories;
  @override
  Widget build(BuildContext context) {
    return GridView.custom(
      shrinkWrap: true,
      physics:const ScrollPhysics(),
      padding: EdgeInsets.symmetric(vertical: 10.h),
      gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(mainAxisExtent: 150.r,crossAxisCount: 1,childAspectRatio: 2.5,mainAxisSpacing: 10.h,),
      childrenDelegate: SliverChildBuilderDelegate((context, index) {
        return CategoryCard(category: categories[index]);
      }, childCount: categories.length),
    );
  }
}
