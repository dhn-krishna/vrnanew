class FeaturedActorModel {
  String status;
  String statusResult;
  String message;
  List<Actor> actors;

  FeaturedActorModel(
      {this.status, this.statusResult, this.message, this.actors});
  FeaturedActorModel.fromJson(Map<String, dynamic> json) {
    status = json["statusCode"];
    statusResult = json["status"];
    message = json["message"];
    actors = (json["data"] as List).map((i) => new Actor.fromJson(i)).toList();
  }
}

class Actor {
  int castId;
  int movieId;
  String castname;
  String bornAs;
  String nationality;
  String yearsActive;
  String description;
  String dob;
  String imageUrl;
  int userRating;
  int vrnaRating;
  List<String> parent;
  List<String> children;
  List<String> spouse;
  List<String> notableWork;
  List<String> occupation;
  List<String> castType;

  Actor(
      {this.castId,
      this.movieId,
      this.castname,
      this.bornAs,
      this.nationality,
      this.yearsActive,
      this.description,
      this.dob,
      this.imageUrl,
      this.userRating,
      this.vrnaRating,
      this.parent,
      this.children,
      this.spouse,
      this.notableWork,
      this.occupation,
      this.castType});

  Actor.fromJson(Map<String, dynamic> json) {
    castId = json['castId'];
    movieId = json['movieId'];
    castname = json['castname'];
    bornAs = json['bornAs'];
    nationality = json['nationality'];
    yearsActive = json['yearsActive'];
    description = json['description'];
    dob = json['dob'];
    imageUrl = json['imageUrl'];
    userRating = json['userRating'];
    vrnaRating = json['vrnaRating'];
    // parent = json['parent'].cast<String>();
    // children = json['children'].cast<String>();
    // spouse = json['spouse'].cast<String>();
    // notableWork = json['notableWork'].cast<String>();
    // occupation = json['occupation'].cast<String>();
    // castType = json['castType'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['castId'] = this.castId;
    data['movieId'] = this.movieId;
    data['castname'] = this.castname;
    data['bornAs'] = this.bornAs;
    data['nationality'] = this.nationality;
    data['yearsActive'] = this.yearsActive;
    data['description'] = this.description;
    data['dob'] = this.dob;
    data['imageUrl'] =  'http://'+ this.imageUrl;
    data['userRating'] = this.userRating;
    data['vrnaRating'] = this.vrnaRating;
    data['parent'] = this.parent;
    data['children'] = this.children;
    data['spouse'] = this.spouse;
    data['notableWork'] = this.notableWork;
    data['occupation'] = this.occupation;
    data['castType'] = this.castType;
    return data;
  }
}
