import 'package:goo_store_app/features/favorite/data/models/favorite_product.dart';


class Favorite {
  bool? status;
  Data? data;
  Favorite({this.status, this.data});
  Favorite.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  int? currentPage;
  List<ProductData>? productsList;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  String? path;
  int? perPage;
  int? to;
  int? total;

  Data(
      {this.currentPage,
      this.productsList,
      this.firstPageUrl,
      this.from,
      this.lastPage,
      this.lastPageUrl,
      this.path,
      this.perPage,
      this.to,
      this.total});

  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      productsList = <ProductData>[];
      json['data'].forEach((v) {
        productsList!.add(ProductData.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
    total = json['total'];
  }
}

class ProductData {
  int? id;
  FavoriteProduct? product;

  ProductData({this.id, this.product});

  ProductData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product =
        json['product'] != null ? FavoriteProduct.fromJson(json['product']) : null;
  }
}
