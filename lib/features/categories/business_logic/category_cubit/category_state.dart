

part of 'category_cubit.dart';

@immutable

abstract class CategoryState {}

class CategoryInitial extends CategoryState {}
class CategoriesLoading extends CategoryState {}
class CategoriesLoaded extends CategoryState {
  final List<ProductCategory>categories;

  CategoriesLoaded(this.categories);
}
class CategoryProdcutsLoaded extends CategoryState {
  final List<Product>categoryProducts;
  CategoryProdcutsLoaded(this.categoryProducts);
}
class CategoryFailure extends CategoryState {
  final String error;

  CategoryFailure(this.error);
}