import 'package:rxdart/rxdart.dart';
import 'package:vrna_app_mobile/src/models/movieplaymeta.model.dart';
import 'package:vrna_app_mobile/src/repositories/movie.repository.dart';

class MoviePlayerBloc {
  MovieRepository movieRepository = MovieRepository();

  final _loading = BehaviorSubject<bool>();

  Stream<bool> get loading => _loading.stream;
  void _setLoading(bool value) => _loading.sink.add(value);

  Future<MoviePlayMeta> getMoviePlayMetaData(movieId) async {
    _setLoading(true);
    final ret = await movieRepository.getMoviePlayMetaData(movieId);
    _setLoading(false);
    return ret;
  }

  void dispose() {
    _loading?.close();
  }
}
