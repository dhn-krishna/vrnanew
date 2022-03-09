import 'package:flutter/material.dart' hide Card;
import 'package:vrna_app_mobile/src/helpers/http/http.helper.dart';
import 'package:vrna_app_mobile/src/helpers/storage/storage.helper.dart';
import 'package:vrna_app_mobile/src/helpers/storage/storage.keys.dart';
import 'package:vrna_app_mobile/src/models/movie.model.dart';
import 'package:vrna_app_mobile/src/models/payment/ApiBaseResponse.dart';
import 'package:vrna_app_mobile/src/models/payment/Card.dart';
import 'package:vrna_app_mobile/src/models/payment/CardListResponse.dart';
import 'package:vrna_app_mobile/src/models/payment/MoviePaymentRequest.dart';
import 'package:vrna_app_mobile/src/models/payment/MoviePaymentResponse.dart';
import '../base/endpoints.dart' as Endpoints;

class PaymentService {
  Future<CardListResponse> getCardList(BuildContext context) async {
    CardListResponse cardListResponse = CardListResponse();
    final username = await StorageHelper.get(StorageKeys.username);
    final String url = Endpoints.payment.cardList + "?userName=" + username;
    final retLatestMovie = HttpHelper.get(url);
    await retLatestMovie.then((res) async {
      if (res.data['status'] == 'Success' || res.data['status'] == 'SUCCESS') {
        if (res.headers['vrna-token'] != null) {
          String token = res.headers['vrna-token'][0].toString();
          StorageHelper.set(StorageKeys.token, token);
        } else if (res.headers['vrnatoken'] != null) {
          String token = res.headers['vrnatoken'][0].toString();
          StorageHelper.set(StorageKeys.token, token);
        }
        cardListResponse = CardListResponse.fromJson(res.data);
      } else if (res.data['status'] == 'ERROR') {
        cardListResponse = CardListResponse.fromJson(res.data);
      }
    }).catchError((e) {
      print(e);
    });
    return cardListResponse;
  }

  Future<ApiBaseResponse> addNewCard(BuildContext context, Card card) async {
    ApiBaseResponse apiResponse = ApiBaseResponse();
    final username = await StorageHelper.get(StorageKeys.username);
    final String url = Endpoints.payment.addNewCard;
    card.stripeCustId = await StorageHelper.get(StorageKeys.stripeid);
    card.emailId = username;
    Map months = {
      "January": 1,
      "February": 2,
      "March": 3,
      "April": 4,
      "May": 5,
      "June": 6,
      "July": 7,
      "August": 8,
      "September": 9,
      "October": 10,
      "November": 11,
      "December": 12
    };
    card.expiryMonth = months[card.expiryMonth].toString();
    final response = HttpHelper.post(url, body: card);
    await response.then((res) async {
      if (res.data['status'] == 'Success' || res.data['status'] == 'SUCCESS') {
        if (res.headers['vrna-token'] != null) {
          String token = res.headers['vrna-token'][0].toString();
          StorageHelper.set(StorageKeys.token, token);
        } else if (res.headers['vrnatoken'] != null) {
          String token = res.headers['vrnatoken'][0].toString();
          StorageHelper.set(StorageKeys.token, token);
        }
        apiResponse = ApiBaseResponse.fromJson(res.data);
      } else if (res.data['status'] == 'ERROR') {
        apiResponse = ApiBaseResponse.fromJson(res.data);
      }
    }).catchError((e) {
      print(e);
    });
    return apiResponse;
  }

  Future<MoviePaymentResponse> processPayment(
      BuildContext context, Card card, Movie movie) async {
    MoviePaymentResponse apiResponse = MoviePaymentResponse();
    final username = await StorageHelper.get(StorageKeys.username);
    final userId = await StorageHelper.get(StorageKeys.userid);
    var stripeCustId = await StorageHelper.get(StorageKeys.stripeid);
    stripeCustId = "y2HTuubT7F9t1IklXPHtYM9pM+iuUsbmPYXJOZW2XiE=";
    var stripeCardId = card.stripeCardId;
    stripeCardId = "J8WZR1s0DICq3RF4gKdygILWTBT6szKOC02os2U654C+ObJzt1vWxA==";
    final String url = Endpoints.payment.processPayment;
    var paymentRequest = MoviePaymentRequest(
        custId: int.tryParse(userId),
        currency: "INR",
        amount: movie.ppmCost,
        description:
            "This transaction is for renting the movie: ${movie.moviename} for INR ${movie.ppmCost} by $username",
        promoCode: false,
        movieId: movie.movieId,
        stripeCardId: stripeCardId,
        stripeCustId: stripeCustId);
    final response = HttpHelper.post(url, body: paymentRequest);
    await response.then((res) async {
      if (res.data['status'] == 'Success' || res.data['status'] == 'SUCCESS') {
        if (res.headers['vrna-token'] != null) {
          String token = res.headers['vrna-token'][0].toString();
          StorageHelper.set(StorageKeys.token, token);
        } else if (res.headers['vrnatoken'] != null) {
          String token = res.headers['vrnatoken'][0].toString();
          StorageHelper.set(StorageKeys.token, token);
        }
        apiResponse = MoviePaymentResponse.fromJson(res.data);
      } else if (res.data['status'] == 'ERROR') {
        apiResponse = MoviePaymentResponse.fromJson(res.data);
      }
    }).catchError((e) {
      print(e);
    });
    return apiResponse;
  }

  Future<ApiBaseResponse> deleteSavedCard(
      BuildContext context, Card card) async {
    ApiBaseResponse response = ApiBaseResponse();
    final String url = Endpoints.payment.deleteSavedCard;
    final retDeleleCard = HttpHelper.delete(url, body: card.toJson());
    await retDeleleCard.then((res) async {
      if (res.data['status'] == 'Success' || res.data['status'] == 'SUCCESS') {
        if (res.headers['vrna-token'] != null) {
          String token = res.headers['vrna-token'][0].toString();
          StorageHelper.set(StorageKeys.token, token);
        } else if (res.headers['vrnatoken'] != null) {
          String token = res.headers['vrnatoken'][0].toString();
          StorageHelper.set(StorageKeys.token, token);
        }
        response = ApiBaseResponse.fromJson(res.data);
      } else if (res.data['status'] == 'ERROR') {
        response = ApiBaseResponse.fromJson(res.data);
      }
    }).catchError((e) {
      print(e);
    });
    return response;
  }
}
