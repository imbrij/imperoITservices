class ProductDTO {
  int subCategoryId;
  int pageIndex;

  toMap() {
    return {"PageIndex": pageIndex, "SubCategoryId": subCategoryId};
  }
}
