import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:goo_store_app/core/widgets/custom_button.dart';
import 'package:goo_store_app/features/products/data/models/product.dart';
import 'package:goo_store_app/features/products/presentation/widgets/favorite_button.dart';
import 'package:goo_store_app/features/products/presentation/widgets/old_new_price_row.dart';
import 'package:goo_store_app/features/products/presentation/widgets/product_images_list_view.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({
    Key? key,
    required this.product,
  }) : super(key: key);
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).cardColor,
        title: Text(
          product.name!,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          ProductImagesListView(images: product.images!),
          Padding(
            padding: EdgeInsets.only(
                top: 5.h, left: 10.w, right: 10.w, bottom: 70.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                        child: Text(
                      product.name!,
                      style: Theme.of(context).textTheme.titleLarge,
                      softWrap: true,
                    )),
                    FavoriteButton(onPressed: () {})
                  ],
                ),
                OldNewPriceRow(
                    oldPrice: product.oldPrice.toString(),
                    newPrice: product.price.toString(),
                    discount: product.discount!),
                SizedBox(
                  height: 3.h,
                ),
                Text(
                  product.description!,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          )
        ],
      ),
      bottomSheet: Container(
        height: 60.h,
        decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.r),
                topRight: Radius.circular(10.r))),
        child: Padding(
          padding: EdgeInsets.all(10.r),
          child: Center(
              child: CustomButton(onPressed: () {}, text: 'Add to cart')),
        ),
      ),
    );
  }
}
