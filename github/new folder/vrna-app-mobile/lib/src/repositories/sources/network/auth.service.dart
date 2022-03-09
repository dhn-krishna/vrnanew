import 'package:flutter/material.dart';
import 'package:vrna_app_mobile/src/helpers/http/http.helper.dart';
import 'package:vrna_app_mobile/src/helpers/storage/storage.helper.dart';
import 'package:vrna_app_mobile/src/helpers/storage/storage.keys.dart';
import 'package:vrna_app_mobile/src/models/response.model.dart';
// import 'package:unique_identifier/unique_identifier.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import './base/endpoints.dart' as Endpoints;

class AuthService {
  Future<ResponseModel> login(
      BuildContext context, String username, String password) async {
    ResponseModel response = ResponseModel();
    final String url = Endpoints.login.auth;
    // String identifier = kIsWeb
    //     ? "2bf7e288-62d1-4db1-a788-007fce246123"
    //     : await UniqueIdentifier.serial;
    String imeiNumber = "";
    imeiNumber = await PlatformDeviceId.getDeviceId;
    // username = "anand.v@vrnaplex.com";
    // password = "Anand123";
    final payload = {
      'email': '$username',
      'password': '$password',
      'macaddress': '$imeiNumber'
    };
    print('Login Request :$payload');
    StorageHelper.remove(StorageKeys.token);
    StorageHelper.set(StorageKeys.username, username);
    StorageHelper.set(StorageKeys.macaddress, imeiNumber);
    final retAuth = HttpHelper.post(url, body: payload);
    await retAuth.then((res) {
      response.status = res.statusCode;
      response.statusResult = res.data['status'];
      if (res.data['status'] == 'Success' || res.data['status'] == 'SUCCESS') {
        // TODO session timeout
        StorageHelper.set("isLoggedIn", 'true');
        StorageHelper.set(
            StorageKeys.stripeid, res.data['data']['stripeId'].toString());
        if (res.headers['vrna-token'] != null) {
          String token = res.headers['vrna-token'][0].toString();
          StorageHelper.set(StorageKeys.token, token);
        } else if (res.headers['vrnatoken'] != null) {
          String token = res.headers['vrnatoken'][0].toString();
          StorageHelper.set(StorageKeys.token, token);
        }
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
    final payload = {'email': '$username'};
    final retForgotPassword = HttpHelper.post(url, body: payload);
    await retForgotPassword.then((res) async {
      if (res.data['status'] == 'Success' || res.data['status'] == 'SUCCESS') {
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

  Future<ResponseModel> updatePassword(
      BuildContext context, String email, String password, String token) async {
    ResponseModel response = ResponseModel();
    final String url = Endpoints.login.updatePassword;
    final payload = {
      'email': '$email',
      'password': '$password',
      'token': '$token'
    };
    final retForgotPassword = HttpHelper.post(url, body: payload);
    await retForgotPassword.then((res) async {
      if (res.data['status'] == 'Success' || res.data['status'] == 'SUCCESS') {
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
