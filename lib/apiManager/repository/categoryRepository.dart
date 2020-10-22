import 'package:impero_it_services/apiManager/provider/categoryProvider.dart';
import 'package:impero_it_services/models/categoryModel.dart';
import 'package:impero_it_services/models/productModel.dart';
import 'package:impero_it_services/models/reqModels/categoryDto.dart';
import 'package:impero_it_services/models/reqModels/productDto.dart';

class CategoryRepository {
  CategoryProvider _categoryProvider = CategoryProvider();

  Future<CategoryModel> getCategoryList(String url, CategoryDTO dto) {
    return _categoryProvider.getCategoryList(url, dto);
  }

  Future<ProductModel> getProductList(String url, ProductDTO dto) {
    return _categoryProvider.getProductList(url, dto);
  }
}
