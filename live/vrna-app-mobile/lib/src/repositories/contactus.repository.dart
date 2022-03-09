import 'package:vrna_app_mobile/src/helpers/connection.helper.dart';
import 'package:vrna_app_mobile/src/models/contactusresponse.model.dart';
import 'package:vrna_app_mobile/src/repositories/sources/network/contactus.service.dart';

class ContactUsRepository {
  ContactUsService api = ContactUsService();

  Future<ContactUsResponseModel> raiseSupportTicket(
      context, String username, String email, String category, String message) async {
    ContactUsResponseModel response = ContactUsResponseModel();
    final hasConnection = await ConnectionHelper.hasConnection();
    if (hasConnection) {
      response = await this.api.raiseSupportTicket(context, username, email, category, message);
    } else {
      response.message = "Device offline";
    }
    return response;
  }
}
