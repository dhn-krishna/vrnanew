import 'movie.model.dart';

class SearchMovieResponse {
  String status;
  String statusCode;
  String message;
  String cloudFrontPolicy;
  String cloudFrontSignature;
  String cloudFrontKeyPairId;
  String signedUrl;
  List<Movie> movies;

  SearchMovieResponse(
      {this.status,
      this.statusCode,
      this.message,
      this.cloudFrontPolicy,
      this.cloudFrontSignature,
      this.cloudFrontKeyPairId,
      this.signedUrl,
      this.movies});

  SearchMovieResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['statusCode'];
    message = json['message'];
    cloudFrontPolicy = json['cloudFrontPolicy'];
    cloudFrontSignature = json['cloudFrontSignature'];
    cloudFrontKeyPairId = json['cloudFrontKeyPairId'];
    signedUrl = json['signedUrl'];
    if (json['data'] != null) {
      movies = new List<Movie>();
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
    data['cloudFrontPolicy'] = this.cloudFrontPolicy;
    data['cloudFrontSignature'] = this.cloudFrontSignature;
    data['cloudFrontKeyPairId'] = this.cloudFrontKeyPairId;
    data['signedUrl'] = this.signedUrl;
    if (this.movies != null) {
      data['data'] = this.movies.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
