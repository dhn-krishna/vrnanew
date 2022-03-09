class MoviePayment {
  String createdDate;
  String activatedAt;
  String deactivatedAt;
  int payId;
  int movieId;
  int userId;
  String paidAmount;
  String paidMethod;
  String promoCode;
  String macAddress;
  String status;

  MoviePayment(
      {this.createdDate,
      this.activatedAt,
      this.deactivatedAt,
      this.payId,
      this.movieId,
      this.userId,
      this.paidAmount,
      this.paidMethod,
      this.promoCode,
      this.macAddress,
      this.status});

  MoviePayment.fromJson(Map<String, dynamic> json) {
    createdDate = json['createdDate'];
    activatedAt = json['activatedAt'];
    deactivatedAt = json['deactivatedAt'];
    payId = json['payId'];
    movieId = json['movieId'];
    userId = json['userId'];
    paidAmount = json['paidAmount'];
    paidMethod = json['paidMethod'];
    promoCode = json['promoCode'];
    macAddress = json['macAddress'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdDate'] = this.createdDate;
    data['activatedAt'] = this.activatedAt;
    data['deactivatedAt'] = this.deactivatedAt;
    data['payId'] = this.payId;
    data['movieId'] = this.movieId;
    data['userId'] = this.userId;
    data['paidAmount'] = this.paidAmount;
    data['paidMethod'] = this.paidMethod;
    data['promoCode'] = this.promoCode;
    data['macAddress'] = this.macAddress;
    data['status'] = this.status;
    return data;
  }
}