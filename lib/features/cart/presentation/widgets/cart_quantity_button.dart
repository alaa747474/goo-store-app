import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:goo_store_app/core/service/service_locator.dart';
import 'package:goo_store_app/features/cart/business_logic/cart_cubit/cart_cubit.dart';
import 'package:goo_store_app/features/cart/data/models/cart_items.dart';
import 'package:goo_store_app/features/cart/data/repositories/cart_repository.dart';

class CartQuantityButton extends StatelessWidget {
  const CartQuantityButton({super.key, required this.cartItem});

  final CartItems cartItem;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(getIt.get<CartRepository>()),
      child: ConstrainedBox(
        constraints: BoxConstraints(
            maxWidth: 130.w, minWidth: 115.w, maxHeight: 35.h, minHeight: 20.h),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        context.read<CartCubit>().updateCart(
                            productId: cartItem.product!.id!,
                            quantity: (cartItem.quantity! + 1),
                            cartId: cartItem.id!);
                      },
                      icon:
                          Icon(Icons.add, color: Theme.of(context).hintColor)),
                  Text(cartItem.quantity.toString(),
                      style: Theme.of(context).textTheme.bodyLarge),
                  IconButton(
                      onPressed: () {
                        context.read<CartCubit>().updateCart(
                            productId: cartItem.product!.id!,
                            quantity: (cartItem.quantity! - 1),
                            cartId: cartItem.id!);
                      },
                      icon: Icon(Icons.remove,
                          color: Theme.of(context).hintColor)),
                ]
          ),
        ),
      ),
    );
  }
}
