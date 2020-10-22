class ProductData {
  String name;
  String priceCode;
  String imageName;
  int id;

  ProductData({this.name, this.priceCode, this.imageName, this.id});

  ProductData.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    priceCode = json['PriceCode'];
    imageName = json['ImageName'];
    id = json['Id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Name'] = this.name;
    data['PriceCode'] = this.priceCode;
    data['ImageName'] = this.imageName;
    data['Id'] = this.id;
    return data;
  }
}
