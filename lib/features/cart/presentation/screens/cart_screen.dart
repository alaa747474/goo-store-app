import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:goo_store_app/core/constants/app_routes.dart';
import 'package:goo_store_app/core/widgets/custom_app_bar.dart';
import 'package:goo_store_app/core/widgets/erorr_text.dart';
import 'package:goo_store_app/core/widgets/loading_indicator.dart';
import 'package:goo_store_app/features/cart/business_logic/cart_cubit/cart_cubit.dart';
import 'package:goo_store_app/features/cart/presentation/widgets/cart_item_card.dart';
import 'package:goo_store_app/features/cart/presentation/widgets/price_row.dart';

import '../../../../core/widgets/custom_button.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: const CustomAppBar(text: 'Cart'),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return const LoadingIndicator();
          }
          if (state is CartLoaded) {
            return ListView(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.only(bottom: 5.h, top: 5.h),
                  physics: const BouncingScrollPhysics(),
                  itemCount: state.cart.data!.cartItems!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CartItemCard(
                        cartItems: state.cart.data!.cartItems![index]);
                  },
                ),
                Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 15.h),
          child: BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              if (state is CartLoaded) {
                return Column(
                  children: [
                    PriceRow(text: 'Total',price: state.cart.data!.total!),
                    PriceRow(text: 'Sub Total',price: state.cart.data!.subTotal!),
                    SizedBox(height: 5.h,),
                    CustomButton(
                      onPressed: () {
                    Navigator.pushNamed(
                        context, AppRoutes.checkoutScreen,arguments: state.cart.data!.total);
                      },
                      text: 'Check out',
                    ),
                  ],
                );
              }
              return const LoadingIndicator();
            },
          ),
                )
              ],
            );
          }
          if (state is CartFailure) {
            return ErrorText(
              text: state.error,
            );
          }
          return const ErrorText();
        },
      ),
    );
  }
}


