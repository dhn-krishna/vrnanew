import 'package:flutter/material.dart';
import 'package:vrna_app_mobile/src/blocs/signup.bloc.dart';
import 'package:vrna_app_mobile/src/widgets/loading.dart';
import 'package:vrna_app_mobile/src/pages/signup/signup.widget.dart';
import 'package:vrna_app_mobile/src/widgets/background.dart';
import 'package:provider/provider.dart';
import 'package:vrna_app_mobile/src/values/devicescreen.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> with SignupWidget {
  SignupBloc bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // bloc = Provider.of<SignupBloc>(context);
  }

  @override
  void initState() {
    super.initState();
    bloc = SignupBloc();
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
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment
                                .bottomCenter, // 10% of the width, so there are ten blinds.
                            colors: <Color>[
                              Color.fromRGBO(7, 11, 13, 1),
                              Color.fromRGBO(25, 39, 47, 1),
                              Color.fromRGBO(7, 10, 13, 1),
                            ], // red to yellow
                            tileMode: TileMode
                                .repeated, // repeats the gradient over the canvas
                          ),
                        ),
                        child: Signup(context, bloc))))));
  }
}
