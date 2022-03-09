import 'package:vrna_app_mobile/src/helpers/http/http.helper.dart';
import 'package:vrna_app_mobile/src/helpers/storage/storage.helper.dart';
import 'package:vrna_app_mobile/src/helpers/storage/storage.keys.dart';
import 'package:vrna_app_mobile/src/models/actormovies.response.dart';
import 'package:vrna_app_mobile/src/models/moviecast.model.dart';
import './base/endpoints.dart' as Endpoints;

class ActorService {
  Future<MovieCastResponseModel> getActorDetails(actorId) async {
    MovieCastResponseModel movieCastResponseModel =
        new MovieCastResponseModel();
    final String url = Endpoints.castDetails.actorDetails + "$actorId";
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
        movieCastResponseModel= MovieCastResponseModel.fromJson(res.data);
      } else if (res.data['status'] == 'ERROR') {
        movieCastResponseModel = MovieCastResponseModel.fromJson(res.data);
      }
    }).catchError((e) {
      movieCastResponseModel.status = 'ERROR';
      movieCastResponseModel.statusResult = e;
    });
    return movieCastResponseModel;
  }

  Future<ActorMoviesResponseModel> getMoviesByActor(actorId) async {
    ActorMoviesResponseModel actorMoviesResponseModel =
        new ActorMoviesResponseModel();
    final String url = Endpoints.castDetails.moviesByCast + "?castId=$actorId";
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
        actorMoviesResponseModel = ActorMoviesResponseModel.fromJson(res.data);
      } else if (res.data['status'] == 'ERROR') {
        actorMoviesResponseModel = ActorMoviesResponseModel.fromJson(res.data);
      }
    }).catchError((e) {
      actorMoviesResponseModel.status = 'ERROR';
      actorMoviesResponseModel.statusResult = e;
    });
    return actorMoviesResponseModel;
  }
}
