part of 'product_cubit.dart';

@immutable
abstract class ProductState {}

class ProductInitial extends ProductState {}
class ProductsLoading extends ProductState {}
class ProductsLoaded extends ProductState {
  final List<Product>products;

  ProductsLoaded(this.products);
}
