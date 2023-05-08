import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:goo_store_app/core/widgets/custom_app_bar.dart';
import 'package:goo_store_app/core/widgets/erorr_text.dart';
import 'package:goo_store_app/core/widgets/loading_indicator.dart';
import 'package:goo_store_app/features/products/business_logic/product_cubit/product_cubit.dart';

import 'package:goo_store_app/features/products/presentation/widgets/products_grid_view.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  CustomAppBar(text: 'Products',onPressed: ()=>Navigator.pop(context),),
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state is ProductsLoading) {
            return const LoadingIndicator();
          }
          if (state is ProductsLoaded) {
            return Padding(
              padding: EdgeInsets.all(5.h),
              child: ProductsGridView(products: state.products),
            );
          }
          return const ErrorText();
        },
      ),
    );
  }
}
