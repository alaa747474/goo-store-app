import '../../../products/data/models/product.dart';
import '../../../categories/data/models/category.dart';
class HomeData {
  bool? status;
  String? message;
  Data? data;

  HomeData({this.status, this.message, this.data});

  HomeData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  List<Banners>? banners;
  List<Product>? products;
  String? ad;

  Data({this.banners, this.products, this.ad});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['banners'] != null) {
      banners = <Banners>[];
      json['banners'].forEach((v) {
        banners!.add( Banners.fromJson(v));
      });
    }
    if (json['products'] != null) {
      products = <Product>[];
      json['products'].forEach((v) {
        products!.add(Product.fromJson(v));
      });
    }
    ad = json['ad'];
  }
}

class Banners {
  int? id;
  String? image;
  ProductCategory? category;
  Product? product;

  Banners({this.id, this.image, this.category, this.product});

  Banners.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    category = json['category'] != null
        ?  ProductCategory.fromJson(json['category'])
        : null;
    product = json['product'];
  }
}


