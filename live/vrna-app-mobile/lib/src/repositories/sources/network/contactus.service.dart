import 'package:flutter/material.dart';
import 'package:vrna_app_mobile/src/helpers/http/http.helper.dart';
import 'package:vrna_app_mobile/src/helpers/storage/storage.helper.dart';
import 'package:vrna_app_mobile/src/helpers/storage/storage.keys.dart';
import 'package:vrna_app_mobile/src/models/contactusresponse.model.dart';
import './base/endpoints.dart' as Endpoints;
import 'package:platform_device_id/platform_device_id.dart';

class ContactUsService {
  Future<ContactUsResponseModel> raiseSupportTicket(BuildContext context, String name,
      String email, String category, String message) async {
    ContactUsResponseModel response = ContactUsResponseModel();
    final String url = Endpoints.contactUs.raiseSupportTicket;
    String deviceId = await PlatformDeviceId.getDeviceId;
    final payload = {
      'mailId': '$email',
      'subject': '$category',
      'content': '$message'
    };
    final apiResponseEntity = HttpHelper.post(url, body: payload);
    await apiResponseEntity.then((res) async {
      if (res.data['status'] == 'Success' || res.data['status'] == 'SUCCESS') {
        response.status = res.statusCode;
        response.statusResult = res.data['status'];
        response.message = res.data['message'];
      } else if (res.data['status'] == 'ERROR') {
        response.message = res.data['errormessage'];
      }
    }).catchError((e) {
      response.status = 500;
      response.data = e;
      response.message = 'Error data';
    });
    return response;
  }
}
