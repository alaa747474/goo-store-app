import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:goo_store_app/features/products/data/models/product.dart';
import 'package:goo_store_app/features/products/presentation/widgets/discount_container.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Column(
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
                        image: NetworkImage(product.images![0]),
                        fit: BoxFit.cover)),
              ),
            ),
            DiscountContainer(discount: product.discount!),
            Positioned(
                left: 130.w,
                height: 350.h,
                child: FloatingActionButton.small(
                  onPressed: () {},
                  backgroundColor: Theme.of(context).cardColor,
                  child: Icon(
                    Icons.favorite_border_outlined,
                    color: Theme.of(context).hintColor,
                  ),
                ))
          ],
        ),
        Padding(
          padding: EdgeInsets.only(right: 30.w),
          child: Text(
            product.name!,
            maxLines: 2,
            textAlign: TextAlign.start,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Text('${product.price}\$')
      ],
    );
  }
}
