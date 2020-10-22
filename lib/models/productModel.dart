import 'package:impero_it_services/models/productData.dart';

class ProductModel {
  int status;
  String message;
  List<ProductData> result;

  ProductModel({this.status, this.message, this.result});

  ProductModel.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    message = json['Message'];
    if (json['Result'] != null) {
      result = new List<ProductData>();
      json['Result'].forEach((v) {
        result.add(new ProductData.fromJson(v));
      });
    }
  }

  ProductModel.withError(Map<String, dynamic> json) {
    status = json['Status'];
    message = json['Message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Status'] = this.status;
    data['Message'] = this.message;
    if (this.result != null) {
      data['Result'] = this.result.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
