import 'package:vrna_app_mobile/src/helpers/connection.helper.dart';
import 'package:vrna_app_mobile/src/models/response.model.dart';
import 'package:vrna_app_mobile/src/repositories/sources/network/forgotpassword.service.dart';
import 'sources/network/auth.service.dart';

class ForgotPasswordRepository {
  AuthService api = AuthService();

  Future<ResponseModel> login(context, String username, String password) async {
    ResponseModel response = ResponseModel();

    final hasConnection = await ConnectionHelper.hasConnection();

    if (hasConnection) {
      response = await this.api.login(context, username, password);
    } else {
      response.message = "Device offline";
    }

    return response;
  }
}
