import 'package:impero_it_services/models/productData.dart';

class SubCategoriesData {
  int id;
  String name;
  List<ProductData> product;

  SubCategoriesData({this.id, this.name, this.product});

  SubCategoriesData.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    name = json['Name'];
    if (json['Product'] != null) {
      product = new List<ProductData>();
      json['Product'].forEach((v) {
        product.add(new ProductData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['Name'] = this.name;
    if (this.product != null) {
      data['Product'] = this.product.map((v) => v.toJson()).toList();
    }
    return data;
  }
}