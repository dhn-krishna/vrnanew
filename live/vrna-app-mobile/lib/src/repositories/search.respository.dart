import 'package:vrna_app_mobile/src/helpers/connection.helper.dart';
import 'package:vrna_app_mobile/src/models/searchmovie.response.dart';
import 'package:vrna_app_mobile/src/models/searchsuggestion.response.dart';
import 'package:vrna_app_mobile/src/repositories/sources/network/search.service.dart';

class SearchRepository{
  
  SearchService api = SearchService();

  Future<SearchMovieResponse> searchMovies(
      query, {String rating, String genre, category="", String timeRange}) async {
    SearchMovieResponse response = SearchMovieResponse();
    final hasConnection = await ConnectionHelper.hasConnection();
    if (hasConnection) {
      response = await this.api.searchMovies(query, rating: rating, genre: genre, category: category, timeRange: timeRange);
    } else {
      response.message = "Device offline";
    }
    return response;
  }

   Future<SearchSuggestionResponse> getSearchSuggestions(
      searchQuery) async {
    SearchSuggestionResponse response = SearchSuggestionResponse();
    final hasConnection = await ConnectionHelper.hasConnection();
    if (hasConnection) {
      response = await this.api.getSearchSuggestion(searchQuery);
    } else {
      response.message = "Device offline";
    }
    return response;
  }
}