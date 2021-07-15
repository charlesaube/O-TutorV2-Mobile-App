import 'dart:convert';

import 'package:demo3/model/Category.dart';
import 'package:demo3/network/services/ICategory_repository.dart';

import '../../api_client.dart';

class CategoryRepository extends ICategoryRepository{
  final String _apiKey = "4072e8fd15acedb8caa1e50c72c3821b25d39";

  ApiClient _helper = ApiClient();

  @override
  Future<List<Category>> fetchAllCategories() async {
    final response = await _helper.get("/category");

    return CategoryResponse.fromJson(response).results;
  }

}