import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:goo_store_app/core/constants/end_points.dart';
import 'package:goo_store_app/core/errors/failures.dart';
import 'package:goo_store_app/core/errors/server_error.dart';
import 'package:goo_store_app/core/service/dio_helper.dart';
import 'package:goo_store_app/features/cart/data/models/cart.dart';
import 'package:goo_store_app/features/cart/data/repositories/base_cart_repository.dart';

class CartRepository implements BaseCartRepository {
  final DioHelper _dioHelper;

  CartRepository(this._dioHelper);

  @override
  Future<Either<Failure, String>> addOrRemoveCartWithProductId(
      {required String token, required num productId}) async {
    try {
      Response response = await _dioHelper.postData(
        endPoint: AppEndPoints.carts,
        data: {'product_id': productId},
        token: token,
      );
      return right(response.data['message']);
    } catch (e) {
      if (e is DioError) {
        return left(ServerError.fromDioError(e));
      }
      return left(ServerError(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Cart>> getCart({required String token}) async {
    try {
      Response response =
          await _dioHelper.getData(endPoint: AppEndPoints.carts, token: token);
      return right(Cart.fromJson(response.data));
    } catch (e) {
      if (e is DioError) {
        return left(ServerError.fromDioError(e));
      }
      return left(ServerError(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> updateCart(
      {required String token,
      required num productId,
      required num quantity,
      required num cartId}) async {
    try {
      Response response = await _dioHelper.putData(
          endPoint: '${AppEndPoints.carts}/$cartId',
          token: token,
          data: {'product_id': productId, 'quantity': quantity});
      return right(response.data['message']);
    } catch (e) {
      if (e is DioError) {
        return left(ServerError.fromDioError(e));
      }
      return left(ServerError(e.toString()));
    }
  }
}
