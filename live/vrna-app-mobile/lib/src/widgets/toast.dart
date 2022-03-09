import 'package:fluttertoast/fluttertoast.dart';
import 'package:vrna_app_mobile/src/values/colors.dart' as colors;
import 'package:vrna_app_mobile/src/values/dimens.dart' as dimens;

class CustomToast {
  static void show(String msg, {duration: 3}) => Fluttertoast.showToast(
      msg: msg ?? "Toast message",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: duration,
      backgroundColor: colors.toastBackgroundColorError,
      textColor: colors.toastTextColor,
      fontSize: dimens.fontText);

  static void cancelAll() => Fluttertoast.cancel();
}
