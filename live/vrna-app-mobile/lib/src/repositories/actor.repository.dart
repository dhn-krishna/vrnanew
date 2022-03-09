import 'package:vrna_app_mobile/src/helpers/connection.helper.dart';
import 'package:vrna_app_mobile/src/models/actormovies.response.dart';
import 'package:vrna_app_mobile/src/models/moviecast.model.dart';
import 'package:vrna_app_mobile/src/repositories/sources/network/actor.service.dart';

class ActorRepository {
  ActorService api = ActorService();

  Future<MovieCastResponseModel> getActorDetails(actorId) async {
    MovieCastResponseModel response = MovieCastResponseModel();
    final hasConnection = await ConnectionHelper.hasConnection();
    if (hasConnection) {
      response = await this.api.getActorDetails(actorId);
    } else {
      response.message = "Device offline";
    }
    return response;
  }

  Future<ActorMoviesResponseModel> getMoviesByActor(actorId) async {
    ActorMoviesResponseModel response = ActorMoviesResponseModel();
    final hasConnection = await ConnectionHelper.hasConnection();
    if (hasConnection) {
      response = await this.api.getMoviesByActor(actorId);
    } else {
      response.message = "Device offline";
    }
    return response;
  }
}
