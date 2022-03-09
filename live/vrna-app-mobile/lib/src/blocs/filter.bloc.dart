import 'package:vrna_app_mobile/src/models/moviefilter.response.dart';
import 'package:vrna_app_mobile/src/repositories/filter.repository.dart';
import 'package:vrna_app_mobile/src/models/filterresponse.model.dart';
import 'package:vrna_app_mobile/src/widgets/toast.dart';
import 'package:rxdart/rxdart.dart';

class FilterBloc {
  FilterRepository _repository = new FilterRepository();

  final _loading = BehaviorSubject<bool>();
  final _searchtext = BehaviorSubject<String>();
  final BehaviorSubject<FilterResponseModel> _responseFilterData =
      BehaviorSubject<FilterResponseModel>();
  final BehaviorSubject<MovieFilterResponse> _movieFilterResponse =
      BehaviorSubject<MovieFilterResponse>();

  final String defaultErrorMessage = 'Something went wrong';

  Stream<bool> get loading => _loading.stream;
  void _setLoading(bool value) => _loading.sink.add(value);

  Stream<String> get searchText => _searchtext.stream;
  void setSearchText(String value) => _searchtext.sink.add(value);

  Stream<MovieFilterResponse> get movieFilterResponse =>
      _movieFilterResponse.stream;

  void setMovieFilterResponse(MovieFilterResponse value) =>
      _movieFilterResponse.sink.add(value);

  void searchItem(context) async {
    _setLoading(true);

    final ret =
        await _repository.FilterData(context, _searchtext.value.toString());
    _setLoading(false);
    if (ret.status == "200") {
      if (ret.statusResult == 'Success' || ret.statusResult == 'SUCCESS') {
        _responseFilterData.sink.add(ret);
        CustomToast.show(ret.message.toString());
      } else {
        CustomToast.show(ret.message.toString());
      }
    } else {
      CustomToast.show(ret.message ?? defaultErrorMessage);
    }
  }

  void getFilteredMovies(context, filter) async {
    _setLoading(true);
    final ret = await _repository.getfilteredMovies(filter);
    _setLoading(false);
    if (ret.statusCode == "200") {
      if (ret.status == 'Success' || ret.status == 'SUCCESS') {
        setMovieFilterResponse(ret);
      } else {
        CustomToast.show('Something went wrong. Try again later');
      }
    } else {
      CustomToast.show('Something went wrong. Try again later');
    }
  }

  BehaviorSubject<FilterResponseModel> get responseFilterData =>
      _responseFilterData;

  void dispose() {
    _loading.close();
    _searchtext.close();
    _responseFilterData.close();
    _movieFilterResponse.close();
  }
}
