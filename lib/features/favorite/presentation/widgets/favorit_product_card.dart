import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:goo_store_app/core/widgets/custom_container.dart';
import 'package:goo_store_app/core/widgets/product_image_in_card.dart';
import 'package:goo_store_app/features/favorite/business_logic/favorite_cubit/favorite_cubit.dart';

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
    return CustomContainer(
        child: Row(
      children: [
        ProductImageInCard(image: favoriteProduct.image!),
        SizedBox(
          width: 8.w,
        ),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
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
        IconButton(
            onPressed: () {
              context.read<FavoriteCubit>().addOrDeleteFavoriteWithProductId(
                  productId: favoriteProduct.id!);
            },
            icon: Icon(
              Icons.clear,
              color: Theme.of(context).dividerColor,
            ))
      ],
    ));
  }
}
