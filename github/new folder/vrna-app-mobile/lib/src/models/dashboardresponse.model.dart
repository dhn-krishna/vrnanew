import 'movie.model.dart';

class DashboardResponseModel {
  String status;
  String statusResult;
  String message;
  List<Movie> banners;
  TopMovieResponseModel topMoviesResponseModel;
  LatestMovieResponseModel latestMoviesResponseModel;
  RentalMovieResponseModel rentalMoviesResponseModel;
  RecomendedMovieResponseModel recommendedMoviesResponseModel;
  ContinueWatchingResponseModel continueWatchingResponseModel;
  FeaturedMovieResponseModel featuredMovieResponseModel;
  PersonalizedMovieResponseModel personalizedMovieResponseModel;

  DashboardResponseModel(
      {this.status,
      this.statusResult,
      this.message,
      this.banners,
      this.latestMoviesResponseModel,
      this.topMoviesResponseModel,
      this.rentalMoviesResponseModel,
      this.recommendedMoviesResponseModel,
      this.continueWatchingResponseModel,
      this.featuredMovieResponseModel});
  DashboardResponseModel.fromJson(Map<String, dynamic> json) {
    status = json["statusCode"];
    statusResult = json["status"];
    message = json["message"];
    banners = (json["data"]["Banner"] as List)
        .map((i) => new Movie.fromJson(i))
        .toList();
    topMoviesResponseModel = new TopMovieResponseModel(
        status: status,
        statusResult: statusResult,
        message: message,
        dataTopMovie: (json["data"]["Top Rated"] as List)
            .map((i) => new Movie.fromJson(i))
            .toList());
    latestMoviesResponseModel = new LatestMovieResponseModel(
        status: status,
        statusResult: statusResult,
        message: message,
        dataLatestMovie: (json["data"]["Latest"] as List)
            .map((i) => new Movie.fromJson(i))
            .toList());
    // rentalMoviesResponseModel = new RentalMovieResponseModel(
    //     status: status,
    //     statusResult: statusResult,
    //     message: message,
    //     dataRentalMovie: (json["data"]["Rented"] as List)
    //         .map((i) => new RentalMovie.fromJson(i))
    //         .toList());
    // continueWatchingResponseModel = new ContinueWatchingResponseModel(
    //     status: status,
    //     statusResult: statusResult,
    //     message: message,
    //     dataContinueWatching: (json["data"]["Continue Watching"] as List)
    //         .map((i) => new ContinueWatching.fromJson(i))
    //         .toList());
    // featuredMovieResponseModel = FeaturedMovieResponseModel.fromJson(json);
    // recommendedMoviesResponseModel = new RecomendedMovieResponseModel(
    //     status: status,
    //     statusResult: statusResult,
    //     message: message,
    //     dataRecomendedMovie: (json["data"]["Recommend"] as List)
    //         .map((i) => new RecomendedMovie.fromJson(i))
    //         .toList());
    personalizedMovieResponseModel =
        PersonalizedMovieResponseModel.fromJson(json);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.status;
    data['status'] = this.statusResult;
    data['message'] = this.message;
    data['banners'] = this.banners;
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
    moviebannerurl = 'http://' + json["moviebannerurl"];
  }
}

///////////////////////////////////////////////////////////////

class ContinueWatchingResponseModel {
  String status;
  String statusResult;
  String message;
  List<ContinueWatching> dataContinueWatching;

  ContinueWatchingResponseModel(
      {this.status,
      this.statusResult,
      this.message,
      this.dataContinueWatching});
  ContinueWatchingResponseModel.fromJson(Map<String, dynamic> json) {
    status = json["statusCode"];
    statusResult = json["status"];
    message = json["message"];
    dataContinueWatching = (json["data"] as List)
        .map((i) => new ContinueWatching.fromJson(i))
        .toList();
  }
}

class ContinueWatching {
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

