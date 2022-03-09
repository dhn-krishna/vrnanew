class DashboardResponseModel {
  String status;
  String statusResult;
  String message;
  List<Banners> data;

  DashboardResponseModel(
      {this.status, this.statusResult, this.message, this.data});
  DashboardResponseModel.fromJson(Map<String, dynamic> json) {
    status = json["statusCode"];
    statusResult = json["status"];
    message = json["message"];
    data = (json["data"] as List).map((i) => new Banners.fromJson(i)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.status;
    data['status'] = this.statusResult;
    data['message'] = this.message;
    return data;
  }
}

class Banners {
  int movieId;
  String moviename;
  String moviebannerurl;

  Banners({this.movieId, this.moviename, this.moviebannerurl});

  Banners.fromJson(Map<String, dynamic> json) {
    movieId = json["movieId"];
    moviename = json["moviename"];
    moviebannerurl = json["moviebannerurl"];
  }
}

///////////////////////////////////////////////////////////////

class LatestMovieResponseModel {
  String status;
  String statusResult;
  String message;
  List<LatestMovie> dataLatestMovie;

  LatestMovieResponseModel({this.status, this.statusResult, this.message});
  LatestMovieResponseModel.fromJson(Map<String, dynamic> json) {
    status = json["statusCode"];
    statusResult = json["status"];
    message = json["message"];
    dataLatestMovie =
        (json["data"] as List).map((i) => new LatestMovie.fromJson(i)).toList();
  }
}

class LatestMovie {
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

  LatestMovie(
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

  LatestMovie.fromJson(Map<String, dynamic> json) {
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

///////////////////////////////////////////////////////////////

class TopMovieResponseModel {
  String status;
  String statusResult;
  String message;
  List<TopMovie> dataTopMovie;

  TopMovieResponseModel({this.status, this.statusResult, this.message});
  TopMovieResponseModel.fromJson(Map<String, dynamic> json) {
    status = json["statusCode"];
    statusResult = json["status"];
    message = json["message"];
    dataTopMovie =
        (json["data"] as List).map((i) => new TopMovie.fromJson(i)).toList();
  }
}

class TopMovie {
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

  TopMovie(
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

  TopMovie.fromJson(Map<String, dynamic> json) {
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

///////////////////////////////////////////////////////////////

class RentalMovieResponseModel {
  String status;
  String statusResult;
  String message;
  List<RentalMovie> dataRentalMovie;

  RentalMovieResponseModel({this.status, this.statusResult, this.message});
  RentalMovieResponseModel.fromJson(Map<String, dynamic> json) {
    status = json["statusCode"];
    statusResult = json["status"];
    message = json["message"];
    dataRentalMovie =
        (json["data"] as List).map((i) => new RentalMovie.fromJson(i)).toList();
  }
}

class RentalMovie {
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

  RentalMovie(
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

  RentalMovie.fromJson(Map<String, dynamic> json) {
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

class RecomendedMovieResponseModel {
  String status;
  String statusResult;
  String message;
  List<RecomendedMovie> dataRecomendedMovie;

  RecomendedMovieResponseModel({this.status, this.statusResult, this.message});
  RecomendedMovieResponseModel.fromJson(Map<String, dynamic> json) {
    status = json["statusCode"];
    statusResult = json["status"];
    message = json["message"];
    dataRecomendedMovie = (json["data"] as List)
        .map((i) => new RecomendedMovie.fromJson(i))
        .toList();
  }
}

class RecomendedMovie {
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

  RecomendedMovie(
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

  RecomendedMovie.fromJson(Map<String, dynamic> json) {
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

class RentResponseModel {
  String status;
  String statusResult;
  String message;
  //List<TopMovie> dataTopMovie;

  RentResponseModel({this.status, this.statusResult, this.message});
  RentResponseModel.fromJson(Map<String, dynamic> json) {
    status = json["statusCode"];
    statusResult = json["status"];
    message = json["message"];
    // dataTopMovie =
    //     (json["data"] as List).map((i) => new TopMovie.fromJson(i)).toList();
  }
}
