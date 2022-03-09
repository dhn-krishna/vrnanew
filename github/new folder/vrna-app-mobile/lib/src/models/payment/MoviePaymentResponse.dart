import 'MoviePayment.dart';

class MoviePaymentResponse {
  String status;
  String statusCode;
  String message;
  List<MoviePayment> data;

  MoviePaymentResponse({this.status, this.statusCode, this.message, this.data});

  MoviePaymentResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['statusCode'];
    message = json['message'];
    (json["data"]as List)
            .map((i) => new MoviePayment.fromJson(i))
            .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
