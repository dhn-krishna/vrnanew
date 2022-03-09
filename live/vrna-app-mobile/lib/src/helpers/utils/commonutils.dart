import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vrna_app_mobile/src/helpers/storage/storage.helper.dart';
import 'package:vrna_app_mobile/src/pages/login/login.page.dart';

class CommonUtils {
  static void logout(BuildContext context) {
    StorageHelper.clear();
    Route route = MaterialPageRoute(builder: (context) => LoginPage());
    Navigator.pushReplacement(context, route);
  }

  static final List<String> months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  static final Map<String, String> monthsDic = {
    'Jan': 'January',
    'Feb': 'February',
    'Mar': 'March',
    'Apr': 'April',
    'May': 'May',
    'Jun': 'June',
    'Jul': 'July',
    'Aug': 'August',
    'Sep': 'September',
    'Oct': 'October',
    'Nov': 'November',
    'Dec': 'December'
  };
}
