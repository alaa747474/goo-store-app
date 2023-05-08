import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:goo_store_app/core/widgets/custom_app_bar.dart';
import 'package:goo_store_app/core/widgets/erorr_text.dart';
import 'package:goo_store_app/core/widgets/loading_indicator.dart';
import 'package:goo_store_app/features/favorite/business_logic/favorite_cubit/favorite_cubit.dart';
import 'package:goo_store_app/features/favorite/data/models/favorite.dart';
import 'package:goo_store_app/features/favorite/presentation/widgets/favorit_product_card.dart';


class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(text: 'Favorite'),
      body: BlocBuilder<FavoriteCubit, FavoriteState>(
        builder: (context, state) {
          if (state is FavoriteLoading) {
            return const LoadingIndicator();
          }
          if (state is FavoriteLoaded) {
            List<ProductData> favoriteProducts=state.favorite.data!.productsList!;
            return ListView.builder(
              padding: EdgeInsets.only(top: 5.h),
              itemCount: state.favorite.data!.productsList!.length,
              itemBuilder: (BuildContext context, int index) {
                return FavoriteProductCard(favoriteProduct: favoriteProducts[index].product!);
              },
            );
          }
          return const ErrorText();
        },
      ),
    );
  }
}
