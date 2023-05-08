import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:goo_store_app/core/config/app_router.dart';
import 'package:goo_store_app/core/config/theme.dart';
import 'package:goo_store_app/core/service/service_locator.dart';
import 'package:goo_store_app/features/auth/data/repositories/auth_repository.dart';
import 'package:goo_store_app/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:goo_store_app/features/favorite/business_logic/favorite_cubit/favorite_cubit.dart';
import 'package:goo_store_app/features/favorite/data/repositories/favorite_repository.dart';

import 'package:goo_store_app/features/home/presentation/screens/home_screen.dart';
import 'package:goo_store_app/features/products/business_logic/product_cubit/product_cubit.dart';
import 'package:goo_store_app/features/products/data/repositories/product_repository.dart';
import 'package:goo_store_app/features/profile/business_logic/settings_cubit/setting_cubit.dart';
import 'features/auth/business_logic/auth_cubit/auth_cubit.dart';

void main() {
  setUpServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => SettingCubit()..getSavedTheme(),
            ),
            BlocProvider(
                create: (context) =>
                    AuthCubit(getIt.get<AuthRepository>())..getUserToken()),
                     BlocProvider(
              create: (context) => ProductCubit(getIt.get<ProductRepository>())..getAllproducts(),
            ),
             BlocProvider(
              create: (context) => FavoriteCubit(getIt.get<FavoriteRepository>())..getFavoriteList(),
            ),
          ],
          child: BlocBuilder<SettingCubit, SettingState>(
            builder: (context, state) {
              return MaterialApp(
                home: BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    if (state is UserTokenLoaded) {
                      return state.token != null
                          ? const HomeScreen()
                          : const SignUpScreen();
                    }
                    return const SignUpScreen();
                  },
                ),
                debugShowCheckedModeBanner: false,
                title: 'GOO STORE',
                theme: AppTheme.theme(
                    isDarkTheme: context.read<SettingCubit>().isDark),
                onGenerateRoute: AppRouter.generateRoute,
              );
            },
          ),
        );
      },
    );
  }
}
