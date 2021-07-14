import 'dart:async';

import 'package:demo3/model/Category.dart';
import 'package:demo3/network/api_response.dart';
import 'package:demo3/network/services/repositories/category_repository.dart';

class CategoryBloc{
    late CategoryRepository _categoryRepository;

    var _categoryListController = StreamController<ApiResponse<List<Category>>>();

    StreamSink<ApiResponse<List<Category>>> get categoryListSink =>
        _categoryListController.sink;

    Stream<ApiResponse<List<Category>>> get categoryListStream =>
        _categoryListController.stream;

    CategoryBloc() {
      _categoryListController = StreamController<ApiResponse<List<Category>>>();
      _categoryRepository = CategoryRepository();
      getCategories();

    }
    getCategories() async {
      categoryListSink.add(ApiResponse.loading('Fetching Categories'));
      try {
        List<Category> categories = await _categoryRepository.fetchAllCategories();
        categoryListSink.add(ApiResponse.completed(categories));
      } catch (e) {
        categoryListSink.add(ApiResponse.error(e.toString()));
        print(e);
      }
    }


    dispose(){
      _categoryListController.close();
    }
}