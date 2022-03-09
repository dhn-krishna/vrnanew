import 'movie.model.dart';

class SearchMovieResponse {
  String status;
  String statusCode;
  String message;
  List<Movie> movies;

  SearchMovieResponse(
      {this.status,
      this.statusCode,
      this.message,
      this.movies});

  SearchMovieResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['statusCode'];
    message = json['message'];
    if (json['data'] != null) {
      movies = [];
      json['data'].forEach((v) {
        movies.add(new Movie.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    if (this.movies != null) {
      data['data'] = this.movies.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
