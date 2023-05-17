import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:goo_store_app/core/constants/end_points.dart';
import 'package:goo_store_app/core/errors/server_error.dart';
import 'package:goo_store_app/core/service/dio_helper.dart';
import 'package:goo_store_app/features/categories/data/models/category.dart';
import 'package:goo_store_app/features/categories/data/repositories/base_category_repository.dart';
import 'package:goo_store_app/features/products/data/models/product.dart';

import '../../../../core/errors/failures.dart';

class CategoryRepository extends BaseCategoryRepository {
  final DioHelper _dioHelper;

  CategoryRepository(this._dioHelper);
  @override
  Future<Either<Failure, List<ProductCategory>>> getAllCategories() async {
    try {
      Response response = await _dioHelper.getData(
          endPoint: AppEndPoints.categories, lang: 'en');
      List<dynamic> data = response.data['data']['data'];
      return right(
          data.map((category) => ProductCategory.fromJson(category)).toList());
    } catch (e) {
      if (e is DioError) {
        return left(ServerError.fromDioError(e));
      }
      return left(ServerError(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getCustomCategoryProducts(
      {required int categoryId}) async {
    try {
      Response response = await _dioHelper.getData(
          endPoint: AppEndPoints.products,
          queryParameters: {'category_id': categoryId},
          lang: 'en');
      List<dynamic> data = response.data['data']['data'];
      return right(data.map((products) => Product.fromJson(products)).toList());
    } catch (e) {
      if (e is DioError) {
        return left(ServerError.fromDioError(e));
      }
      return left(ServerError(e.toString()));
    }
  }
}
