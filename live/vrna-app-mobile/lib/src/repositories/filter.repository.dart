import 'package:vrna_app_mobile/src/helpers/connection.helper.dart';
import 'package:vrna_app_mobile/src/models/filterresponse.model.dart';
import 'package:vrna_app_mobile/src/models/moviefilter.response.dart';
import 'package:vrna_app_mobile/src/repositories/sources/network/filter.service.dart';

class FilterRepository {
  FilterService api = FilterService();

  Future<MovieFilterResponse> getfilteredMovies(
      filterApplied) async {
    MovieFilterResponse response = MovieFilterResponse();
    final hasConnection = await ConnectionHelper.hasConnection();
    if (hasConnection) {
      response = await this.api.getfilteredMovies(filterApplied);
    } else {
      response.message = "Device offline";
    }
    return response;
  }

  // deprecated
   Future<FilterResponseModel> FilterData(context, String filterText) async {
    FilterResponseModel response = FilterResponseModel();

    final hasConnection = await ConnectionHelper.hasConnection();

    if (hasConnection) {
      response = await this.api.FilterData(context, filterText);
    } else {
      response.message = "Device offline";
    }

    return response;
  }
}
