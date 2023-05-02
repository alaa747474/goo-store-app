import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:goo_store_app/features/favorite/data/models/favorite_product.dart';
import 'package:goo_store_app/features/products/presentation/widgets/old_new_price_row.dart';

class FavoriteProductCard extends StatelessWidget {
  const FavoriteProductCard({
    Key? key,
    required this.favoriteProduct,
  }) : super(key: key);
  final FavoriteProduct favoriteProduct;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 100.h, minHeight: 80.h),
      child: Container(
        margin: EdgeInsets.only(bottom: 5.h, right: 10.w, left: 10.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: Theme.of(context).cardColor),
        child: Row(
          children: [
            Image.network(favoriteProduct.image!),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    favoriteProduct.name!,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                  ),
                  OldNewPriceRow(
                      oldPrice: favoriteProduct.oldPrice.toString(),
                      newPrice: favoriteProduct.price.toString(),
                      discount: favoriteProduct.discount!),
                ],
              ),
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.clear))
          ],
        ),
      ),
    );
  }
}
