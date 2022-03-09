class FilterResponseModel {
  String status;
  String statusResult;
  String message;
  List<FilterMovie> dataFilter;

  FilterResponseModel({this.status, this.statusResult, this.message});
  FilterResponseModel.fromJson(Map<String, dynamic> json) {
    status = json["statusCode"];
    statusResult = json["status"];
    message = json["message"];
    dataFilter =
        (json["data"] as List).map((i) => new FilterMovie.fromJson(i)).toList();
  }
}

class FilterMovie {
  int movieId;
  int ppmCost;
  String moviename;
  String moviebannerurl;
  String country;
  String year;
  String certificate;
  String description;
  String posterurl;
  String language;
  String trailerurl;
  String filepath;
  String movielength;
  String movieyear;
  String maturityrating;
  String date;
  List director;
  List genre;
  List cast;

  FilterMovie(
      {this.movieId,
      this.ppmCost,
      this.moviename,
      this.moviebannerurl,
      this.country,
      this.year,
      this.certificate,
      this.description,
      this.posterurl,
      this.language,
      this.trailerurl,
      this.filepath,
      this.movielength,
      this.movieyear,
      this.maturityrating,
      this.date,
      this.director,
      this.genre,
      this.cast});

  FilterMovie.fromJson(Map<String, dynamic> json) {
    movieId = json["movieId"];
    ppmCost = json["ppmCost"];
    moviename = json["moviename"];
    moviebannerurl = json["moviebannerurl"];
    country = json["country"];
    year = json["year"];
    certificate = json["certificate"];
    description = json["description"];
    posterurl = json["posterurl"];
    language = json["language"];
    trailerurl = json["trailerurl"];
    filepath = json["filepath"];
    movielength = json["movielength"];
    movieyear = json["movieyear"];
    maturityrating = json["maturityrating"];
    date = json["date"];
    director = json["director"];
    genre = json["genre"];
    cast = json["cast"];
  }
}
