import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:goo_store_app/core/widgets/custom_container.dart';
import 'package:goo_store_app/core/widgets/product_image_in_card.dart';
import 'package:goo_store_app/features/cart/data/models/cart_items.dart';
import 'package:goo_store_app/features/cart/presentation/widgets/cart_quantity_button.dart';


class CartItemCard extends StatelessWidget {
  const CartItemCard({super.key, required this.cartItems});
  final CartItems cartItems;
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ProductImageInCard(image: cartItems.product!.image!),
          SizedBox(
            width: 8.w,
          ),
          Flexible(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    cartItems.product!.name!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                  ),
                  CartQuantityButton(
                    cartItem: cartItems,)
                ],
              ),
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(minWidth: 90.w,maxHeight: 60.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: (){
                
                }, icon: Icon(Icons.clear,color: Theme.of(context).hintColor,)),
                Text('${cartItems.product!.price}\$',style: Theme.of(context).textTheme.titleLarge,)
              ],
            ),
          )
        ],
      ),
    );
  }
}
