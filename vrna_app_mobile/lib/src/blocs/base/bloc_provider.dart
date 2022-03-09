
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:vrna_app_mobile/src/blocs/auth.bloc.dart';
import 'package:vrna_app_mobile/src/blocs/drawer.bloc.dart';

class BlocProvider extends StatelessWidget {
  final Widget child;

  const BlocProvider({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.debugCheckInvalidValueType = null;

    return MultiProvider(
      providers: [
        Provider<AuthBloc>.value(value: new AuthBloc()),
        Provider<DrawerBloc>.value(value: new DrawerBloc())
      ],
      child: child
    );
  }
}