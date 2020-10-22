import 'package:impero_it_services/models/resultData.dart';

class CategoryModel {
  int status;
  String message;
  ResultData result;

  CategoryModel({this.status, this.message, this.result});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    message = json['Message'];
    result =
    json['Result'] != null ? new ResultData.fromJson(json['Result']) : null;
  }

  CategoryModel.withError(Map<String, dynamic> json) {
    status = json['Status'];
    message = json['Message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Status'] = this.status;
    data['Message'] = this.message;
    if (this.result != null) {
      data['Result'] = this.result.toJson();
    }
    return data;
  }
}