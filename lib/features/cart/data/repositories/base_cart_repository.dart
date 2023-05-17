
import 'package:dartz/dartz.dart';
import 'package:goo_store_app/core/errors/failures.dart';
import 'package:goo_store_app/features/cart/data/models/cart.dart';

abstract class BaseCartRepository {
    Future<Either<Failure,Cart>>getCart({required String token});
    Future<Either<Failure,String>>addOrRemoveCartWithProductId({required String token ,required num productId});
    Future<Either<Failure,String>>updateCart({required String token,required num productId,required num quantity,required num cartId});
}