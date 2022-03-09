import 'package:flutter/material.dart';
import 'package:vrna_app_mobile/src/blocs/auth.bloc.dart';
import 'package:vrna_app_mobile/src/helpers/storage/storage.helper.dart';
import 'package:vrna_app_mobile/src/pages/dashboard/dashboard.page.dart';
import 'package:vrna_app_mobile/src/widgets/loading.dart';
import 'package:vrna_app_mobile/src/pages/login/login.widget.dart';
import 'package:vrna_app_mobile/src/widgets/background.dart';
import 'package:vrna_app_mobile/src/values/devicescreen.dart';
import 'package:provider/provider.dart';
import '../../widgets/theme.dart' as customTheme;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with LoginWidget {
  AuthBloc bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // final Future<FirebaseApp> _initialization = Firebase.initializeApp();
    // bloc = Provider.of<AuthBloc>(context);
  }

  var theme;
  @override
  void initState() {
    super.initState();
    bloc = AuthBloc();
    StorageHelper.get("isLoggedIn").then((value) {
      if (value == 'true') {
        print('navigate to dashboard');
        Route route = MaterialPageRoute(builder: (context) => DashboardPage());
        Navigator.pushReplacement(context, route);
      }
    });
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
      widthSize = mediaQuery.size.width * 1.0;
    } else if (device == DeviceScreenType.Tablet) {
      widthSize = mediaQuery.size.width * 0.8;
    } else if (device == DeviceScreenType.Mobile) {
      widthSize = mediaQuery.size.width * 0.9;
    }

    var theme = customTheme.Theme.getTheme(device);

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
                        width: widthSize,
                        child: form(context, bloc))))));
  }
}
