import 'package:flutter/material.dart';
import 'package:vrna_app_mobile/src/pages/profile/profile.widget.dart';
import 'package:vrna_app_mobile/src/blocs/profile.bloc.dart';
import 'package:vrna_app_mobile/src/widgets/loading.dart';
import 'package:vrna_app_mobile/src/widgets/background.dart';
import 'package:vrna_app_mobile/src/values/colors.dart' as colors;
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with ProfileWidget {
  ProfileBloc bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    bloc = Provider.of<ProfileBloc>(context);
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Background(
        child: Loading(
            message: "Loading ...",
            status: bloc.loading,
            child: Scaffold(body: Container(child: Profile(context, bloc)))));
  }
}
