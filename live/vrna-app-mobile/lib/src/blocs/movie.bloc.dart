import 'package:rxdart/rxdart.dart';
import 'package:vrna_app_mobile/src/models/movierating.response.dart';
import 'package:vrna_app_mobile/src/repositories/movie.repository.dart';
import 'package:vrna_app_mobile/src/widgets/toast.dart';

class MovieBloc {
  MovieRepository movieRepository = MovieRepository();

  final _loading = BehaviorSubject<bool>();
  final _movieRatingResponse = BehaviorSubject<MovieRatingResponse>();

  Stream<bool> get loading => _loading.stream;
  Stream<MovieRatingResponse> get movieRatingResponse =>
      _movieRatingResponse.stream;

  void _setLoading(bool value) => _loading.sink.add(value);
  void _setMovieRatingResponse(MovieRatingResponse value) =>
      _movieRatingResponse.sink.add(value);

  void rateMovie(context, movieId, rating) async {
    // _setLoading(true);
    // final ret = await movieRepository.rateMovie(movieId,rating);
    // _setLoading(false);
    // return ret;
    _setLoading(true);

    final ret = await movieRepository.rateMovie(movieId, rating);
    _setLoading(false);
    print('status ${ret.status} statusCode ${ret.statusCode}');
    if (ret.statusCode == "200") {
      if (ret.status == 'Success' || ret.status == 'SUCCESS') {
        _setMovieRatingResponse(ret);
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
    _movieRatingResponse.close();
  }
}
