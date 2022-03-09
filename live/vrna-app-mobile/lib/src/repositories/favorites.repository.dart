import 'package:vrna_app_mobile/src/helpers/connection.helper.dart';
// import 'package:vrna_app_mobile/src/models/movieplaymeta.model.dart';
import 'package:vrna_app_mobile/src/models/favorites.response.dart';

import 'sources/network/favorite.service.dart';

class FavoritesRepository {
  FavoriteService api = FavoriteService();

  Future<FavoriteResponse> getFav() async {
    FavoriteResponse response = FavoriteResponse();
    final hasConnection = await ConnectionHelper.hasConnection();
    if (hasConnection) {
      response = await this.api.getFav();
    } else {
      response.message = "Device offline";
    }
    return response;
  }

  Future<FavoriteResponse> addFav(movieId, movieName) async {
    FavoriteResponse response = FavoriteResponse();
    final hasConnection = await ConnectionHelper.hasConnection();
    if (hasConnection) {
      response = await this.api.addFav(movieId, movieName);
    } else {
      response.message = "Device offline";
    }
    return response;
  }
}
