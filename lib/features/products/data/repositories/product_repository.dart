import 'package:dio/dio.dart';
import 'package:goo_store_app/core/constants/end_points.dart';
import 'package:goo_store_app/core/service/dio_helper.dart';
import 'package:goo_store_app/features/products/data/models/product.dart';
import 'package:goo_store_app/features/products/data/repositories/base_product_repository.dart';

class ProductRepository extends BaseProductRepository {
  final DioHelper _dioHelper;

  ProductRepository(this._dioHelper);
  @override
  Future<List<Product>> getAllproducts({required String token}) async {
    Response response =
        await _dioHelper.getData(endPoint: AppEndPoints.products, token: token);
    List<dynamic> data = response.data['data']['data'];
    return data.map((product) => Product.fromJson(product)).toList();
  }
}
