import 'package:dio/dio.dart';
import 'package:goo_store_app/core/constants/end_points.dart';
import 'package:goo_store_app/core/service/dio_helper.dart';
import 'package:goo_store_app/features/favorite/data/models/favorite.dart';
import 'package:goo_store_app/features/favorite/data/repositories/base_favorite_repository.dart';

class FavoriteRepository implements BaseFavoriteRepository {
  final DioHelper _dioHelper;

  FavoriteRepository(this._dioHelper);
  @override
  Future<Favorite> getFavoriteList({required String token}) async {
    Response response = await _dioHelper.getData(
        endPoint: AppEndPoints.favorites, token: token,);

    return Favorite.fromJson(response.data);
  }

  @override
  Future<void> addOrDeleteFavoriteWithProductId(
      {required String token, required num productId}) async {
    await _dioHelper.postData(
      token: token,
      endPoint: AppEndPoints.favorites,
      data: {'product_id': productId},
    );
  }

  @override
  Future<void> deleteFavoritList({required num favoriteListId}) async {
    await _dioHelper.deleteData(
        endPoint: '${AppEndPoints.favorites}/$favoriteListId');
  }
}
