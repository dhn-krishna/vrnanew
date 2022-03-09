import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:vrna_app_mobile/src/blocs/auth.bloc.dart';
import 'package:vrna_app_mobile/src/blocs/contactus.bloc.dart';
import 'package:vrna_app_mobile/src/blocs/movie.player.bloc.dart';
import 'package:vrna_app_mobile/src/blocs/payment.bloc.dart';
import 'package:vrna_app_mobile/src/blocs/signup.bloc.dart';
import 'package:vrna_app_mobile/src/blocs/drawer.bloc.dart';
import 'package:vrna_app_mobile/src/blocs/dashboard.bloc.dart';
import 'package:vrna_app_mobile/src/blocs/filter.bloc.dart';
import 'package:vrna_app_mobile/src/blocs/profile.bloc.dart';
import 'package:vrna_app_mobile/src/models/movieplaymeta.model.dart';

import '../actordetails.bloc.dart';

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
      Provider<PaymentBloc>.value(value: new PaymentBloc()),
      Provider<ContactUsBloc>.value(value: new ContactUsBloc()),
       Provider<MoviePlayerBloc>.value(value: new MoviePlayerBloc()),
       Provider<ActorDetailsBloc>.value(value: new ActorDetailsBloc()),
    ], child: child);
  }
}
