import 'package:flutter/material.dart';
import 'package:vrna_app_mobile/src/blocs/auth.bloc.dart';
import 'package:vrna_app_mobile/src/widgets/loading.dart';
import 'package:vrna_app_mobile/src/pages/login/login.widget.dart';
import 'package:vrna_app_mobile/src/widgets/background.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with LoginWidget {
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
    return Background(
      child:Loading(
      message: "Loading ...",
      status: bloc.loading,
      child: Scaffold(
        body: Container(
          child: form(context, bloc)
        )
      )
    )
    );
  }
}
