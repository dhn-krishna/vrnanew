
class Movie {
  int movieId;
  int ppmCost;
  String moviename;
  String moviebannerurl;
  String country;
  String year;
  String certificate;
  String description;
  String posterurl;
  String landscapeurl;
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
  int userRating;
  int vrnaRating;

  Movie(
      {this.movieId,
      this.ppmCost,
      this.moviename,
      this.moviebannerurl,
      this.country,
      this.year,
      this.certificate,
      this.description,
      this.posterurl,
      this.landscapeurl,
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
      this.musicdirector,
      this.userRating,
      this.vrnaRating});

  Movie.fromJson(Map<String, dynamic> json) {
    movieId = json["movieId"];
    ppmCost = json["ppmCost"];
    moviename = json["moviename"];
    moviebannerurl = 'http://' + json["moviebannerurl"];
    country = json["country"];
    year = json["year"];
    certificate = json["certificate"];
    description = json["description"];
    posterurl = 'http://' + json["posterurl"];
    landscapeurl = 'http://' + json["landscapeUrl"];
    language = json["language"];
    trailerurl =
        'http://ec2-3-21-205-116.us-east-2.compute.amazonaws.com:8089/' +
            json["trailerurl"];
    filepath = 'http://ec2-3-21-205-116.us-east-2.compute.amazonaws.com:8089/' +
        json["filepath"];
    movielength = json["movielength"];
    movieyear = json["movieyear"];
    maturityrating = json["maturityrating"];
    date = json["date"];
    director = json["director"];
    genre = json["genre"];
    cast = json["cast"];
    producer = json["producer"];
    musicdirector = json["musicdirector"];
    userRating = json["userRating"];
    vrnaRating = json["vrnaRating"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['movieId'] = this.movieId;
    // data['userId'] = this.userId;
    // data['partnerId'] = this.partnerId;
    // data['status'] = this.status;
    // data['workflowId'] = this.workflowId;
    // data['approvedBy'] = this.approvedBy;
    data['moviename'] = this.moviename;
    data['country'] = this.country;
    data['year'] = this.year;
    data['certificate'] = this.certificate;
    data['description'] = this.description;
    data['posterurl'] = this.posterurl;
    // data['landscapeUrl'] = this.landscapeUrl;
    data['language'] = this.language;
    data['trailerurl'] = this.trailerurl;
    data['filepath'] = this.filepath;
    data['movielength'] = this.movielength;
    data['moviebannerurl'] = this.moviebannerurl;
    data['movieyear'] = this.movieyear;
    data['maturityrating'] = this.maturityrating;
    // data['playTime'] = this.playTime;
    // data['isBanner'] = this.isBanner;
    // data['comment'] = this.comment;
    data['date'] = this.date;
    data['userRating'] = this.userRating;
    data['vrnaRating'] = this.vrnaRating;
    data['ppmCost'] = this.ppmCost;
    // data['subtitles'] = this.subtitles;
    // data['audiolanguages'] = this.audiolanguages;
    data['director'] = this.director;
    data['musicdirector'] = this.musicdirector;
    // data['releasedby'] = this.releasedby;
    data['cast'] = this.cast;
    data['genre'] = this.genre;
    data['producer'] = this.producer;
    // data['countriesAccess'] = this.countriesAccess;
    return data;
  }
}