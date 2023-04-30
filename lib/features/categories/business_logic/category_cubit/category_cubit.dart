import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:goo_store_app/features/categories/data/models/category.dart';
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
}
