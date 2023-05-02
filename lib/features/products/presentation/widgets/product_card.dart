import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:goo_store_app/core/constants/app_routes.dart';
import 'package:goo_store_app/features/products/data/models/product.dart';
import 'package:goo_store_app/features/products/presentation/widgets/discount_container.dart';
import 'package:goo_store_app/features/products/presentation/widgets/favorite_button.dart';
import 'package:goo_store_app/features/products/presentation/widgets/old_new_price_row.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, AppRoutes.productDetailsScreen,
          arguments: product),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 180.h, minHeight: 135.h),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      image: DecorationImage(
                          image: NetworkImage(product.image!),
                          fit: BoxFit.cover)),
                ),
              ),
              DiscountContainer(discount: product.discount!),
              Positioned(
                left: 130.w,
                height: 350.h,
                child: FavoriteButton(
                  onPressed: () {},
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(right: 30.w, top: 5.h, bottom: 5.h),
            child: Text(
              product.name!,
              maxLines: 2,
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          OldNewPriceRow(
              discount: product.discount!,
              oldPrice: product.discount == 0 ? '' : product.price.toString(),
              newPrice: product.oldPrice.toString())
        ],
      ),
    );
  }
}
