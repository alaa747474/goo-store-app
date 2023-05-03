import 'package:bloc/bloc.dart';
import 'package:goo_store_app/features/cart/presentation/screens/cart_screen.dart';
import 'package:goo_store_app/features/categories/presentation/screens/categories_screen.dart';
import 'package:goo_store_app/features/favorite/presentation/screens/favorite_screen.dart';
import 'package:goo_store_app/features/products/presentation/screens/products_screen.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  bool isDark = true;
  changeAAppTheme() {
    isDark = !isDark;
    emit(ChangeAppThemec());
  }

  int selectedIndex = 0;

  List screens = const [
    CategoriesScreen(),
    ProductsScreen(),
     CartScreen(),
    FavoriteScreen(),
    CategoriesScreen(),
  ];
  changeIndex(int index) {
    selectedIndex = index;
    emit(ChangeBottomNavIndex(selectedIndex));
  }
}
