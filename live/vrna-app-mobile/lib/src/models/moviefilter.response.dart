import 'movie.model.dart';

class MovieFilterResponse {
  String status;
  String statusCode;
  String message;
  List<Movie> data;

  MovieFilterResponse(
      {this.status,
      this.statusCode,
      this.message,
      this.data});

  MovieFilterResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['statusCode'];
    message = json['message'];
    if (json['data'] != null) {
      data = new List<Movie>();
      json['data'].forEach((v) {
        data.add(new Movie.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
