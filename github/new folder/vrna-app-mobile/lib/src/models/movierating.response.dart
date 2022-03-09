import 'movie.model.dart';

class MovieRatingResponse {
  String status;
  String statusCode;
  String message;
  Movie movie;

  MovieRatingResponse(
      {this.status,
      this.statusCode,
      this.message,
      this.movie});

  MovieRatingResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['statusCode'];
    message = json['message'];
    movie = json['data'] != null ? new Movie.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    if (this.movie != null) {
      data['data'] = this.movie.toJson();
    }
    return data;
  }
}


