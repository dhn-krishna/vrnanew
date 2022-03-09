import 'package:flutter/material.dart';
import 'package:vrna_app_mobile/src/helpers/http/http.helper.dart';
import 'package:vrna_app_mobile/src/helpers/storage/storage.helper.dart';
import 'package:vrna_app_mobile/src/helpers/storage/storage.keys.dart';
import 'package:vrna_app_mobile/src/models/filterresponse.model.dart';
import 'package:unique_identifier/unique_identifier.dart';
import 'dart:developer';
import './base/endpoints.dart' as Endpoints;

class FilterService {
  Future<FilterResponseModel> FilterData(
      BuildContext context, String filterText) async {
    FilterResponseModel responseFilter = FilterResponseModel();
    final userid = await StorageHelper.get(StorageKeys.userid);
    final String url = Endpoints.filter.filterdata +
        "/search?searchId=" +
        filterText +
        "&userId=" +
        userid;

    final retFilterMovie = HttpHelper.get(url);
    await retFilterMovie.then((res) async {
      log('latest movie:$res');
      if (res.data['status'] == 'Success' || res.data['status'] == 'SUCCESS') {
        if (res.headers['vrna-token'] != null) {
          String token = res.headers['vrna-token'][0].toString();
          StorageHelper.set(StorageKeys.token, token);
        } else if (res.headers['vrnatoken'] != null) {
          String token = res.headers['vrnatoken'][0].toString();
          StorageHelper.set(StorageKeys.token, token);
        }
        responseFilter = FilterResponseModel.fromJson(res.data);
      } else if (res.data['status'] == 'ERROR') {
        responseFilter = FilterResponseModel.fromJson(res.data);
      }
    }).catchError((e) {
      // StorageHelper.set(StorageKeys.token, "");
      // StorageHelper.set(StorageKeys.username, "");
      // StorageHelper.set(StorageKeys.password, "");
    });

    return responseFilter;
  }
}
