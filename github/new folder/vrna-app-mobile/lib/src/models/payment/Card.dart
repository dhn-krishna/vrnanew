class Card {
  String emailId;
  String stripeCustId;
  String stripeCardId;
  String cardNo;
  String expiryMonth;
  String expiryYear;
  String secretPin;
  String stripetokenId;
  String date;

  Card(
      {this.emailId,
      this.stripeCustId,
      this.stripeCardId,
      this.cardNo,
      this.expiryMonth,
      this.expiryYear,
      this.secretPin,
      this.stripetokenId,
      this.date});

  Card.fromJson(Map<String, dynamic> json) {
    emailId = json['emailId'];
    stripeCustId = json['stripeCustId'];
    stripeCardId = json['stripeCardId'];
    cardNo = json['cardNo'];
    expiryMonth = json['expiryMonth'];
    expiryYear = json['expiryYear'];
    secretPin = json['secretPin'];
    stripetokenId = json['stripetokenId'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['emailId'] = this.emailId;
    data['stripeCustId'] = this.stripeCustId;
    data['stripeCardId'] = this.stripeCardId;
    data['cardNo'] = this.cardNo;
    data['expiryMonth'] = this.expiryMonth;
    data['expiryYear'] = this.expiryYear;
    data['secretPin'] = this.secretPin;
    data['stripetokenId'] = this.stripetokenId;
    data['date'] = this.date;
    return data;
  }
}
