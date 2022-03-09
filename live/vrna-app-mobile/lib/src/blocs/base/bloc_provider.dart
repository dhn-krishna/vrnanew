import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:vrna_app_mobile/src/blocs/auth.bloc.dart';
import 'package:vrna_app_mobile/src/blocs/contactus.bloc.dart';
import 'package:vrna_app_mobile/src/blocs/movie.player.bloc.dart';
import 'package:vrna_app_mobile/src/blocs/payment.bloc.dart';
import 'package:vrna_app_mobile/src/blocs/search.bloc.dart';
import 'package:vrna_app_mobile/src/blocs/signup.bloc.dart';
import 'package:vrna_app_mobile/src/blocs/drawer.bloc.dart';
import 'package:vrna_app_mobile/src/blocs/dashboard.bloc.dart';
import 'package:vrna_app_mobile/src/blocs/filter.bloc.dart';
import 'package:vrna_app_mobile/src/blocs/profile.bloc.dart';
import 'package:vrna_app_mobile/src/blocs/favorites.bloc.dart';
import 'package:vrna_app_mobile/src/models/movieplaymeta.model.dart';

import '../actordetails.bloc.dart';
import '../movie.bloc.dart';

class BlocProvider extends StatelessWidget {
  final Widget child;

  const BlocProvider({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.debugCheckInvalidValueType = null;
    return MultiProvider(providers: [
      Provider<AuthBloc>(create: (_) {
        return AuthBloc();
      }),
      Provider<DrawerBloc>(create: (_) {
        return DrawerBloc();
      }),
      Provider<SignupBloc>(create: (_) {
        return SignupBloc();
      }),
      Provider<DashboardBloc>(create: (_) {
        return DashboardBloc();
      }),
      Provider<FilterBloc>(create: (_) {
        return FilterBloc();
      }),
      Provider<ProfileBloc>(
        create: (_) {
          return ProfileBloc();
        },
      ),
      Provider<PaymentBloc>(create: (_) {
        return PaymentBloc();
      }),
      Provider<ContactUsBloc>(create: (_) {
        return ContactUsBloc();
      }),
      Provider<ActorDetailsBloc>(create: (_) {
        return ActorDetailsBloc();
      }),
      Provider<MovieBloc>(create: (_) {
        return MovieBloc();
      }),
      Provider<SearchBloc>(create: (_) {
        return SearchBloc();
      }),
      Provider<MoviePlayerBloc>(create: (_) {
        return MoviePlayerBloc();
      }),
      Provider<FavoritesBloc>(create: (_) {
        return FavoritesBloc();
      }),
    ], child: child);
  }
}
