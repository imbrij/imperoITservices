import 'package:impero_it_services/apiManager/repository/categoryRepository.dart';
import 'package:impero_it_services/models/categoryModel.dart';
import 'package:impero_it_services/models/reqModels/categoryDto.dart';

/*class CategoryBloc {
  CategoryRepository _categoryRepository = CategoryRepository();
  final BehaviorSubject<BaseModel> _behaviorSubject =
      BehaviorSubject<BaseModel>();

  getLabourList(String url, CategoryDTO dto) async {
    BaseModel response = await _categoryRepository.getCategoryList(url, dto);
    _behaviorSubject.sink.add(response);
  }

  dispose() {
    _behaviorSubject.close();
  }

  BehaviorSubject<BaseModel> get labourSubject => _behaviorSubject;
}

final categoryBloc = CategoryBloc();*/
