import 'package:dio/dio.dart';
import 'package:goo_store_app/core/constants/end_points.dart';
import 'package:goo_store_app/core/service/dio_helper.dart';
import 'package:goo_store_app/features/categories/data/models/category.dart';
import 'package:goo_store_app/features/categories/data/repositories/base_category_repository.dart';
import 'package:goo_store_app/features/products/data/models/product.dart';

class CategoryRepository extends BaseCategoryRepository {
  final DioHelper _dioHelper;

  CategoryRepository(this._dioHelper);
  @override
  Future<List<ProductCategory>> getAllCategories() async {
    Response response =
        await _dioHelper.getData(endPoint: AppEndPoints.categories,lang: 'en');
    List<dynamic> data = response.data['data']['data'];
    return data.map((category) => ProductCategory.fromJson(category)).toList();
  }

  @override
  Future<List<Product>> getCustomCategoryProducts({required int categoryId}) async{
    Response response =await _dioHelper.getData(endPoint: AppEndPoints.products,queryParameters: {'category_id':categoryId},lang: 'en');
    List<dynamic>data =response.data['data']['data'];
    return data.map((products) =>Product.fromJson(products) ).toList();
  }
}
