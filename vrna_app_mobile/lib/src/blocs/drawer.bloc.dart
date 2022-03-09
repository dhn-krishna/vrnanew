import 'package:vrna_app_mobile/src/helpers/nav/nav_no_animation.dart';
import 'package:vrna_app_mobile/src/helpers/storage/storage.helper.dart';
import 'package:vrna_app_mobile/src/helpers/storage/storage.keys.dart';
import 'package:vrna_app_mobile/src/pages/login/login.page.dart';
import 'package:flutter/cupertino.dart';

class DrawerBloc {
  void logout(BuildContext context) {
    StorageHelper.set(StorageKeys.token, "");
    StorageHelper.set(StorageKeys.username, "");
    StorageHelper.set(StorageKeys.password, "");

    Navigator.pushReplacement(context, NavNoAnimation(page: LoginPage()));
  }


  void dispose() {
    //dispose observables if make sense
  }
}