import 'actor.model.dart';

class MovieCastResponseModel {
  String status;
  String statusResult;
  String message;
  List<Actor> cast;

  MovieCastResponseModel(
      {this.status, this.statusResult, this.message, this.cast});
  MovieCastResponseModel.fromJson(Map<String, dynamic> json) {
    status = json["statusCode"];
    statusResult = json["status"];
    message = json["message"];
    cast =
        (json["data"] as List).map((i) => new Actor.fromJson(i)).toList();
  }
}
