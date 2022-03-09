import 'package:flutter/material.dart';
import 'package:vrna_app_mobile/src/helpers/http/http.helper.dart';
import 'package:vrna_app_mobile/src/helpers/storage/storage.helper.dart';
import 'package:vrna_app_mobile/src/helpers/storage/storage.keys.dart';
import 'package:vrna_app_mobile/src/models/signupresponse.model.dart';
import 'package:unique_identifier/unique_identifier.dart';
import 'dart:developer';
import './base/endpoints.dart' as Endpoints;

class SignupService {
  Future<SignupResponseModel> signup(BuildContext context, String username,
      String password, String phone) async {
    SignupResponseModel response = SignupResponseModel();

    final String url = Endpoints.signup.registration;
    final String verifySignupUrl = Endpoints.signup.registrationverify;
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

    final retSignup = HttpHelper.post(url, body: payload);
    await retSignup.then((res) async {
      if (res.data['status'] == 'Success') {
        final payloadVerify = {
          'mailId': '$username',
          'content': '4256b924-a70e-4481-8743-99b8216dc7f6',
          'subject': 'Confirm User Registration'
        };
        final retSignupVerify =
            HttpHelper.post(verifySignupUrl, body: payloadVerify);
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
