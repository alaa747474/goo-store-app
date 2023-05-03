import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goo_store_app/core/service/service_locator.dart';
import 'package:goo_store_app/core/widgets/custom_app_bar.dart';
import 'package:goo_store_app/core/widgets/erorr_text.dart';
import 'package:goo_store_app/core/widgets/loading_indicator.dart';
import 'package:goo_store_app/features/cart/business_logic/cart_cubit/cart_cubit.dart';
import 'package:goo_store_app/features/cart/data/repositories/cart_repository.dart';
import 'package:goo_store_app/features/cart/presentation/widgets/cart_item_card.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(getIt.get<CartRepository>())..getCart(),
      child: Scaffold(
        appBar: const CustomAppBar(text: 'Cart'),
        body: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            if (state is CartLoading) {
              return const LoadingIndicator();
            }
            if (state is CartLoaded) {
              return ListView.builder(
                itemCount: state.cart.data!.cartItems!.length,
                itemBuilder: (BuildContext context, int index) {
                  return CartItemCard(
                      cartItems: state.cart.data!.cartItems![index]);
                },
              );
            }
            return const ErrorText();
          },
        ),
      ),
    );
  }
}
