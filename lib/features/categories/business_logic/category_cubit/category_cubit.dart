import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:goo_store_app/features/categories/data/models/category.dart';
import 'package:goo_store_app/features/products/data/models/product.dart';
import '../../data/repositories/category_repository.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this._categoryRepository) : super(CategoryInitial());
  final CategoryRepository _categoryRepository;
  Future<void> getAllCategories() async {
    emit(CategoriesLoading());
    final data = await _categoryRepository.getAllCategories();
    data.fold((error) {
      emit(CategoryFailure(error.errorMessage));
    }, (categories) {
      emit(CategoriesLoaded(categories));
    });
  }

  Future<void> getCustomCategoryProducts({required int categoryId}) async {
    emit(CategoriesLoading());
    final data = await _categoryRepository.getCustomCategoryProducts(
        categoryId: categoryId);
    data.fold((error) {
      emit(CategoryFailure(error.errorMessage));
    }, (categoryProducts) {
      emit(CategoryProdcutsLoaded(categoryProducts));
    });
  }
}
