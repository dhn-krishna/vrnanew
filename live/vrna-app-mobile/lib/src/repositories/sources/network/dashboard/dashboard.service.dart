import 'package:flutter/material.dart';
import 'package:vrna_app_mobile/src/helpers/http/http.helper.dart';
import 'package:vrna_app_mobile/src/helpers/storage/storage.helper.dart';
import 'package:vrna_app_mobile/src/helpers/storage/storage.keys.dart';
import 'package:vrna_app_mobile/src/models/dashboardresponse.model.dart';
import 'package:vrna_app_mobile/src/models/featuredActor.model.dart';
import 'package:vrna_app_mobile/src/models/moviecast.model.dart';
import '../base/endpoints.dart' as Endpoints;

class DashboardService {
  Future<DashboardResponseModel> dashboardbanner(BuildContext context) async {
    DashboardResponseModel response = DashboardResponseModel();
    final userid = await StorageHelper.get(StorageKeys.userid);
    final String url =
        Endpoints.dashboard.dashboardbanner + "?userId=" + userid;
    final retBanner = HttpHelper.get(url);
    await retBanner.then((res) async {
      if (res.data['status'] == 'Success' || res.data['status'] == 'SUCCESS') {
        if (res.headers['vrna-token'] != null) {
          String token = res.headers['vrna-token'][0].toString();
          StorageHelper.set(StorageKeys.token, token);
        } else if (res.headers['vrnatoken'] != null) {
          String token = res.headers['vrnatoken'][0].toString();
          StorageHelper.set(StorageKeys.token, token);
        }
        response = DashboardResponseModel.fromJson(res.data);
      } else if (res.data['status'] == 'ERROR') {
        response = DashboardResponseModel.fromJson(res.data);
      }
    }).catchError((e) {
      // StorageHelper.set(StorageKeys.token, "");
      // StorageHelper.set(StorageKeys.username, "");
      // StorageHelper.set(StorageKeys.password, "");
    });

    return response;
  }

  Future<DashboardResponseModel> dashboard(BuildContext context) async {
    DashboardResponseModel response = DashboardResponseModel();
    final userid = await StorageHelper.get(StorageKeys.userid);
    final String url =
        Endpoints.dashboard.dashboard + "?userId=" + userid + "&genreId=0";
    final retBanner = HttpHelper.get(url);
    await retBanner.then((res) async {
      if (res.data['status'] == 'Success' || res.data['status'] == 'SUCCESS') {
        if (res.headers['vrna-token'] != null) {
          String token = res.headers['vrna-token'][0].toString();
          StorageHelper.set(StorageKeys.token, token);
        } else if (res.headers['vrnatoken'] != null) {
          String token = res.headers['vrnatoken'][0].toString();
          StorageHelper.set(StorageKeys.token, token);
        }
        response = DashboardResponseModel.fromJson(res.data);
        storeRentedMovieList(response);
      } else if (res.data['status'] == 'ERROR') {
        response = DashboardResponseModel.fromJson(res.data);
      }
    }).catchError((e) {
      print(e);
    });

    return response;
  }

  // store rented movie list
  void storeRentedMovieList(DashboardResponseModel dashboardResponseModel) {
    var movieIds = [];
    if (dashboardResponseModel != null &&
        dashboardResponseModel.personalizedMovieResponseModel != null &&
        dashboardResponseModel
                .personalizedMovieResponseModel.personalizedMovieList !=
            null &&
        dashboardResponseModel.personalizedMovieResponseModel
                .personalizedMovieList['RENTED MOVIES'] !=
            null) {
      (dashboardResponseModel
              .personalizedMovieResponseModel.personalizedMovieList['RENTED MOVIES'])
          .forEach((element) {
        movieIds.add(element.movieId);
      });
    }
    StorageHelper.set("rentedMovies", movieIds.join(","));
  }

  Future<FeaturedActorModel> featuredActors(BuildContext context) async {
    FeaturedActorModel response = FeaturedActorModel();
    final userid = await StorageHelper.get(StorageKeys.userid);
    final String url = Endpoints.dashboard.featuredActors + "?userId=" + userid;
    final retBanner = HttpHelper.get(url);
    await retBanner.then((res) async {
      if (res.data['status'] == 'Success' || res.data['status'] == 'SUCCESS') {
        if (res.headers['vrna-token'] != null) {
          String token = res.headers['vrna-token'][0].toString();
          StorageHelper.set(StorageKeys.token, token);
        } else if (res.headers['vrnatoken'] != null) {
          String token = res.headers['vrnatoken'][0].toString();
          StorageHelper.set(StorageKeys.token, token);
        }
        response = FeaturedActorModel.fromJson(res.data);
      } else if (res.data['status'] == 'ERROR') {
        response = FeaturedActorModel.fromJson(res.data);
      }
    }).catchError((e) {
      print(e);
    });
    return response;
  }

  Future<RelatedMovieResponseModel> relatedMovies(
      BuildContext context, int movieId) async {
    RelatedMovieResponseModel response = RelatedMovieResponseModel();
    final userid = await StorageHelper.get(StorageKeys.userid);
    final String url =
        Endpoints.dashboard.relatedMovies + "?movieId=$movieId&userId=$userid";
    final retBanner = HttpHelper.get(url);
    await retBanner.then((res) async {
      if (res.data['status'] == 'Success' || res.data['status'] == 'SUCCESS') {
        if (res.headers['vrna-token'] != null) {
          String token = res.headers['vrna-token'][0].toString();
          StorageHelper.set(StorageKeys.token, token);
        } else if (res.headers['vrnatoken'] != null) {
          String token = res.headers['vrnatoken'][0].toString();
          StorageHelper.set(StorageKeys.token, token);
        }
        response = RelatedMovieResponseModel.fromJson(res.data);
      } else if (res.data['status'] == 'ERROR') {
        response = RelatedMovieResponseModel.fromJson(res.data);
      }
    }).catchError((e) {
      response.statusResult = e;
    });
    return response;
  }

  Future<MovieCastResponseModel> movieCast(
      BuildContext context, int movieId) async {
    MovieCastResponseModel response = MovieCastResponseModel();
    final userid = await StorageHelper.get(StorageKeys.userid);
    final String url =
        Endpoints.movieDetails.movieCast + "?movieId=$movieId&userId=$userid";
    final retBanner = HttpHelper.get(url);
    await retBanner.then((res) async {
      if (res.data['status'] == 'Success' || res.data['status'] == 'SUCCESS') {
        if (res.headers['vrna-token'] != null) {
          String token = res.headers['vrna-token'][0].toString();
          StorageHelper.set(StorageKeys.token, token);
        } else if (res.headers['vrnatoken'] != null) {
          String token = res.headers['vrnatoken'][0].toString();
          StorageHelper.set(StorageKeys.token, token);
        }
        response = MovieCastResponseModel.fromJson(res.data);
      } else if (res.data['status'] == 'ERROR') {
        response = MovieCastResponseModel.fromJson(res.data);
      }
    }).catchError((e) {
      response.statusResult = e;
    });
    return response;
  }
}
