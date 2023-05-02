

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
class CategoryFailToLoad extends CategoryState {
  final String text;

  CategoryFailToLoad(this.text);
}