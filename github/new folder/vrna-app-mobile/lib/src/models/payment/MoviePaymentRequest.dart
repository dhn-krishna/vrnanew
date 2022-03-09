class MoviePaymentRequest {
  int custId;
  int movieId;
  int amount;
  String currency;
  String description;
  bool promoCode;
  String stripeCardId;
  String stripeCustId;

  MoviePaymentRequest(
      {this.custId,
      this.movieId,
      this.amount,
      this.currency,
      this.description,
      this.promoCode,
      this.stripeCardId,
      this.stripeCustId});

  MoviePaymentRequest.fromJson(Map<String, dynamic> json) {
    custId = json['custId'];
    movieId = json['movieId'];
    amount = json['amount'];
    currency = json['currency'];
    description = json['description'];
    promoCode = json['promoCode'];
    stripeCardId = json['stripeCardId'];
    stripeCustId = json['stripeCustId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['custId'] = this.custId;
    data['movieId'] = this.movieId;
    data['amount'] = this.amount;
    data['currency'] = this.currency;
    data['description'] = this.description;
    data['promoCode'] = this.promoCode;
    data['stripeCardId'] = this.stripeCardId;
    data['stripeCustId'] = this.stripeCustId;
    return data;
  }
}
