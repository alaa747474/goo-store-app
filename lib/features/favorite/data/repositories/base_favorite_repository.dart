import 'package:goo_store_app/features/favorite/data/models/favorite.dart';

abstract class BaseFavoriteRepository {
  Future<Favorite> getFavoriteList({required String token});
  Future<void> addOrDeleteFavoriteWithProductId({required String token,required num productId});
  Future<void> deleteFavoritList({required num favoriteListId});
}
