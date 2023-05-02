import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:goo_store_app/features/products/data/models/product.dart';
import 'package:goo_store_app/features/products/presentation/widgets/product_card.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({super.key, required this.products,});
  final List<Product>products;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
                  padding: EdgeInsets.only(top: 5.h),
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount:products.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ProductCard(product: products[index]);
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 10.r,
                    mainAxisSpacing: 10.r,
                    crossAxisCount: 2,
                    mainAxisExtent: 270.r
                  ),
                );
  }
}