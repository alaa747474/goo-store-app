import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:goo_store_app/core/widgets/custom_app_bar.dart';
import 'package:goo_store_app/core/widgets/custom_button.dart';
import 'package:goo_store_app/core/widgets/loading_indicator.dart';
import 'package:goo_store_app/features/home/business_logic/home_cubit/home_cubit.dart';
import 'package:goo_store_app/features/home/presentation/screens/home_screen.dart';
import 'package:goo_store_app/features/products/data/models/product.dart';
import 'package:goo_store_app/features/products/presentation/widgets/favorite_button.dart';
import 'package:goo_store_app/features/products/presentation/widgets/old_new_price_row.dart';
import 'package:goo_store_app/features/products/presentation/widgets/product_images_list_view.dart';

import '../../../../core/service/service_locator.dart';
import '../../../cart/business_logic/cart_cubit/cart_cubit.dart';
import '../../../cart/data/repositories/cart_repository.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({
    Key? key,
    required this.product,
  }) : super(key: key);
  final Product product;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(getIt.get<CartRepository>()),
      child: Scaffold(
        appBar: CustomAppBar(
          text: product.name!,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        body: Hero(
          tag: product.id!,
          child: ListView(
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
                        FavoriteButton(
                            inFavorites: product.inFavorites!, onPressed: () {})
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
                child: BlocConsumer<CartCubit, CartState>(
              listener: (context, state) {
                if (state is CartProductAddedOrDeleted) {
                  context.read<HomeCubit>().selectedIndex = 2;
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const HomeScreen()));
                }
              },
              builder: (context, state) {
                if (state is CartLoading) {
                  return const LoadingIndicator();
                }
                return CustomButton(
                    onPressed: () {
                      context
                          .read<CartCubit>()
                          .addOrRemoveCartWithProductId(productId: product.id!);
                    },
                    text: 'Add to cart');
              },
            )),
          ),
        ),
      ),
    );
  }
}
