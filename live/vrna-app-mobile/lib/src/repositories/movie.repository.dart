import 'package:vrna_app_mobile/src/helpers/connection.helper.dart';
import 'package:vrna_app_mobile/src/models/movieplaymeta.model.dart';
import 'package:vrna_app_mobile/src/models/movierating.response.dart';

import 'sources/network/movie.service.dart';

class MovieRepository{
  
  MovieService api = MovieService();

  Future<MoviePlayMeta> getMoviePlayMetaData(
      movieId) async {
    MoviePlayMeta response = MoviePlayMeta();
    final hasConnection = await ConnectionHelper.hasConnection();
    if (hasConnection) {
      response = await this.api.getMoviePlayMetaData(movieId);
    } else {
      response.message = "Device offline";
    }
    return response;
  }

   Future<MovieRatingResponse> rateMovie(
      movieId, rating) async {
    MovieRatingResponse response = MovieRatingResponse();
    final hasConnection = await ConnectionHelper.hasConnection();
    if (hasConnection) {
      response = await this.api.rateMovie(movieId,rating);
    } else {
      response.message = "Device offline";
    }
    return response;
  }
}