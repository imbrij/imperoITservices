import 'package:impero_it_services/models/categoryData.dart';

class ResultData {
  List<CategoryData> category;

  ResultData({this.category});

  ResultData.fromJson(Map<String, dynamic> json) {
    if (json['Category'] != null) {
      category = new List<CategoryData>();
      json['Category'].forEach((v) {
        category.add(new CategoryData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.category != null) {
      data['Category'] = this.category.map((v) => v.toJson()).toList();
    }
    return data;
  }
}