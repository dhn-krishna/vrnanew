import 'package:vrna_app_mobile/src/helpers/connection.helper.dart';
import 'package:vrna_app_mobile/src/models/signupresponse.model.dart';
import 'package:vrna_app_mobile/src/repositories/sources/network/signup.service.dart';

class SignupRepository {
  SignupService api = SignupService();

  Future<SignupResponseModel> signup(
      context, String username, String password, String phone, bool socialAuth, String loginVia) async {
    SignupResponseModel response = SignupResponseModel();
    final hasConnection = await ConnectionHelper.hasConnection();
    if (hasConnection) {
      response = await this.api.signup(context, username, password, phone, socialAuth, loginVia);
    } else {
      response.message = "Device offline";
    }
    return response;
  }
}
