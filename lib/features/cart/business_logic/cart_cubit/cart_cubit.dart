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
    final data = await _cartRepository.getCart(token: token!);
    data.fold((error) {
      emit(CartFailure(error.errorMessage));
    }, (cart) {
      emit(CartLoaded(cart));
    });
  }

  Future<void> addOrRemoveCartWithProductId({required num productId}) async {
    emit(CartLoading());
    String? token = await AppSecureStorage.instance.getToken();
    final data = await _cartRepository.addOrRemoveCartWithProductId(
        token: token!, productId: productId);
    data.fold((error) {
      emit(CartFailure(error.errorMessage));
    }, (message) {
      emit(CartProductAddedOrDeleted(message));
    });
    getCart();
  }

  Future<void> updateCart(
      {required num productId,
      required num quantity,
      required num cartId}) async {
    emit(CartLoading());
    String? token = await AppSecureStorage.instance.getToken();
    final data = await _cartRepository.updateCart(
        token: token!,
        productId: productId,
        quantity: quantity,
        cartId: cartId);
    data.fold((error) {
      emit(CartFailure(error.errorMessage));
    }, (message) {
      emit(CartUpdated(message));
    });
    getCart();
  }
}
