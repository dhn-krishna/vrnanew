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
  List parent;
  List children;
  List spouse;
  List notableWork;
  List occupation;
  List castType;

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
    parent = json['parent'];
    children = json['children'];
    spouse = json['spouse'];
    notableWork = json['notableWork'];
    occupation = json['occupation'];
    castType = json['castType'];
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
    data['imageUrl'] = this.imageUrl;
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