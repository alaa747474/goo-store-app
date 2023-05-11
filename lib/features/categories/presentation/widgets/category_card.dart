import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:goo_store_app/core/constants/app_routes.dart';
import 'package:goo_store_app/features/categories/data/models/category.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.category});
  final ProductCategory category;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(
          context, AppRoutes.categoryProductsScreen,
          arguments: category),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.w),
        decoration: BoxDecoration(color: Theme.of(context).cardColor,borderRadius: BorderRadius.circular(10.r)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 1,
              child: Image.network(
                category.image!,
                fit: BoxFit.cover,
              ),
            ),
            Flexible(
              flex: 1,
              child: Center(child: Text(category.name!)),
            ),
          ],
        ),
      ),
    );
  }
}
