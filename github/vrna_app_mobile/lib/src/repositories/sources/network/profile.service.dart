import 'package:flutter/material.dart';
import 'package:vrna_app_mobile/src/helpers/http/http.helper.dart';
import 'package:vrna_app_mobile/src/helpers/storage/storage.helper.dart';
import 'package:vrna_app_mobile/src/helpers/storage/storage.keys.dart';
import 'package:vrna_app_mobile/src/models/profile.model.dart';
import './base/endpoints.dart' as Endpoints;

class ProfileService {
  Future<ProfileResponseModel> getProfile(BuildContext context) async {
    ProfileResponseModel response = ProfileResponseModel();
    final userid = await StorageHelper.get(StorageKeys.userid);
    final String url = Endpoints.profile.getProfile + "/" + userid;
    final retProfile = HttpHelper.get(url);
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

        // response = ProfileResponseModel.fromJson(res.data);
      } else if (res.data['status'] == 'ERROR') {
        // response = ProfileResponseModel.fromJson(res.data);
      }
    }).catchError((e) {
      // StorageHelper.set(StorageKeys.token, "");
      // StorageHelper.set(StorageKeys.username, "");
      // StorageHelper.set(StorageKeys.password, "");
    });
    return response;
  }

  Future<ProfileResponseModel> personalInfoUpdate(BuildContext context,
      String firstName, String middleName, String lastName) async {
    ProfileResponseModel response = ProfileResponseModel();
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

  Future<ProfileResponseModel> addressUpdate(
      BuildContext context,
      String address1,
      String address2,
      String area,
      String state,
      String country,
      String zipcode) async {
    ProfileResponseModel response = ProfileResponseModel();
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
