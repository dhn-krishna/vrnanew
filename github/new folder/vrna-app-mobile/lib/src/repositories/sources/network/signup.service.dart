import 'package:flutter/material.dart';
import 'package:vrna_app_mobile/src/helpers/http/http.helper.dart';
import 'package:vrna_app_mobile/src/helpers/storage/storage.helper.dart';
import 'package:vrna_app_mobile/src/helpers/storage/storage.keys.dart';
import 'package:vrna_app_mobile/src/models/signupresponse.model.dart';
// import 'package:unique_identifier/unique_identifier.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'dart:developer';
import './base/endpoints.dart' as Endpoints;

class SignupService {
  Future<SignupResponseModel> signup(BuildContext context, String username,
      String password, String phone, bool socialAuth, String loginVia) async {
    SignupResponseModel response = SignupResponseModel();

    final String url = Endpoints.signup.registration;
    // final String verifySignupUrl = Endpoints.signup.registrationverify;
    // String identifier = kIsWeb ? "2bf7e288-62d1-4db1-a788-007fce246123" : "2bf7e288-62d1-4db1-a788-007fce246123";
    String deviceId = await PlatformDeviceId.getDeviceId;

    var payload = {
      'email': '$username',
      'password': '$password',
      'macaddress': '$deviceId'
    };
    if (socialAuth) {
      payload['loginVia'] = loginVia;
    }
    log('identifier:$deviceId');
    StorageHelper.remove(StorageKeys.token);
    StorageHelper.set(StorageKeys.username, username);
    StorageHelper.set(StorageKeys.macaddress, deviceId);

    final retSignup = HttpHelper.post(url, body: payload);
    await retSignup.then((res) async {
      if (res.data['status'] == 'Success') {
        if (socialAuth) {
          StorageHelper.set("isLoggedIn", true);
          if (res.data['data']['userId'] != null)
            StorageHelper.set(
                StorageKeys.userid, res.data['data']['userId'].toString());
          if (res.data['data']['stripeId'] != null)
            StorageHelper.set(
                StorageKeys.stripeid, res.data['data']['stripeId'].toString());
        }
        response.status = res.statusCode;
        response.statusResult = res.data['status'];
        response.message = res.data['message'];
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
