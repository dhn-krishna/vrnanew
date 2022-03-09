import 'package:flutter/material.dart' hide Card;
import 'package:vrna_app_mobile/src/helpers/http/http.helper.dart';
import 'package:vrna_app_mobile/src/helpers/storage/storage.helper.dart';
import 'package:vrna_app_mobile/src/helpers/storage/storage.keys.dart';
import 'package:vrna_app_mobile/src/models/payment/ApiBaseResponse.dart';
import 'package:vrna_app_mobile/src/models/payment/Card.dart';
import 'package:vrna_app_mobile/src/models/profile.model.dart';
import './base/endpoints.dart' as Endpoints;

class ProfileService {
  Future<Profile> getProfile(BuildContext context) async {
    Profile response = Profile();
    final userid = await StorageHelper.get(StorageKeys.userid);
    final String url = Endpoints.profile.getProfile + "/" + userid;
    final retProfile = HttpHelper.post(url);
    await retProfile.then((res) async {
      if (res.data['status'] == 'Success' || res.data['status'] == 'SUCCESS') {
        if (res.headers['vrna-token'] != null) {
          String token = res.headers['vrna-token'][0].toString();
          StorageHelper.set(StorageKeys.token, token);
        } else if (res.headers['vrnatoken'] != null) {
          String token = res.headers['vrnatoken'][0].toString();
          StorageHelper.set(StorageKeys.token, token);
        }
        response.status = res.data['statusCode'];
        response.statusResult = res.data['status'];
        var userInfo = res.data['data']['user_info'];
        response.userId = userInfo['userId'];
        response.roleId = userInfo['roleId'];
        response.email = userInfo['email'];
        response.firstName = userInfo['firstName'].toString();
        response.lastName = userInfo['lastName'].toString();
        response.middleName = userInfo['middleName'].toString();
        response.password = userInfo['password'].toString();
        response.customer = userInfo['customer'];
        response.partner = userInfo['partner'];
        response.agent = userInfo['agent'];
        response.admin = userInfo['admin'];
        response.dob = userInfo['dob'].toString();
        response.gender = userInfo['gender'].toString();
        response.mobile = userInfo['mobile'].toString();
        response.address1 = userInfo['address1'].toString();
        response.address2 = userInfo['address2'].toString();
        response.country = userInfo['country'].toString();
        response.nationality = userInfo['nationality'].toString();
        response.area = userInfo['area'].toString();
        response.state = userInfo['state'].toString();
        response.zipcode = userInfo['zipcode'].toString();
        // response.prefferedLanguages = userInfo['preferredLanguages'];
        response.cardList = (res.data["data"]['card_info'] as List)
            .map((i) => new Card.fromJson(i))
            .toList();
        // response = Profile.fromJson(res.data);
      } else if (res.data['status'] == 'ERROR') {}
    }).catchError((e) {});
    return response;
  }

  Future<ApiBaseResponse> updateProfile(
      BuildContext context, Profile profile) async {
    final payload = {
      "userId": profile.userId,
      "roleId": profile.roleId,
      "agent": profile.agent,
      "password": profile.password,
      "firstName": profile.firstName,
      "middleName": profile.middleName,
      "lastName": profile.lastName,
      "nationality": profile.nationality,
      "dob": profile.dob,
      "gender": profile.gender,
      "loginip": null,
      "macaddress": null,
      "mobile": profile.mobile,
      "email": profile.email,
      "address1": profile.address1,
      "address2": profile.address2,
      "area": profile.area,
      "state": profile.state,
      "country": profile.country,
      "partner": profile.partner,
      "admin": profile.admin,
      "customer": profile.customer,
      // "prefferedLanguages": profile.prefferedLanguages,
      "zipcode": profile.zipcode,
      "comment": ""
    };
    final response = ApiBaseResponse();
    final retUpdate =
        HttpHelper.post(Endpoints.profile.updateProfile, body: payload);
    await retUpdate.then((res) async {
      if (res.data['status'] == 'Success') {
        response.status = res.data['status'];
        response.statusCode = res.data['statusCode'];
      } else if (res.data['status'] == 'ERROR') {
        response.message = res.data['errormessage'];
      }
    }).catchError((e) {
      response.status = "500";
      response.message = 'Error data';
    });

    return response;
  }

  Future<Profile> personalInfoUpdate(BuildContext context, String firstName,
      String middleName, String lastName) async {
    Profile response = Profile();
    final userid = await StorageHelper.get(StorageKeys.userid);
    final String url = Endpoints.profile.updateProfile;
    final payload = {
      'firstName': '$firstName',
      'middleName': '$middleName',
      'lastName': '$lastName',
      'userId': '$userid'
    };

    final retUpdate = HttpHelper.put(url, body: payload);
    await retUpdate.then((res) async {
      if (res.data['status'] == 'Success') {
        response.status = res.data['statusCode'];
        response.statusResult = res.data['status'];
        response.firstName = res.data['data']['firstName'].toString();
        response.lastName = res.data['data']['lastName'].toString();
        response.middleName = res.data['data']['middleName'].toString();
        response.dob = res.data['data']['dob'].toString();
        response.gender = res.data['data']['gender'].toString();
        response.mobile = res.data['data']['mobile'].toString();
        response.address1 = res.data['data']['address1'].toString();
        response.address2 = res.data['data']['address2'].toString();
        response.country = res.data['data']['country'].toString();
        response.area = res.data['data']['area'].toString();
        response.state = res.data['data']['state'].toString();
        response.zipcode = res.data['data']['zipcode'].toString();
      } else if (res.data['status'] == 'ERROR') {
        response.message = res.data['errormessage'];
      }
    }).catchError((e) {
      response.status = "500";
      // response.data = e;
      response.message = 'Error data';
    });

    return response;
  }

  Future<Profile> addressUpdate(
      BuildContext context,
      String address1,
      String address2,
      String area,
      String state,
      String country,
      String zipcode) async {
    Profile response = Profile();
    final userid = await StorageHelper.get(StorageKeys.userid);
    final String url = Endpoints.profile.updateProfile;
    final payload = {
      'address1': '$address1',
      'address2': '$address2',
      'area': '$area',
      'state': '$state',
      'country': '$country',
      'zipcode': '$zipcode',
      'userId': '$userid'
    };

    final retUpdate = HttpHelper.put(url, body: payload);
    await retUpdate.then((res) async {
      if (res.data['status'] == 'Success') {
        response.status = res.data['statusCode'];
        response.statusResult = res.data['status'];
        response.firstName = res.data['data']['firstName'].toString();
        response.lastName = res.data['data']['lastName'].toString();
        response.middleName = res.data['data']['middleName'].toString();
        response.dob = res.data['data']['dob'].toString();
        response.gender = res.data['data']['gender'].toString();
        response.mobile = res.data['data']['mobile'].toString();
        response.address1 = res.data['data']['address1'].toString();
        response.address2 = res.data['data']['address2'].toString();
        response.country = res.data['data']['country'].toString();
        response.area = res.data['data']['area'].toString();
        response.state = res.data['data']['state'].toString();
        response.zipcode = res.data['data']['zipcode'].toString();
      } else if (res.data['status'] == 'ERROR') {
        response.message = res.data['errormessage'];
      }
    }).catchError((e) {
      response.status = "500";
      // response.data = e;
      response.message = 'Error data';
    });

    return response;
  }
}
