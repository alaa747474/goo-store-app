import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goo_store_app/core/cache/app_secure_storage.dart';
import 'package:goo_store_app/features/cart/presentation/screens/cart_screen.dart';
import 'package:goo_store_app/features/categories/presentation/screens/categories_screen.dart';
import 'package:goo_store_app/features/favorite/presentation/screens/favorite_screen.dart';
import 'package:goo_store_app/features/home/data/models/home_data.dart';
import 'package:goo_store_app/features/home/data/repositories/home_repository.dart';
import 'package:goo_store_app/features/home/presentation/screens/home_data_screen.dart';
import 'package:goo_store_app/features/profile/business_logic/profile_cubit/profile_cubit.dart';
import 'package:goo_store_app/features/profile/data/repositories/profile_repository.dart';
import 'package:meta/meta.dart';
import '../../../../core/service/service_locator.dart';
import '../../../cart/business_logic/cart_cubit/cart_cubit.dart';
import '../../../cart/data/repositories/cart_repository.dart';
import '../../../profile/presentation/screens/profile_screen.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._homeRepository) : super(HomeInitial());
  final HomeRepository _homeRepository;
  int selectedIndex = 0;
  List screens = [
    const HomeDataScreen(),
    const CategoriesScreen(),
    BlocProvider(
      create:(_)=> CartCubit(getIt.get<CartRepository>())..getCart(),
      child: const CartScreen(),
    ),
    const FavoriteScreen(),
    BlocProvider.value(
      value: ProfileCubit(getIt.get<ProfileRepository>())..getUserProfile(),
      child: const ProfileScreen(),
    )
  ];

  void changeIndex(int index) {
    selectedIndex = index;
    emit(ChangeBottomNavIndex(selectedIndex));
  }

  void getHomeData() async{
    emit(HomeLoading());
    try {
      String?token=await AppSecureStorage.instance.getToken();
      _homeRepository.getHomeData(token: token!).then((value) {
        emit(HomeDataLoaded(value));
      });
    } catch (e) {
      emit(HomeFailur(e.toString()));
    }
  }
}
