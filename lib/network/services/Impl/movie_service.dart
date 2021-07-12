import 'package:demo3/model/movie_demo.dart';

import '../../api_client.dart';

class MovieRepository {
  final String _apiKey = "a78d1550517628a3a6cbfe7386b55182";

  ApiClient _helper = ApiClient();

  Future<List<Movie>> fetchMovieList() async {
    final response = await _helper.get("movie/popular?api_key=$_apiKey");
    return MovieResponse.fromJson(response).results;
  }
}