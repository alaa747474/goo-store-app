import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:goo_store_app/core/service/dio_helper.dart';
import 'package:goo_store_app/features/auth/data/repositories/auth_repository.dart';
import 'package:goo_store_app/features/cart/data/repositories/cart_repository.dart';
import 'package:goo_store_app/features/categories/data/repositories/category_repository.dart';
import 'package:goo_store_app/features/favorite/data/repositories/favorite_repository.dart';
import 'package:goo_store_app/features/home/data/repositories/home_repository.dart';
import 'package:goo_store_app/features/payment/data/repositories/payment_repository.dart';
import 'package:goo_store_app/features/products/data/repositories/product_repository.dart';
import 'package:goo_store_app/features/profile/data/repositories/profile_repository.dart';

GetIt getIt = GetIt.instance;
setUpServiceLocator() {
  getIt.registerSingleton(DioHelper(dioSetUp()));
  getIt.registerSingleton(AuthRepository(getIt.get<DioHelper>()));
  getIt.registerSingleton(CategoryRepository(getIt.get<DioHelper>()));
  getIt.registerSingleton(ProductRepository(getIt.get<DioHelper>()));
  getIt.registerSingleton(FavoriteRepository(getIt.get<DioHelper>()));
  getIt.registerSingleton(CartRepository(getIt.get<DioHelper>()));
  getIt.registerSingleton(PaymentRepository(getIt.get<DioHelper>()));
  getIt.registerSingleton(HomeRepository(getIt.get<DioHelper>()));
  getIt.registerSingleton(ProfileRepository(getIt.get<DioHelper>()));
}

Dio dioSetUp() {
  Dio dio = Dio();
  dio
    ..options.connectTimeout = const Duration(seconds: 40)
    ..options.receiveTimeout = const Duration(seconds: 40)
    ..options.receiveDataWhenStatusError = true;
     dio.interceptors.add(LogInterceptor(
    responseBody: true,
    error: true,
    requestHeader: true,
    responseHeader: true,
    request: true,
    requestBody: false,
  ));
  return dio;
}
