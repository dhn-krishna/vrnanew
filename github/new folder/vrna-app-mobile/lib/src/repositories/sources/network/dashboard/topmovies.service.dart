import 'package:flutter/material.dart';
import 'package:vrna_app_mobile/src/helpers/http/http.helper.dart';
import 'package:vrna_app_mobile/src/helpers/storage/storage.helper.dart';
import 'package:vrna_app_mobile/src/helpers/storage/storage.keys.dart';
import 'package:vrna_app_mobile/src/models/dashboardresponse.model.dart';
import '../base/endpoints.dart' as Endpoints;
import 'dart:developer';

class TopMoviesService {
  Future<TopMovieResponseModel> topmovie(BuildContext context) async {
    TopMovieResponseModel responseTopMovie = TopMovieResponseModel();
    final userid = await StorageHelper.get(StorageKeys.userid);
    final String url =
        Endpoints.dashboard.dashboardTopMovie + "?userId=" + userid;
    final retTopMovie = HttpHelper.get(url);
    await retTopMovie.then((res) async {
      log('top movie:$res');
      if (res.data['status'] == 'Success' || res.data['status'] == 'SUCCESS') {
        if (res.headers['vrna-token'] != null) {
          String token = res.headers['vrna-token'][0].toString();
          StorageHelper.set(StorageKeys.token, token);
        } else if (res.headers['vrnatoken'] != null) {
          String token = res.headers['vrnatoken'][0].toString();
          StorageHelper.set(StorageKeys.token, token);
        }
        responseTopMovie = TopMovieResponseModel.fromJson(res.data);
      } else if (res.data['status'] == 'ERROR') {
        responseTopMovie = TopMovieResponseModel.fromJson(res.data);
      }
    }).catchError((e) {
      // StorageHelper.set(StorageKeys.token, "");
      // StorageHelper.set(StorageKeys.username, "");
      // StorageHelper.set(StorageKeys.password, "");
    });
    return responseTopMovie;
  }
}
