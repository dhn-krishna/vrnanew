import 'package:vrna_app_mobile/src/helpers/connection.helper.dart';
import 'package:vrna_app_mobile/src/models/filterresponse.model.dart';
import 'package:vrna_app_mobile/src/repositories/sources/network/filter.service.dart';

class FilterRepository {
  FilterService api = FilterService();

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
