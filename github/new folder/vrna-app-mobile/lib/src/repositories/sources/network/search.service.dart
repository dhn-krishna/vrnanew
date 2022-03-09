import 'package:vrna_app_mobile/src/helpers/http/http.helper.dart';
import 'package:vrna_app_mobile/src/helpers/storage/storage.helper.dart';
import 'package:vrna_app_mobile/src/helpers/storage/storage.keys.dart';
import 'package:vrna_app_mobile/src/models/searchmovie.response.dart';
import 'package:vrna_app_mobile/src/models/searchsuggestion.response.dart';
import './base/endpoints.dart' as Endpoints;

class SearchService {
  Future<SearchMovieResponse> searchMovies(query) async {
    SearchMovieResponse searchResponse = new SearchMovieResponse();
    final userId = await StorageHelper.get(StorageKeys.userid);
    final String url =
        Endpoints.search.search + "?searchKey=$query&userId=$userId";
    final ret = HttpHelper.get(url);
    await ret.then((res) async {
      if (res.data['status'] == 'Success' || res.data['status'] == 'SUCCESS') {
        if (res.headers['vrna-token'] != null) {
          String token = res.headers['vrna-token'][0].toString();
          StorageHelper.set(StorageKeys.token, token);
        } else if (res.headers['vrnatoken'] != null) {
          String token = res.headers['vrnatoken'][0].toString();
          StorageHelper.set(StorageKeys.token, token);
        }
        searchResponse = SearchMovieResponse.fromJson(res.data);
      } else if (res.data['status'] == 'ERROR') {
        searchResponse = SearchMovieResponse.fromJson(res.data);
      }
    }).catchError((e) {
      searchResponse.status = 'ERROR';
      searchResponse.statusCode = e;
    });
    return searchResponse;
  }

  Future<SearchSuggestionResponse> getSearchSuggestion(searchQuery) async {
    SearchSuggestionResponse searchSuggestionResponse = new SearchSuggestionResponse();
    final userId = await StorageHelper.get(StorageKeys.userid);
    final String url =
        Endpoints.search.searchSuggestion + "?searchId=$searchQuery&userId=$userId";
    final ret = HttpHelper.get(url);
    await ret.then((res) async {
      if (res.data['status'] == 'Success' || res.data['status'] == 'SUCCESS') {
        if (res.headers['vrna-token'] != null) {
          String token = res.headers['vrna-token'][0].toString();
          StorageHelper.set(StorageKeys.token, token);
        } else if (res.headers['vrnatoken'] != null) {
          String token = res.headers['vrnatoken'][0].toString();
          StorageHelper.set(StorageKeys.token, token);
        }
        searchSuggestionResponse = SearchSuggestionResponse.fromJson(res.data);
      } else if (res.data['status'] == 'ERROR') {
        searchSuggestionResponse = SearchSuggestionResponse.fromJson(res.data);
      }
    }).catchError((e) {
      searchSuggestionResponse.status = 'ERROR';
      searchSuggestionResponse.statusCode = e;
    });
    return searchSuggestionResponse;
  }
}
