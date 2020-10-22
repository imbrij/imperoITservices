import 'package:dio/dio.dart';
import 'package:impero_it_services/apiManager/LoggingInterceptor.dart';
import 'package:impero_it_services/models/categoryModel.dart';
import 'package:impero_it_services/models/productModel.dart';
import 'package:impero_it_services/models/reqModels/categoryDto.dart';
import 'package:impero_it_services/models/reqModels/productDto.dart';

class CategoryProvider {
  final Dio _dio = Dio();

  Future<CategoryModel> getCategoryList(String url, CategoryDTO dto) async {
    try {
      _dio.interceptors.add(LoggingInterceptor());
      _dio.options.headers['content-Type'] = 'application/json';

      Response response = await _dio.post(url, data: dto.toMap());
      print(response);

      return response == null ? null : CategoryModel.fromJson(response.data);
    } on DioError catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return CategoryModel.withError(error.response.data);
    }
  }

  Future<ProductModel> getProductList(String url, ProductDTO dto) async {
    try {
      _dio.interceptors.add(LoggingInterceptor());
      _dio.options.headers['content-Type'] = 'application/json';

      Response response = await _dio.post(url, data: dto.toMap());
      print(response);

      return response == null ? null : ProductModel.fromJson(response.data);
    } on DioError catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return ProductModel.withError(error.response.data);
    }
  }
}
