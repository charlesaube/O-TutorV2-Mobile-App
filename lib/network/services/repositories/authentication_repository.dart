import '../../api_client.dart';

class AuthenticationRepository{

  ApiClient _helper = ApiClient();

  Future<List<Category>> getCategories() async {
    final response = await _helper.get("/category");
    print("results:");
    return CategoryResponse.fromJson(response).results;
  }


}