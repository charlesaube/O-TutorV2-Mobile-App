class MovieResponse {
  late int totalResults;
  late List<Movie> results;

  MovieResponse.fromJson(Map<String, dynamic> json) {
    totalResults = json['total_results'];
    if (json['results'] != null) {
      results = <Movie>[];
      json['results'].forEach((v) {
        results.add(new Movie.fromJson(v));
      });
    }
  }
}

class Movie {
  late int id;
  late var voteAverage;
  late String title;
  late String posterPath;
  late String overview;
  late String releaseDate;



  Movie.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    voteAverage = json['vote_average'];
    title = json['title'];
    posterPath = json['poster_path'];
    overview = json['overview'];
    releaseDate = json['release_date'];
  }
}