import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goo_store_app/core/constants/app_routes.dart';
import 'package:goo_store_app/core/service/service_locator.dart';
import 'package:goo_store_app/features/auth/business_logic/auth_cubit/auth_cubit.dart';
import 'package:goo_store_app/features/auth/data/repositories/auth_repository.dart';
import 'package:goo_store_app/features/auth/presentation/screens/sign_up_screen.dart';

import '../../features/auth/presentation/screens/login_screen.dart';

class AppRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.signUpScreen:
        return MaterialPageRoute(
          builder: (context) =>  BlocProvider(
            create: (context) => AuthCubit(getIt.get<AuthRepository>()),
            child:const SignUpScreen(),
          ),
        );
      case AppRoutes.logInScreen:
        return MaterialPageRoute(
          builder: (context) =>  BlocProvider(
            create: (context) => AuthCubit(getIt.get<AuthRepository>()),
            child:const LoginScreen(),
          ),
        );
    }
    return null;
  }
}
