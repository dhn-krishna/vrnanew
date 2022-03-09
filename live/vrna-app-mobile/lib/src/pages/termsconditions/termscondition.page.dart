import 'package:flutter/material.dart';
// import 'package:vrna_app_mobile/src/blocs/auth.bloc.dart';
import 'package:vrna_app_mobile/src/widgets/loading.dart';
import 'package:vrna_app_mobile/src/pages/termsconditions/termscondition.widget.dart';
import 'package:vrna_app_mobile/src/widgets/background.dart';

class TermsConditionPage extends StatefulWidget {
  @override
  _TermsConditionPageState createState() => _TermsConditionPageState();
}

class _TermsConditionPageState extends State<TermsConditionPage>
    with TermsConditionWidget {
  @override
  Widget build(BuildContext context) {
    return Background(
        child: Loading(
            message: "Loading ...",
            child: Scaffold(
              body: Container(
                
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
                child: TermsCondition(context),
              ),
            )));
  }
}
