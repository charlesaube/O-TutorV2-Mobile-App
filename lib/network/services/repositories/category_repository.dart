import 'package:demo3/model/Category.dart';

import '../../api_client.dart';

class CategoryRepository{
  final String _apiKey = "a78d1550517628a3a6cbfe7386b55182";

  ApiClient _helper = ApiClient();

  Future<List<Category>> getCategories() async {
    final response = await _helper.get("movie/popular?api_key=$_apiKey");
    return CategoryResponse.fromJson(response).results;
  }
}