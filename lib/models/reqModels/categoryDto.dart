class CategoryDTO {
  int categoryId;
  String deviceMenufacturer;
  String deviceModel;
  String deviceToken;
  int pageIndex;

  toMap() {
    return {
      "CategoryId": 0,
      "DeviceManufacturer": deviceMenufacturer,
      "DeviceModel": deviceModel,
      "DeviceToken": deviceToken,
      "PageIndex": pageIndex
    };
  }
}
