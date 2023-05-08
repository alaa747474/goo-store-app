import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:goo_store_app/features/home/data/models/home_data.dart';

class BannersGridView extends StatelessWidget {
  const BannersGridView({super.key, required this.banners});
  final List<Banners> banners;
  @override
  Widget build(BuildContext context) {
    return GridView.custom(
      shrinkWrap: true,
      physics:const ScrollPhysics(),
      padding: EdgeInsets.symmetric(vertical: 10.h),
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
        return Image.network(banners[index].image!,fit: BoxFit.cover,);
      }, childCount: banners.length),
    );
  }
}
