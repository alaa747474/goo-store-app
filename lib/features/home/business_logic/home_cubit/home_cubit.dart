import 'package:bloc/bloc.dart';
import 'package:goo_store_app/features/cart/presentation/screens/cart_screen.dart';
import 'package:goo_store_app/features/categories/presentation/screens/categories_screen.dart';
import 'package:goo_store_app/features/favorite/presentation/screens/favorite_screen.dart';
import 'package:goo_store_app/features/products/presentation/screens/products_screen.dart';
import 'package:meta/meta.dart';

import '../../../profile/presentation/screens/profile_screen.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  int selectedIndex = 0;

  List screens = const [
    CategoriesScreen(),
    ProductsScreen(),
     CartScreen(),
    FavoriteScreen(),
    ProfileScreen()
  ];
  changeIndex(int index) {
    selectedIndex = index;
    emit(ChangeBottomNavIndex(selectedIndex));
  }
}
