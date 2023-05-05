import 'package:goo_store_app/features/products/data/models/product.dart';

class Order {
  String? authToken;
  String? deliveryNeeded;
  String? amountCents;
  String? currency;
  List<Product>? items;

  Order(
      {this.authToken,
      this.deliveryNeeded,
      this.amountCents,
      this.currency,
      this.items});
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['auth_token'] = authToken;
    data['delivery_needed'] = deliveryNeeded;
    data['amount_cents'] = amountCents;
    data['currency'] = currency;
    data['items'] = [];

    return data;
  }
}
