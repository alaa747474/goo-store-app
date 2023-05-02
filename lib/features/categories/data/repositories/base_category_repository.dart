import 'package:goo_store_app/features/categories/data/models/category.dart';
import 'package:goo_store_app/features/products/data/models/product.dart';

abstract class BaseCategoryRepository{
  Future<List<ProductCategory>>getAllCategories();
  Future<List<Product>>getCustomCategoryProducts({required int categoryId});
}