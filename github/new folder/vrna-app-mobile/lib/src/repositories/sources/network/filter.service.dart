import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:vrna_app_mobile/src/helpers/http/http.helper.dart';
import 'package:vrna_app_mobile/src/helpers/storage/storage.helper.dart';
import 'package:vrna_app_mobile/src/helpers/storage/storage.keys.dart';
import 'package:vrna_app_mobile/src/models/filterresponse.model.dart';
import 'package:vrna_app_mobile/src/models/moviefilter.response.dart';
import './base/endpoints.dart' as Endpoints;

class FilterService {
  Future<MovieFilterResponse> getfilteredMovies(filterApplied) async {
    MovieFilterResponse filterResponse = new MovieFilterResponse();
    final userId = await StorageHelper.get(StorageKeys.userid);
    final String url = Endpoints.movieDetails.moviePlay +
        "?userId=$userId&menuName=$filterApplied";
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
        filterResponse = MovieFilterResponse.fromJson(res.data);
      } else if (res.data['status'] == 'ERROR') {
        filterResponse = MovieFilterResponse.fromJson(res.data);
      }
    }).catchError((e) {
      filterResponse.status = 'ERROR';
      filterResponse.statusCode = e;
    });
    return filterResponse;
  }

  // deprecated
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
  }
}
