import 'package:impero_it_services/models/subCategoriesData.dart';

class CategoryData {
  int id;
  String name;
  int isAuthorize;
  int update080819;
  int update130919;
  List<SubCategoriesData> subCategories;

  CategoryData(
      {this.id,
      this.name,
      this.isAuthorize,
      this.update080819,
      this.update130919,
      this.subCategories});

  CategoryData.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    name = json['Name'];
    isAuthorize = json['IsAuthorize'];
    update080819 = json['Update080819'];
    update130919 = json['Update130919'];
    if (json['SubCategories'] != null) {
      subCategories = new List<SubCategoriesData>();
      json['SubCategories'].forEach((v) {
        subCategories.add(new SubCategoriesData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['Name'] = this.name;
    data['IsAuthorize'] = this.isAuthorize;
    data['Update080819'] = this.update080819;
    data['Update130919'] = this.update130919;
    if (this.subCategories != null) {
      data['SubCategories'] =
          this.subCategories.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
