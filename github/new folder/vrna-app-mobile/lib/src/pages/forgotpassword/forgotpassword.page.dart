import 'package:flutter/material.dart';
import 'package:vrna_app_mobile/src/blocs/auth.bloc.dart';
import 'package:vrna_app_mobile/src/widgets/loading.dart';
import 'package:vrna_app_mobile/src/pages/forgotpassword/forgotpassword.widget.dart';
import 'package:vrna_app_mobile/src/widgets/background.dart';
import 'package:vrna_app_mobile/src/values/colors.dart' as colors;
import 'package:provider/provider.dart';
import 'package:vrna_app_mobile/src/values/devicescreen.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage>
    with ForgotPasswordWidget {
  AuthBloc bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    bloc = Provider.of<AuthBloc>(context);
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var device = getDeviceType(mediaQuery);
    double widthSize = mediaQuery.size.width * 1.0;
    if (device == DeviceScreenType.Tv) {
      widthSize = mediaQuery.size.width;
    } else if (device == DeviceScreenType.Desktop) {
      widthSize = mediaQuery.size.width;
    } else if (device == DeviceScreenType.Tablet) {
      widthSize = mediaQuery.size.width * 0.6;
    } else if (device == DeviceScreenType.Mobile) {
      widthSize = mediaQuery.size.width * 0.9;
    }
    return Background(
        child: Loading(
            message: "Loading ...",
            status: bloc.loading,
            child: Scaffold(
                body: Center(
              child: Container(
                width: widthSize,
                child: ForgotPassword(context, bloc),
              ),
            ))));
  }
}
