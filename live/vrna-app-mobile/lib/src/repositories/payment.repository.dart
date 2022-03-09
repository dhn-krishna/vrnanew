import 'package:vrna_app_mobile/src/helpers/connection.helper.dart';
import 'package:vrna_app_mobile/src/models/payment/ApiBaseResponse.dart';
import 'package:vrna_app_mobile/src/models/payment/Card.dart';
import 'package:vrna_app_mobile/src/models/payment/CardListResponse.dart';
import 'package:vrna_app_mobile/src/models/payment/MoviePaymentResponse.dart';

import 'sources/network/dashboard/payment.service.dart';

class PaymentRepository {
  PaymentService api = PaymentService();

  Future<CardListResponse> cardList(context) async {
    CardListResponse response = CardListResponse();
    final hasConnection = await ConnectionHelper.hasConnection();
    if (hasConnection) {
      response = await this.api.getCardList(context);
    } else {
      response.message = "Device offline";
    }
    return response;
  }

  Future<ApiBaseResponse> addNewCard(context, card) async {
    ApiBaseResponse response = ApiBaseResponse();
    final hasConnection = await ConnectionHelper.hasConnection();
    if (hasConnection) {
      response = await this.api.addNewCard(context, card);
    } else {
      response.message = "Device offline";
    }
    return response;
  }

  Future<MoviePaymentResponse> processPayment(
      context, cardDetails, movie) async {
    MoviePaymentResponse response = MoviePaymentResponse();
    final hasConnection = await ConnectionHelper.hasConnection();
    if (hasConnection) {
      response = await this.api.processPayment(context, cardDetails, movie);
    } else {
      response.message = "Device offline";
    }
    return response;
  }

  Future<ApiBaseResponse> deleteSavedCard(context, Card card) async{
    ApiBaseResponse response = ApiBaseResponse();
     final hasConnection = await ConnectionHelper.hasConnection();
    if (hasConnection) {
      response = await this.api.deleteSavedCard(context, card);
    } else {
      response.message = "Device offline";
    }
    return response;

  }
}
