import 'package:goo_store_app/features/categories/data/models/category.dart';

abstract class BaseCategoryRepository{
  Future<List<ProductCategory>>getAllCategories();
}