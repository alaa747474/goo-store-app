import 'package:dio/dio.dart';
import 'package:goo_store_app/core/constants/end_points.dart';
import 'package:goo_store_app/core/service/dio_helper.dart';
import 'package:goo_store_app/features/cart/data/models/cart.dart';
import 'package:goo_store_app/features/cart/data/repositories/base_cart_repository.dart';

class CartRepository implements BaseCartRepository {
  final DioHelper _dioHelper;

  CartRepository(this._dioHelper);

  @override
  Future<String> addOrRemoveCartWithProductId(
      {required String token, required num productId})async {
        Response response =await _dioHelper.postData(endPoint: AppEndPoints.carts,data: {'product_id':productId},token: token,);
        return response.data['message'];
      }

  @override
  Future<Cart> getCart({required String token}) async {
    Response response = await _dioHelper.getData(endPoint: AppEndPoints.carts,token: token);
    return Cart.fromJson(response.data);
  }

  @override
  Future<void> updateCart(
      {required String token,
      required num productId,
      required num quantity,
      required num cartId})async {
 await _dioHelper.putData(endPoint: '${AppEndPoints.carts}/$cartId',token: token,data: {
  'product_id': productId,
    'quantity': quantity
 });
  }
}
