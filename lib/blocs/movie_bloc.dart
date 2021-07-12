import 'dart:async';

import 'package:demo3/model/movie_demo.dart';
import 'package:demo3/network/api_response.dart';
import 'package:demo3/network/services/Impl/movie_service.dart';

class MovieBloc {
  late MovieRepository _movieRepository;

  var _movieListController= StreamController<ApiResponse<List<Movie>>>();

  StreamSink<ApiResponse<List<Movie>>> get movieListSink =>
      _movieListController.sink;

  Stream<ApiResponse<List<Movie>>> get movieListStream =>
      _movieListController.stream;

  MovieBloc() {
    _movieListController = StreamController<ApiResponse<List<Movie>>>();
    _movieRepository = MovieRepository();
    fetchMovieList();
  }

  fetchMovieList() async {
    movieListSink.add(ApiResponse.loading('Fetching Popular Movies'));
    try {
      List<Movie> movies = await _movieRepository.fetchMovieList();
      movieListSink.add(ApiResponse.completed(movies));
    } catch (e) {
      movieListSink.add(ApiResponse.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _movieListController.close();
  }
}