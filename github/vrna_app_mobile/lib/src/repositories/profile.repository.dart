import 'package:vrna_app_mobile/src/helpers/connection.helper.dart';
import 'package:vrna_app_mobile/src/models/profile.model.dart';
import 'package:vrna_app_mobile/src/repositories/sources/network/profile.service.dart';

class ProfileRepository {
  ProfileService api = ProfileService();
  Future<ProfileResponseModel> getProfile(context) async {
    ProfileResponseModel response = ProfileResponseModel();
    final hasConnection = await ConnectionHelper.hasConnection();
    if (hasConnection) {
      response = await this.api.getProfile(context);
    } else {
      response.message = "Device offline";
    }
    return response;
  }

  Future<ProfileResponseModel> personalInfoUpdate(
      context, String firstName, String middleName, String lastName) async {
    ProfileResponseModel response = ProfileResponseModel();

    final hasConnection = await ConnectionHelper.hasConnection();
    if (hasConnection) {
      response = await this
          .api
          .personalInfoUpdate(context, firstName, middleName, lastName);
    } else {
      response.message = "Device offline";
    }

    return response;
  }

  Future<ProfileResponseModel> addressUpdate(
      context,
      String address1,
      String address2,
      String area,
      String state,
      String country,
      String zipcode) async {
    ProfileResponseModel response = ProfileResponseModel();

    final hasConnection = await ConnectionHelper.hasConnection();
    if (hasConnection) {
      response = await this.api.addressUpdate(
          context, address1, address2, area, state, country, zipcode);
    } else {
      response.message = "Device offline";
    }

    return response;
  }
}
