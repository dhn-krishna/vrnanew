import 'package:flutter/material.dart';
import 'package:vrna_app_mobile/src/helpers/storage/storage.helper.dart';
import 'package:vrna_app_mobile/src/pages/login/login.page.dart';

class CommonUtils {
  static void logout(BuildContext context) {
    StorageHelper.clear();
    Route route = MaterialPageRoute(builder: (context) => LoginPage());
    Navigator.pushReplacement(context, route);
  }
}
