
import 'package:goo_store_app/features/cart/data/models/cart.dart';

abstract class BaseCartRepository {
    Future<Cart>getCart({required String token});
    Future<String>addOrRemoveCartWithProductId({required String token ,required num productId});
    Future<void>updateCart({required String token,required num productId,required num quantity,required num cartId});
}