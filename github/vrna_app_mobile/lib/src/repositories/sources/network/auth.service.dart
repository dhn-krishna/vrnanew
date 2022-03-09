import 'package:flutter/material.dart';
import 'package:vrna_app_mobile/src/helpers/http/http.helper.dart';
import 'package:vrna_app_mobile/src/helpers/storage/storage.helper.dart';
import 'package:vrna_app_mobile/src/helpers/storage/storage.keys.dart';
import 'package:vrna_app_mobile/src/models/response.model.dart';
import 'package:unique_identifier/unique_identifier.dart';
// import 'package:vrna_app_mobile/src/repositories/sources/graphql/authSchema.dart';
// import 'package:vrna_app_mobile/src/helpers/graphql/config.dart';
// import "package:graphql_flutter/graphql_flutter.dart";
// import 'package:vrna_app_mobile/src/pages/dashboard/dashboard.page.dart';
import 'dart:developer';
import './base/endpoints.dart' as Endpoints;

class AuthService {
  Future<ResponseModel> login(
      BuildContext context, String username, String password) async {
    ResponseModel response = ResponseModel();

    final String url = Endpoints.login.auth;
    String identifier = await UniqueIdentifier.serial;
    String imeiNumber = identifier.toString();

    final payload = {
      'email': '$username',
      'password': '$password',
      'macaddress': '$imeiNumber'
    };
    log('identifie:$imeiNumber');
    StorageHelper.remove(StorageKeys.token);
    StorageHelper.set(StorageKeys.username, username);
    StorageHelper.set(StorageKeys.macaddress, imeiNumber);
    final retAuth = HttpHelper.post(url, body: payload);
    await retAuth.then((res) {
      log('response success:$res');
      response.statusResult = res.data['status'];
      // response.statusResult = res.headers._map['vrna-token'];
      if (res.data['status'] == 'Success') {
        response.status = res.statusCode;
        print(res.headers['vrna-token']);
        StorageHelper.set(
            StorageKeys.stripeid, res.data['data']['stripeId'].toString());
        if (res.headers['vrna-token'] != null) {
          String token = res.headers['vrna-token'][0].toString();
          StorageHelper.set(StorageKeys.token, token);
        } else if (res.headers['vrnatoken'] != null) {
          String token = res.headers['vrnatoken'][0].toString();
          StorageHelper.set(StorageKeys.token, token);
        }

        // String userid = res.data['data'].userId;
        StorageHelper.set(
            StorageKeys.userid, res.data['data']['userId'].toString());

        StorageHelper.set(StorageKeys.username, username);
        StorageHelper.set(StorageKeys.password, password);
      } else if (res.data['status'] == 'ERROR') {
        response.message = res.data['errormessage'];
      }
    }).catchError((e) {
      StorageHelper.remove(StorageKeys.token);
      StorageHelper.remove(StorageKeys.username);
      StorageHelper.remove(StorageKeys.password);

      response.status = 500;
      response.data = e;
      response.message = 'Error data';
    });

    return response;
  }

  Future<ResponseModel> forgotPassword(
      BuildContext context, String username) async {
    ResponseModel response = ResponseModel();

    final String url = Endpoints.login.forgotPassword;
    final String getMailUrl = Endpoints.login.forgotPasswordGetMail;

    final payload = {'email': '$username'};

    final retForgotPassword = HttpHelper.post(url, body: payload);
    await retForgotPassword.then((res) async {
      if (res.data['status'] == 'Success' || res.data['status'] == 'SUCCESS') {
        var token = res.data['data']['token'].toString();
        final payloadVerify = {
          'mailId': '$username',
          'content': '$token',
          'subject': 'Temporary password generated'
        };
        final retSignupVerify =
            HttpHelper.post(getMailUrl, body: payloadVerify);
        await retSignupVerify.then((resVerify) {
          if (resVerify.data['status'] == 'Success' ||
              resVerify.data['status'] == 'SUCCESS') {
            response.status = resVerify.statusCode;
            response.statusResult = resVerify.data['status'];
            response.message = resVerify.data['message'];
          } else if (resVerify.data['status'] == 'ERROR') {
            response.message = resVerify.data['errormessage'];
          }
        });
      } else if (res.data['status'] == 'ERROR') {
        response.message = res.data['errormessage'];
      }
    }).catchError((e) {
      StorageHelper.remove(StorageKeys.token);
      StorageHelper.remove(StorageKeys.username);
      StorageHelper.remove(StorageKeys.password);

      response.status = 500;
      response.data = e;
      response.message = 'Error data';
    });

    return response;
  }
}
