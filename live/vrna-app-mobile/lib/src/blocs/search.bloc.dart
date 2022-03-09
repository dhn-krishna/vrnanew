import 'package:flutter/foundation.dart';
import 'package:vrna_app_mobile/src/models/moviefilter.response.dart';
import 'package:vrna_app_mobile/src/models/searchmovie.response.dart';
import 'package:vrna_app_mobile/src/models/searchsuggestion.response.dart';
import 'package:vrna_app_mobile/src/repositories/filter.repository.dart';
import 'package:vrna_app_mobile/src/models/filterresponse.model.dart';
import 'package:vrna_app_mobile/src/repositories/search.respository.dart';
import 'package:vrna_app_mobile/src/widgets/toast.dart';
import 'package:rxdart/rxdart.dart';

class SearchBloc {
  SearchRepository _repository = new SearchRepository();

  final _loading = BehaviorSubject<bool>();
  final _searchtext = BehaviorSubject<String>();
  final BehaviorSubject<FilterResponseModel> _responseFilterData =
      BehaviorSubject<FilterResponseModel>();
  final BehaviorSubject<SearchMovieResponse> _searchMovieResponse =
      BehaviorSubject<SearchMovieResponse>();

  final String defaultErrorMessage = 'Something went wrong';

  Stream<bool> get loading => _loading.stream;
  void _setLoading(bool value) => _loading.sink.add(value);

  Stream<String> get searchText => _searchtext.stream;
  void setSearchText(String value) => {print(value),_searchtext.sink.add(value)};

  Stream<SearchMovieResponse> get searchMovieResponse =>
      _searchMovieResponse.stream;

  void setSearchMovieResponse(SearchMovieResponse value) =>
      _searchMovieResponse.sink.add(value);

  Future<List<String>> getSuggestions(String pattern) async {
    if (pattern == null || pattern.length < 3) {
      return [];
    }
    _setLoading(true);
    SearchSuggestionResponse ret =
        await _repository.getSearchSuggestions(pattern);
    _setLoading(false);
    if (ret.statusCode == "200") {
      if (ret.status == 'Success' || ret.status == 'SUCCESS') {
        return ret.data;
      } else {
        CustomToast.show('Something went wrong. Try again later');
      }
    } else {
      CustomToast.show('Something went wrong. Try again later');
    }
    return [];
  }

  void search(String query, {rating="", genre="", category="", timeRange=""}) async {
    _setLoading(true);
    SearchMovieResponse ret = await _repository.searchMovies(query, rating: rating, genre: genre, category: category, timeRange: timeRange);
    _setLoading(false);
    if (ret.statusCode == "200") {
      if (ret.status == 'Success' || ret.status == 'SUCCESS') {
        setSearchMovieResponse(ret);
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
    _searchMovieResponse.close();
  }
}
