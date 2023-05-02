import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:goo_store_app/core/config/app_router.dart';
import 'package:goo_store_app/core/config/theme.dart';
import 'package:goo_store_app/core/constants/app_routes.dart';
import 'package:goo_store_app/core/service/service_locator.dart';
import 'package:goo_store_app/features/home/business_logic/home_cubit/home_cubit.dart';

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
              create: (context) => HomeCubit(),
            ),
          ],
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'GOO STORE',
                theme: AppTheme.theme(isDarkTheme: context.read<HomeCubit>().isDark),
                onGenerateRoute: AppRouter.generateRoute,
                initialRoute: AppRoutes.homeScreen,
              );
            },
          ),
        );
      },
    );
  }
}
