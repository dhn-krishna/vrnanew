import 'package:flutter/material.dart';
import 'package:vrna_app_mobile/src/blocs/auth.bloc.dart';
import 'package:vrna_app_mobile/src/widgets/loading.dart';
import 'package:vrna_app_mobile/src/pages/search/search.widget.dart';
import 'package:vrna_app_mobile/src/widgets/background.dart';
import 'package:vrna_app_mobile/src/values/colors.dart' as colors;
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage>
    with SearchPageWidget { 

  @override
  Widget build(BuildContext context) {
    return Background(
        child: Loading(
            message: "Loading ...",
            // status: bloc.loading,
            child: Scaffold(body: Container(child: search(context)))));
  }
}
