import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:vrna_app_mobile/src/blocs/auth.bloc.dart';
import 'package:vrna_app_mobile/src/blocs/signup.bloc.dart';
import 'package:vrna_app_mobile/src/blocs/drawer.bloc.dart';
import 'package:vrna_app_mobile/src/blocs/dashboard.bloc.dart';
import 'package:vrna_app_mobile/src/blocs/filter.bloc.dart';
import 'package:vrna_app_mobile/src/blocs/profile.bloc.dart';

class BlocProvider extends StatelessWidget {
  final Widget child;

  const BlocProvider({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.debugCheckInvalidValueType = null;

    return MultiProvider(providers: [
      Provider<AuthBloc>.value(value: new AuthBloc()),
      Provider<DrawerBloc>.value(value: new DrawerBloc()),
      Provider<SignupBloc>.value(value: new SignupBloc()),
      Provider<DashboardBloc>.value(value: new DashboardBloc()),
      Provider<FilterBloc>.value(value: new FilterBloc()),
      Provider<ProfileBloc>.value(value: new ProfileBloc()),
    ], child: child);
  }
}
