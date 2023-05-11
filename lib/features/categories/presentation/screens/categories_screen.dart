import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:goo_store_app/core/service/service_locator.dart';
import 'package:goo_store_app/core/widgets/custom_app_bar.dart';
import 'package:goo_store_app/core/widgets/loading_indicator.dart';
import 'package:goo_store_app/features/categories/business_logic/category_cubit/category_cubit.dart';
import 'package:goo_store_app/features/categories/data/repositories/category_repository.dart';
import 'package:goo_store_app/features/categories/presentation/widgets/category_grid_view.dart';
import 'package:goo_store_app/features/products/business_logic/product_cubit/product_cubit.dart';
import 'package:goo_store_app/features/products/data/repositories/product_repository.dart';

import '../../../../core/widgets/erorr_text.dart';

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
        appBar:const CustomAppBar(text: 'Categories'),
          body: ListView(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
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
              return const ErrorText();
            },
          )
        ],
      )),
    );
  }
}
