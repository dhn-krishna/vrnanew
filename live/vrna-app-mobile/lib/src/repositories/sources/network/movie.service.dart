import 'package:vrna_app_mobile/src/helpers/http/http.helper.dart';
import 'package:vrna_app_mobile/src/helpers/storage/storage.helper.dart';
import 'package:vrna_app_mobile/src/helpers/storage/storage.keys.dart';
import 'package:vrna_app_mobile/src/models/movieplaymeta.model.dart';
import 'package:vrna_app_mobile/src/models/movierating.response.dart';
import './base/endpoints.dart' as Endpoints;

class MovieService {
  Future<MoviePlayMeta> getMoviePlayMetaData(movieId) async {
    MoviePlayMeta movieMetaData = new MoviePlayMeta();
    final userId = await StorageHelper.get(StorageKeys.userid);
    final String url =
        Endpoints.movieDetails.moviePlay + "?userId=$userId&movieId=$movieId";
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
        movieMetaData.status = res.data['status'];
        movieMetaData.statusCode = res.data['statusCode'];
        movieMetaData.movieUrl =
            res.data['data'] != null && res.data['data']['URL'] != null
                ? Endpoints.base.base + res.data['data']['URL']
                : '';
        // movieMetaData.movieUrl =
        //     res.data['signedUrl'] != null ? res.data['signedUrl'] : '';
        movieMetaData.cloudFrontPolicy =
            res.headers['CloudFront-Policy'] != null &&
                    res.headers['CloudFront-Policy'].length > 0
                ? res.headers['CloudFront-Policy'][0]
                : '';
        movieMetaData.cloudFrontSignature =
            res.headers['CloudFront-Signature'] != null &&
                    res.headers['CloudFront-Signature'].length > 0
                ? res.headers['CloudFront-Signature'][0]
                : '';
        movieMetaData.cloudFrontKeyPairId =
            res.headers['CloudFront-Key-Pair-Id'] != null &&
                    res.headers['CloudFront-Key-Pair-Id'].length > 0
                ? res.headers['CloudFront-Key-Pair-Id'][0]
                : '';
        if (res.headers['Set-Cookie'] != null) {
          var signature = '';
          res.headers['Set-Cookie'].forEach((element) {
            signature += element ?? ';';
          });
          movieMetaData.cloudFrontSignature = signature;
        }
      } else if (res.data['status'] == 'ERROR') {}
    }).catchError((e) {
      movieMetaData.status = 'ERROR';
    });
    return movieMetaData;
  }

  Future<MovieRatingResponse> rateMovie(movieId, rating) async {
    MovieRatingResponse movieRatingResponse = new MovieRatingResponse();
    // final userId = await StorageHelper.get(StorageKeys.userid);
    final String url =
        Endpoints.movieDetails.rateMovie + "?movieId=$movieId&rating=$rating";
    final ret = HttpHelper.post(url);
    await ret.then((res) async {
      if (res.data['status'] == 'Success' || res.data['status'] == 'SUCCESS') {
        if (res.headers['vrna-token'] != null) {
          String token = res.headers['vrna-token'][0].toString();
          StorageHelper.set(StorageKeys.token, token);
        } else if (res.headers['vrnatoken'] != null) {
          String token = res.headers['vrnatoken'][0].toString();
          StorageHelper.set(StorageKeys.token, token);
        }
        movieRatingResponse = MovieRatingResponse.fromJson(res.data);
      } else if (res.data['status'] == 'ERROR') {
        movieRatingResponse = MovieRatingResponse.fromJson(res.data);
      }
    }).catchError((e) {
      movieRatingResponse.status = 'ERROR';
      movieRatingResponse.statusCode = e;
    });
    return movieRatingResponse;
  }
}
