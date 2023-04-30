import 'package:goo_store_app/features/products/data/models/product.dart';

abstract class BaseProductRepository {
  Future<List<Product>>getAllproducts();
}