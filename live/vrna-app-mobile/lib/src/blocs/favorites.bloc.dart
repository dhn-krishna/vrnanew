import 'package:rxdart/rxdart.dart';
import 'package:vrna_app_mobile/src/models/favorites.response.dart';
import 'package:vrna_app_mobile/src/repositories/favorites.repository.dart';
import 'package:vrna_app_mobile/src/widgets/toast.dart';

class FavoritesBloc {
  FavoritesRepository favoritesRepository = FavoritesRepository();

  final _loading = BehaviorSubject<bool>();
  final _favoriteResponse = BehaviorSubject<FavoriteResponse>();

  Stream<bool> get loading => _loading.stream;
  Stream<FavoriteResponse> get favoritesResponse => _favoriteResponse.stream;

  void _setLoading(bool value) => _loading.sink.add(value);
  void _setFavoriteResponse(FavoriteResponse value) =>
      _favoriteResponse.sink.add(value);

  void addFavoriteMovie(context, movieId, movieName) async {
    _setLoading(true);
    final ret = await favoritesRepository.addFav(movieId, movieName);
    _setLoading(false);
    print('status ${ret.status} statusCode ${ret.statusCode}');
    if (ret.statusCode == "200") {
      if (ret.status == 'Success' || ret.status == 'SUCCESS') {
        _setFavoriteResponse(ret);
        CustomToast.show("Your movie rating has been successfully updated");
      } else {
        CustomToast.show("Something went wrong. Please try again later.");
      }
    } else {
      CustomToast.show("Something went wrong. Please try again later.");
    }
  }

  void getFavorites(context) async {
    _setLoading(true);
    final ret = await favoritesRepository.getFav();
    _setLoading(false);
    print('status ${ret.status} statusCode ${ret.statusCode}');
    if (ret.statusCode == "200") {
      if (ret.status == 'Success' || ret.status == 'SUCCESS') {
        _setFavoriteResponse(ret);
        CustomToast.show("Your movie rating has been successfully updated");
      } else {
        CustomToast.show("Something went wrong. Please try again later.");
      }
    } else {
      CustomToast.show("Something went wrong. Please try again later.");
    }
  }

  void dispose() {
    _loading?.close();
    _favoriteResponse.close();
  }
}
