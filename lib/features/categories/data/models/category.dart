class ProductCategory{
  int? id;
  String? name;
  String? image;

  ProductCategory({this.id, this.name, this.image});

  ProductCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
}