  ContinueWatching(
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

  ContinueWatching.fromJson(Map<String, dynamic> json) {
    movieId = json["movieId"];
    ppmCost = json["ppmCost"];
    moviename = json["moviename"];
    moviebannerurl = 'http://' + json["moviebannerurl"];
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

class FeaturedMovieResponseModel {
  String status;
  String statusResult;
  String message;
  Movie featuredMovie;

  FeaturedMovieResponseModel(
      {this.status, this.statusResult, this.message, this.featuredMovie});
  FeaturedMovieResponseModel.fromJson(Map<String, dynamic> json) {
    status = json["statusCode"];
    statusResult = json["status"];
    message = json["message"];
    featuredMovie = Movie.fromJson(json['data']['featured'][0]);
  }
}

class FeaturedMovie {
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

  FeaturedMovie(
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

  FeaturedMovie.fromJson(Map<String, dynamic> json) {
    movieId = json["movieId"];
    ppmCost = json["ppmCost"];
    moviename = json["moviename"];
    moviebannerurl = 'http://' + json["moviebannerurl"];
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

class LatestMovieResponseModel {
  String status;
  String statusResult;
  String message;
  List<Movie> dataLatestMovie;

  LatestMovieResponseModel(
      {this.status, this.statusResult, this.message, this.dataLatestMovie});
  LatestMovieResponseModel.fromJson(Map<String, dynamic> json) {
    status = json["statusCode"];
    statusResult = json["status"];
    message = json["message"];
    dataLatestMovie =
        (json["data"] as List).map((i) => new Movie.fromJson(i)).toList();
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
    moviebannerurl = 'http://' + json["moviebannerurl"];
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
  List<Movie> dataTopMovie;

  TopMovieResponseModel(
      {this.status, this.statusResult, this.message, this.dataTopMovie});
  TopMovieResponseModel.fromJson(Map<String, dynamic> json) {
    status = json["statusCode"];
    statusResult = json["status"];
    message = json["message"];
    dataTopMovie =
        (json["data"] as List).map((i) => new Movie.fromJson(i)).toList();
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
  List producer;
  List musicdirector;
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
      this.cast,
      this.musicdirector,
      this.producer});

  TopMovie.fromJson(Map<String, dynamic> json) {
    movieId = json["movieId"];
    ppmCost = json["ppmCost"];
    moviename = json["moviename"];
    moviebannerurl = 'http://' + json["moviebannerurl"];
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
    musicdirector = json["musicdirector"];
    producer = json["producer"];
  }
}

///////////////////////////////////////////////////////////////

class RentalMovieResponseModel {
  String status;
  String statusResult;
  String message;
  List<RentalMovie> dataRentalMovie;

  RentalMovieResponseModel(
      {this.status, this.statusResult, this.message, this.dataRentalMovie});
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
    moviebannerurl = 'http://' + json["moviebannerurl"];
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

class RecomendedMovieResponseModel {
  String status;
  String statusResult;
  String message;
  List<RecomendedMovie> dataRecomendedMovie;

  RecomendedMovieResponseModel(
      {this.status, this.statusResult, this.message, this.dataRecomendedMovie});
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
  List producer;
  List musicdirector;
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
      this.cast,
      this.producer,
      this.musicdirector});

  RecomendedMovie.fromJson(Map<String, dynamic> json) {
    movieId = json["movieId"];
    ppmCost = json["ppmCost"];
    moviename = json["moviename"];
    moviebannerurl = 'http://' + json["moviebannerurl"];
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
    producer = json["producer"];
    musicdirector = json["musicdirector"];
  }
}

///////////////////////////////////////////////////////////////

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

///////////////////////////////////////////////////////////////

class RelatedMovieResponseModel {
  String status;
  String statusResult;
  String message;
  List<Movie> relatedMovies;

  RelatedMovieResponseModel(
      {this.status, this.statusResult, this.message, this.relatedMovies});
  RelatedMovieResponseModel.fromJson(Map<String, dynamic> json) {
    status = json["statusCode"];
    statusResult = json["status"];
    message = json["message"];
    relatedMovies =
        (json["data"] as List).map((i) => new Movie.fromJson(i)).toList();
  }
}

///////////////////////////////////////////////////////////////

class PersonalizedMovieResponseModel {
  String status;
  String statusResult;
  String message;
  Map<String, List<Movie>> personalizedMovieList;
  PersonalizedMovieResponseModel(
      this.status, this.statusResult, this.message, this.personalizedMovieList);
  PersonalizedMovieResponseModel.fromJson(Map<String, dynamic> json) {
    status = json["statusCode"];
    statusResult = json["status"];
    message = json["message"];
    personalizedMovieList = {};
    var excludedCategories = ["banner", "latest", "top rated", "featured"];
    (json["data"] as Map).entries.forEach((element) {
      var category = element.key.toString();
      if (!excludedCategories.contains(category.toLowerCase())) {
        personalizedMovieList[category] =
            ((element.value as List) ?? []).map((e) => Movie.fromJson(e)).toList();
      }
    });
  }
}

