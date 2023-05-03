import 'package:bloc/bloc.dart';
import 'package:goo_store_app/core/cache/app_secure_storage.dart';

import 'package:goo_store_app/features/favorite/data/models/favorite.dart';
import 'package:goo_store_app/features/favorite/data/repositories/favorite_repository.dart';

import 'package:meta/meta.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit(this._favoriteRepository) : super(FavoriteInitial());
  final FavoriteRepository _favoriteRepository;

  void getFavoriteList() async {
    emit(FavoriteLoading());
    String? token = await AppSecureStorage.instance.getToken();
    _favoriteRepository.getFavoriteList(token: token!).then((value) {
      emit(FavoriteLoaded(value));
    });
  }

  void addOrDeleteFavoriteWithProductId({required num productId}) async {
    emit(FavoriteLoading());
    String? token = await AppSecureStorage.instance.getToken();
    _favoriteRepository
        .addOrDeleteFavoriteWithProductId(token: token!, productId: productId)
        .then((value) {
      emit(FavoriteProductAddedOrDeleted());
      getFavoriteList();
    });
  }
}
