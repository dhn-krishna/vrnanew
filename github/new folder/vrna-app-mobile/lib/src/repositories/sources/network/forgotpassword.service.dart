import 'package:flutter/material.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:vrna_app_mobile/src/helpers/http/http.helper.dart';
import 'package:vrna_app_mobile/src/helpers/storage/storage.helper.dart';
import 'package:vrna_app_mobile/src/helpers/storage/storage.keys.dart';
import 'package:vrna_app_mobile/src/models/forgotpassword.model.dart';
import 'dart:developer';
import './base/endpoints.dart' as Endpoints;

class ForgotPassswordService {
  get password => null;

  Future<ForgotPasswordResponseModel> signup(
      BuildContext context, String username) async {
    ForgotPasswordResponseModel response = ForgotPasswordResponseModel();
    final String url = Endpoints.login.forgotPassword;
    String deviceId = await PlatformDeviceId.getDeviceId;

    final payload = {
      'email': '$username',
      'password': '$password',
      'macaddress': '$deviceId'
    };
    log('identifie:$deviceId');
    StorageHelper.remove(StorageKeys.token);
    StorageHelper.set(StorageKeys.username, username);
    StorageHelper.set(StorageKeys.macaddress, deviceId);

    final retSignup = HttpHelper.post(url, body: payload);
    await retSignup.then((res) async {
      if (res.data['status'] == 'Success') {
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

