

part of 'category_cubit.dart';

@immutable

abstract class CategoryState {}

class CategoryInitial extends CategoryState {}
class CategoriesLoading extends CategoryState {}
class CategoriesLoaded extends CategoryState {
  final List<ProductCategory>categories;

  CategoriesLoaded(this.categories);
}
