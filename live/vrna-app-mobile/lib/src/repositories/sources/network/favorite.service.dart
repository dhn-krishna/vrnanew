import 'package:flutter/material.dart';
import 'package:vrna_app_mobile/src/helpers/http/http.helper.dart';
import 'package:vrna_app_mobile/src/helpers/storage/storage.helper.dart';
import 'package:vrna_app_mobile/src/helpers/storage/storage.keys.dart';
import 'package:vrna_app_mobile/src/models/favorites.response.dart';
import './base/endpoints.dart' as Endpoints;
import 'dart:developer';

class FavoriteService {
  Future<FavoriteResponse> addFav(movieId, movieName) async {
    FavoriteResponse favResponse = new FavoriteResponse();
    // final userId = await StorageHelper.get(StorageKeys.userid);
    final String url = Endpoints.movieDetails.addFav;
    final userid = await StorageHelper.get(StorageKeys.userid);
    final payload = {
      'movieId': '$movieId',
      'movieName': '$movieName',
      'userId': '$userid'
    };
    final ret = HttpHelper.post(url, body: payload);
    await ret.then((res) async {
      if (res.data['status'] == 'Success' || res.data['status'] == 'SUCCESS') {
        if (res.headers['vrna-token'] != null) {
          String token = res.headers['vrna-token'][0].toString();
          StorageHelper.set(StorageKeys.token, token);
        } else if (res.headers['vrnatoken'] != null) {
          String token = res.headers['vrnatoken'][0].toString();
          StorageHelper.set(StorageKeys.token, token);
        }
        favResponse = FavoriteResponse.fromJson(res.data);
      } else if (res.data['status'] == 'ERROR') {
        favResponse = FavoriteResponse.fromJson(res.data);
      }
    }).catchError((e) {
      favResponse.status = 'ERROR';
      favResponse.statusCode = e;
    });
    return favResponse;
  }

  Future<FavoriteResponse> getFav() async {
    FavoriteResponse favResponse = new FavoriteResponse();
    final userid = await StorageHelper.get(StorageKeys.userid);
    final String url = Endpoints.movieDetails.getFav + "/" + userid;
    final ret = HttpHelper.get(url);
    await ret.then((res) async {
      if (res.data['status'] == 'Success' || res.data['status'] == 'SUCCESS') {
        if (res.headers['vrna-token'] != null) {
          String token = res.headers['vrna-token'][0].toString();
          StorageHelper.set(StorageKeys.token, token);
        } else if (res.headers['vrnatoken'] != null) {
          String token = res.headers['vrnatoken'][0].toString();
          StorageHelper.set(StorageKeys.token, token);
        }
        favResponse = FavoriteResponse.fromJson(res.data);
      } else if (res.data['status'] == 'ERROR') {
        favResponse = FavoriteResponse.fromJson(res.data);
      }
    }).catchError((e) {
      favResponse.status = 'ERROR';
      favResponse.statusCode = e;
    });
    return favResponse;
  }
}
