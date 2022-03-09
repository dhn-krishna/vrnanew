import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
// import 'package:vrna_app_mobile/src/blocs/auth.bloc.dart';
import 'package:vrna_app_mobile/src/widgets/button.dart';
import 'package:vrna_app_mobile/src/widgets/edit_text.dart';
import 'package:vrna_app_mobile/src/widgets/text.dart';
import 'package:vrna_app_mobile/src/widgets/logo.dart';
import 'package:vrna_app_mobile/src/pages/privacypolicy/privacypolicy.page.dart';
import 'package:vrna_app_mobile/src/values/colors.dart' as colors;
import 'package:vrna_app_mobile/src/values/dimens.dart' as dimens;

class PrivacyPolicyWidget {
  Widget PrivacyPolicy(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(children: [
      Container(
        margin: EdgeInsets.only(top: 100),
        child: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.all(0.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Text('VRNA Privacy Policy',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.left),
                ),
                SizedBox(height: size.height * 0.01),
                Container(
                  width: size.width * 0.92,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Text(
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.left),
                  ),
                )
              ]),
        )),
      ),
      Positioned(
        top: 40.0,
        child: TopMenu(),
      )
    ]);
  }
}

class TopMenu extends StatelessWidget {
  @override
  // static const IconData share_outlined =
  //     IconData(0xe412, fontFamily: 'MaterialIcons');

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        width: size.width * 0.99,
        //height: size.height * 0.25,
        child: Padding(
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Icon(
                    Icons.keyboard_backspace,
                    color: Colors.white,
                    size: 30.0,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Center(
                      child: Text('Privacy Policy',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center)),
                ),
              ]),
        ));
  }
}
