import 'package:flutter/material.dart';
import 'package:vrna_app_mobile/src/helpers/http/http.helper.dart';
import 'package:vrna_app_mobile/src/helpers/storage/storage.helper.dart';
import 'package:vrna_app_mobile/src/helpers/storage/storage.keys.dart';
import 'package:vrna_app_mobile/src/models/dashboardresponse.model.dart';
import '../base/endpoints.dart' as Endpoints;
import 'dart:developer';

class RentService {
  Future<RentResponseModel> rentmovie(BuildContext context, String cardnumber,
      String cvv, String month, String year, String amount, int movieId) async {
    RentResponseModel response = RentResponseModel();
    final userid = await StorageHelper.get(StorageKeys.userid);
    final username = await StorageHelper.get(StorageKeys.username);
    final stripeid = await StorageHelper.get(StorageKeys.stripeid);
    final String url = Endpoints.dashboard.rentCard;
    final String rentProcessUrl = Endpoints.dashboard.rentProcess;
    final String rentPayment = Endpoints.dashboard.rentPayment;
    final macaddress = await StorageHelper.get(StorageKeys.macaddress);

    final payload = {
      'stripeCustId': '$stripeid',
      'emailId': '$username',
      'cardNo': '$cardnumber',
      'expiryMonth': '$month',
      'expiryYear': '$year',
      'cvv': '$cvv',
    };
    final retCardDetails = HttpHelper.post(url, body: payload);
    await retCardDetails.then((res) async {
      if (res.data['status'] == 'Success' || res.data['status'] == 'SUCCESS') {
        // response = RentResponseModel.fromJson(res.data);
        final payloadProcess = {
          'amount': '$amount',
          'currency': 'INR',
          'description': 'This transaction is for renting the movie',
          'stripeCardId': res.data['data'],
          'stripeCustId': 'XNi3wIXeHZSfL9jMT9Ic+MHd/Ttpd4aQywQbWe3D3Wg=',
        };
        final retProcess =
            HttpHelper.post(rentProcessUrl, body: payloadProcess);
        await retProcess.then((resProcess) async {
          if (resProcess.data['status'] == 'Success' ||
              resProcess.data['status'] == 'SUCCESS') {
            final payloadPayment = {
              'paidAmount': '$amount',
              'macAddress': '$macaddress',
              'movieId': movieId,
              'paidMethod': 'CARD',
              'userId': userid,
            };

            final retPayment =
                HttpHelper.post(rentPayment, body: payloadPayment);
            await retPayment.then((resPayment) async {
              if (resPayment.data['status'] == 'Success' ||
                  resPayment.data['status'] == 'SUCCESS') {
                response = RentResponseModel.fromJson(resPayment.data);
              }
            });
          }
        });
        // final payloadVerify = {
        //   'mailId': '$username',
        //   'content': '4256b924-a70e-4481-8743-99b8216dc7f6',
        //   'subject': 'Confirm User Registration'
        // };
        // final retSignupVerify =
        //     HttpHelper.post(verifySignupUrl, body: payloadVerify);
        // await retSignupVerify.then((resVerify) {
        //   if (resVerify.data['status'] == 'Success' ||
        //       resVerify.data['status'] == 'SUCCESS') {
        //     response.status = resVerify.statusCode;
        //     response.statusResult = resVerify.data['status'];
        //     response.message = resVerify.data['message'];
        //   } else if (resVerify.data['status'] == 'ERROR') {
        //     response.message = resVerify.data['errormessage'];
        //   }
        // });
      } else if (res.data['status'] == 'ERROR') {
        response = RentResponseModel.fromJson(res.data);
      }
    }).catchError((e) {
      // response = RentResponseModel.fromJson(res.data);
    });
    return response;
  }

  Future<RentalMovieResponseModel> rentalMovies(BuildContext context) async {
    RentalMovieResponseModel responseRentalMovie = RentalMovieResponseModel();
    final userid = await StorageHelper.get(StorageKeys.userid);
    final String url = Endpoints.dashboard.rentalMovie + "/" + userid;
    final retRentalMovie = HttpHelper.get(url);
    await retRentalMovie.then((res) async {
      log('latest movie:$res');
      if (res.data['status'] == 'Success' || res.data['status'] == 'SUCCESS') {
        if (res.headers['vrna-token'] != null) {
          String token = res.headers['vrna-token'][0].toString();
          StorageHelper.set(StorageKeys.token, token);
        } else if (res.headers['vrnatoken'] != null) {
          String token = res.headers['vrnatoken'][0].toString();
          StorageHelper.set(StorageKeys.token, token);
        }
        responseRentalMovie = RentalMovieResponseModel.fromJson(res.data);
      } else if (res.data['status'] == 'ERROR') {
        responseRentalMovie = RentalMovieResponseModel.fromJson(res.data);
      }
    }).catchError((e) {
      // StorageHelper.set(StorageKeys.token, "");
      // StorageHelper.set(StorageKeys.username, "");
      // StorageHelper.set(StorageKeys.password, "");
    });

    return responseRentalMovie;
  }
}
