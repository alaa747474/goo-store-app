import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goo_store_app/core/service/service_locator.dart';
import 'package:goo_store_app/core/widgets/loading_indicator.dart';
import 'package:goo_store_app/features/categories/business_logic/category_cubit/category_cubit.dart';
import 'package:goo_store_app/features/categories/data/repositories/category_repository.dart';
import 'package:goo_store_app/features/categories/presentation/widgets/category_grid_view.dart';
import 'package:goo_store_app/features/products/business_logic/product_cubit/product_cubit.dart';
import 'package:goo_store_app/features/products/data/models/product.dart';
import 'package:goo_store_app/features/products/data/repositories/product_repository.dart';
import 'package:goo_store_app/features/products/presentation/widgets/products_grid_view.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CategoryCubit(getIt.get<CategoryRepository>())
            ..getAllCategories(),
        ),
        BlocProvider(
          create: (context) =>
              ProductCubit(getIt.get<ProductRepository>())..getAllproducts(),
        ),
      ],
      child: Scaffold(
          body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          BlocBuilder<CategoryCubit, CategoryState>(
            builder: (context, state) {
              if (state is CategoriesLoading) {
                return const LoadingIndicator();
              }
              if (state is CategoriesLoaded) {
                return CategoryGridView(categories: state.categories);
              }
              return Container();
            },
          ),
          Text(
            'Sale',
            style: Theme.of(context).textTheme.labelLarge,
          ),
          Text(
            'Supper summer sale',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          BlocBuilder<ProductCubit, ProductState>(
            builder: (context, state) {
              if (state is ProductsLoading) {
                return const LoadingIndicator();
              }
              if (state is ProductsLoaded) {
                List<Product>saleProducts=(state.products
                              .where((element) => element.discount != 0))
                          .toList();
                return ProductsGridView(products: saleProducts,);
              }
              return Container();
            },
          )
        ],
      )),
    );
  }
}
