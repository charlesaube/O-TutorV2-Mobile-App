import 'package:demo3/model/Category.dart';

import '../../api_client.dart';

class CategoryRepository{
  final String _apiKey = "4072e8fd15acedb8caa1e50c72c3821b25d39";

  ApiClient _helper = ApiClient();

  Future<List<Category>> getCategories() async {
    final response = await _helper.get("/category");
    print("results:");
    return CategoryResponse.fromJson(response).results;
  }

}