
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goo_store_app/core/widgets/erorr_text.dart';
import 'package:goo_store_app/core/widgets/loading_indicator.dart';
import 'package:goo_store_app/features/categories/data/models/category.dart';
import 'package:goo_store_app/features/products/presentation/widgets/products_grid_view.dart';

import '../../business_logic/category_cubit/category_cubit.dart';

class CategoryProductsScreen extends StatelessWidget {
  const CategoryProductsScreen({super.key, required this.category});
  final ProductCategory category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).cardColor,
        title: Text(category.name!),
        centerTitle: true,
      ),
      body: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          if (state is CategoryProdcutsLoaded) {
            return ProductsGridView(products: state.categoryProducts);
          }
          if (state is CategoriesLoading) {
            return const LoadingIndicator();
          }
          return const ErrorText();
        },
      )
    );
  }
}