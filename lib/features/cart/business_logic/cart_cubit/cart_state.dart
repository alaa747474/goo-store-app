part of 'cart_cubit.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final Cart cart;
  CartLoaded(this.cart);
}

class CartProductAddedOrDeleted extends CartState {
  final String message;
  CartProductAddedOrDeleted(this.message);
}
class CartUpdated extends CartState {
  final String message;
  CartUpdated(this.message);
}
class CartFailure extends CartState {
  final String error;

  CartFailure(this.error);
}