import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goo_store_app/core/constants/app_routes.dart';
import 'package:goo_store_app/core/service/service_locator.dart';
import 'package:goo_store_app/features/auth/business_logic/auth_cubit/auth_cubit.dart';
import 'package:goo_store_app/features/auth/data/repositories/auth_repository.dart';
import 'package:goo_store_app/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:goo_store_app/features/categories/business_logic/category_cubit/category_cubit.dart';
import 'package:goo_store_app/features/categories/data/models/category.dart';
import 'package:goo_store_app/features/categories/data/repositories/category_repository.dart';
import 'package:goo_store_app/features/categories/presentation/screens/category_products_screen.dart';
import 'package:goo_store_app/features/home/data/repositories/home_repository.dart';
import 'package:goo_store_app/features/home/presentation/screens/home_screen.dart';
import 'package:goo_store_app/features/payment/presentation/screens/card_screen.dart';
import 'package:goo_store_app/features/payment/presentation/screens/check_out_screen.dart';
import 'package:goo_store_app/features/products/data/models/product.dart';
import 'package:goo_store_app/features/products/presentation/screens/product_details_screen.dart';
import 'package:goo_store_app/features/products/presentation/screens/products_screen.dart';

import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/home/business_logic/home_cubit/home_cubit.dart';

class AppRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.signUpScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => AuthCubit(getIt.get<AuthRepository>()),
            child: const SignUpScreen(),
          ),
        );
      case AppRoutes.logInScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => AuthCubit(getIt.get<AuthRepository>()),
            child: const LoginScreen(),
          ),
        );
      case AppRoutes.homeScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => HomeCubit(getIt.get<HomeRepository>()),
                  child: const HomeScreen(),
                ));
      case AppRoutes.categoryProductsScreen:
        final category = settings.arguments as ProductCategory;
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: CategoryCubit(getIt.get<CategoryRepository>())
                    ..getCustomCategoryProducts(categoryId: category.id!),
                  child: CategoryProductsScreen(
                    category: category,
                  ),
                ));

      case AppRoutes.productDetailsScreen:
        final product = settings.arguments as Product;
        return MaterialPageRoute(
            builder: (_) => ProductDetailsScreen(product: product));

      case AppRoutes.checkoutScreen:
      final total=settings.arguments as num;
      return MaterialPageRoute(builder: (_)=> CheckoutScreen(totalAmount: total,));
      case AppRoutes.cardScreen:
      final finalToken=settings.arguments as String;
      return MaterialPageRoute(builder: (_)=>  CardScreen(finalToken: finalToken,));
      case AppRoutes.productScreen:
      return MaterialPageRoute(builder: (_)=> const ProductsScreen());
    }
    return null;
  }
}
