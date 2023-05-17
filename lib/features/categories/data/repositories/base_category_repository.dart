import 'package:dartz/dartz.dart';
import 'package:goo_store_app/core/errors/failures.dart';
import 'package:goo_store_app/features/categories/data/models/category.dart';
import 'package:goo_store_app/features/products/data/models/product.dart';

abstract class BaseCategoryRepository{
  Future<Either<Failure,List<ProductCategory>>>getAllCategories();
  Future<Either<Failure,List<Product>>>getCustomCategoryProducts({required int categoryId});
}