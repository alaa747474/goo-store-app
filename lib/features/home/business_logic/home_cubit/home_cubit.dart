import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goo_store_app/features/cart/presentation/screens/cart_screen.dart';
import 'package:goo_store_app/features/categories/presentation/screens/categories_screen.dart';
import 'package:goo_store_app/features/favorite/presentation/screens/favorite_screen.dart';
import 'package:goo_store_app/features/home/data/models/home_data.dart';
import 'package:goo_store_app/features/home/data/repositories/home_repository.dart';
import 'package:goo_store_app/features/home/presentation/screens/home_data_screen.dart';
import 'package:goo_store_app/features/products/presentation/screens/products_screen.dart';
import 'package:meta/meta.dart';

import '../../../../core/service/service_locator.dart';
import '../../../cart/business_logic/cart_cubit/cart_cubit.dart';
import '../../../cart/data/repositories/cart_repository.dart';
import '../../../favorite/business_logic/favorite_cubit/favorite_cubit.dart';
import '../../../favorite/data/repositories/favorite_repository.dart';
import '../../../products/business_logic/product_cubit/product_cubit.dart';
import '../../../products/data/repositories/product_repository.dart';
import '../../../profile/presentation/screens/profile_screen.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._homeRepository) : super(HomeInitial());
  final HomeRepository _homeRepository;
  int selectedIndex = 0;
  List screens = [
    HomeDataScreen(),
    BlocProvider.value(
      value: ProductCubit(getIt.get<ProductRepository>())..getAllproducts(),
      child: const ProductsScreen(),
    ),
    BlocProvider.value(
      value: CartCubit(getIt.get<CartRepository>())..getCart(),
      child: const CartScreen(),
    ),
    BlocProvider.value(
      value: FavoriteCubit(getIt.get<FavoriteRepository>())..getFavoriteList(),
      child: const FavoriteScreen(),
    ),
    const ProfileScreen()
  ];
  void changeIndex(int index) {
    selectedIndex = index;
    emit(ChangeBottomNavIndex(selectedIndex));
  }

  void getHomeData() {
    try {
      _homeRepository.getHomeData().then((value) {
        emit(HomeDataLoaded(value));
      });
    } catch (e) {
      emit(HomeFailur(e.toString()));
    }
  }
}
