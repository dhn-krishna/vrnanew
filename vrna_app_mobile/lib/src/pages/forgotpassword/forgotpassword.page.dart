import 'package:flutter/material.dart';
// import 'package:vrna_app_mobile/src/blocs/auth.bloc.dart';
import 'package:vrna_app_mobile/src/widgets/loading.dart';
import 'package:vrna_app_mobile/src/pages/forgotpassword/forgotpassword.widget.dart';
import 'package:vrna_app_mobile/src/widgets/background.dart';
import 'package:vrna_app_mobile/src/values/colors.dart' as colors;
import 'package:provider/provider.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage>
    with ForgotPasswordWidget {
  // AuthBloc bloc;

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   bloc = Provider.of<AuthBloc>(context);
  // }

  // @override
  // void dispose() {
  //   bloc.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Background(
        child: Loading(
            message: "Loading ...",
            // status: bloc.loading,
            child: Scaffold(body: Container(child: ForgotPassword(context)))));
  }
}
