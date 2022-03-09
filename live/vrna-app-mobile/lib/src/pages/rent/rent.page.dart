import 'package:flutter/material.dart';
// import 'package:vrna_app_mobile/src/blocs/auth.bloc.dart';
import 'package:vrna_app_mobile/src/widgets/loading.dart';
import 'package:vrna_app_mobile/src/pages/rent/rent.widget.dart';
import 'package:vrna_app_mobile/src/widgets/background.dart';
import 'package:vrna_app_mobile/src/blocs/dashboard.bloc.dart';
import 'package:vrna_app_mobile/src/values/colors.dart' as colors;
import 'package:provider/provider.dart';
import 'dart:developer';

class RentPage extends StatefulWidget {
  @override
  RentPage({Key key, this.details}) : super(key: key);
  final details;
  _RentPageState createState() => _RentPageState();
}

class _RentPageState extends State<RentPage> with RentWidget {
  DashboardBloc bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    bloc = Provider.of<DashboardBloc>(context);
  }

  // @override
  // void dispose() {
  //   bloc.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    // print(widget.details.toString());
    // String data = widget.details.description;
    // log('details$data');
    return Background(
        child: Loading(
            message: "Loading ...",
            status: bloc.loading,
            child: Scaffold(
                body: Container(child: Rent(context, widget.details, bloc)))));
  }
}
