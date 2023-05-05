

import 'package:bloc/bloc.dart';
import 'package:goo_store_app/core/cache/app_secure_storage.dart';
import 'package:goo_store_app/features/cart/data/models/cart.dart';
import 'package:goo_store_app/features/cart/data/repositories/cart_repository.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this._cartRepository) : super(CartInitial());
  final CartRepository _cartRepository;
  Future<void> getCart() async {
    emit(CartLoading());
    String? token = await AppSecureStorage.instance.getToken();
    _cartRepository.getCart(token: token!).then((cart) {
      emit(CartLoaded(cart));
    }).catchError((error){
      emit(CartFailure(error));
    });
  }
  Future<void>addOrRemoveCartWithProductId({required num productId})async{
    emit(CartLoading());
    String? token = await AppSecureStorage.instance.getToken();
    _cartRepository.addOrRemoveCartWithProductId(token: token!, productId: productId).then((value) {
      emit(CartProductAddedOrDeleted(value));
    });
    getCart();
  }
  Future<void>updateCart({required num productId,required num quantity,required num cartId})async{
    emit(CartLoading());
    String? token = await AppSecureStorage.instance.getToken();
    _cartRepository.updateCart(token: token!, productId: productId, quantity: quantity, cartId: cartId).then((value) {
      emit(CartUpdated());
       getCart();
    });
  }
}
