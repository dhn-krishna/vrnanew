import 'package:vrna_app_mobile/src/models/actormovies.response.dart';
import 'package:vrna_app_mobile/src/models/moviecast.model.dart';
import 'package:vrna_app_mobile/src/repositories/actor.repository.dart';
import 'package:vrna_app_mobile/src/widgets/toast.dart';
import 'package:rxdart/rxdart.dart';

class ActorDetailsBloc {
  ActorRepository _repository = new ActorRepository();

  final _loading = BehaviorSubject<bool>();
  final _castDetailResponse = BehaviorSubject<MovieCastResponseModel>();
  final _moviesByActor = BehaviorSubject<ActorMoviesResponseModel>();
  final String defaultErrorMessage = 'Something went wrong';

  Stream<bool> get loading => _loading.stream;
  void _setLoading(bool value) => _loading.sink.add(value);

  Stream<MovieCastResponseModel> get castDetailResponse => _castDetailResponse.stream;
  void setName(MovieCastResponseModel value) =>
      _castDetailResponse.sink.add(value);

  Stream<ActorMoviesResponseModel> get moviesByActor => _moviesByActor.stream;
  void setEmail(ActorMoviesResponseModel value) =>
      _moviesByActor.sink.add(value);

  void getActorDetails(context, actorId) async {
    _setLoading(true);
    final ret = await _repository.getActorDetails(actorId);
    _setLoading(false);
    if (ret.status == "200") {
      if (ret.statusResult == 'Success' || ret.statusResult == 'SUCCESS') {
        _castDetailResponse.sink.add(ret);
      } else {
        CustomToast.show(ret.message.toString());
      }
    } else {
      CustomToast.show(ret.message ?? defaultErrorMessage);
    }
  }

   void getMoviesByActor(context, actorId) async {
    _setLoading(true);
    final ret = await _repository.getMoviesByActor(actorId);
    _setLoading(false);
    if (ret.status == "200") {
      if (ret.statusResult == 'Success' || ret.statusResult == 'SUCCESS') {
        _moviesByActor.sink.add(ret);
      } else {
        CustomToast.show(ret.message.toString());
      }
    } else {
      CustomToast.show(ret.message ?? defaultErrorMessage);
    }
  }

  void dispose() {
    _loading.close();
    _castDetailResponse.close();
    _moviesByActor.close();
  }
}
