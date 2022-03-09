import 'package:vrna_app_mobile/src/models/payment/Card.dart';

class CardListResponse {
  String status;
  String statusCode;
  String message;
  List<Card> cards;

  CardListResponse({this.status, this.statusCode, this.message, this.cards});
  CardListResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['statusCode'];
    message = json['message'];
    if (json['data'] != null) {
      cards = (json["data"] as List).map((i) => new Card.fromJson(i)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    if (this.cards != null) {
      data['cards'] = this.cards.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
