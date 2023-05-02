import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:goo_store_app/features/categories/data/models/category.dart';
import 'package:goo_store_app/features/products/data/models/product.dart';
import '../../data/repositories/category_repository.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this._categoryRepository) : super(CategoryInitial());
  final CategoryRepository _categoryRepository;
  void getAllCategories() {
    emit(CategoriesLoading());
    _categoryRepository.getAllCategories().then((categories) {
      emit(CategoriesLoaded(categories));
    });
  }

  void getCustomCategoryProducts({required int categoryId}) {
    emit(CategoriesLoading());
    _categoryRepository
        .getCustomCategoryProducts(categoryId: categoryId)
        .then((products) {
      emit(CategoryProdcutsLoaded(products));
    });
  }
}
