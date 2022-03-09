import 'movie.model.dart';

class ActorMoviesResponseModel {
  String status;
  String statusResult;
  String message;
  List<Movie> movieList;
  ActorMoviesResponseModel(
      {this.status, this.statusResult, this.message, this.movieList});
  ActorMoviesResponseModel.fromJson(Map<String, dynamic> json) {
    status = json["statusCode"];
    statusResult = json["status"];
    message = json["message"];
    movieList = 
    (json["data"] as List).map((i) => new Movie.fromJson(i)).toList();
  }
}
