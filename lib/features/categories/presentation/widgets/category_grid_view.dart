import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
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
      padding: EdgeInsets.symmetric(horizontal: 5.w,vertical: 10.h),
      gridDelegate: SliverQuiltedGridDelegate(
        crossAxisCount: 4,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        repeatPattern: QuiltedGridRepeatPattern.inverted,
        pattern: const [
          QuiltedGridTile(4, 4),
          QuiltedGridTile(2, 2),
          QuiltedGridTile(2, 2),
        ],
      ),
      childrenDelegate: SliverChildBuilderDelegate((context, index) {
        return CategoryCard(category: categories[index]);
      }, childCount: categories.length),
    );
  }
}
