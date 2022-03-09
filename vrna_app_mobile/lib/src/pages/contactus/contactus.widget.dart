import 'package:flutter/material.dart';
import 'package:vrna_app_mobile/src/blocs/auth.bloc.dart';
import 'package:vrna_app_mobile/src/pages/dashboard/dashboard.page.dart';
import 'package:vrna_app_mobile/src/widgets/button.dart';
import 'package:vrna_app_mobile/src/widgets/edit_text.dart';
import 'package:vrna_app_mobile/src/widgets/text.dart';
import 'package:vrna_app_mobile/src/widgets/logo.dart';
import 'package:vrna_app_mobile/src/pages/termsconditions/termscondition.page.dart';
import 'package:vrna_app_mobile/src/pages/privacypolicy/privacypolicy.page.dart';
import 'package:vrna_app_mobile/src/values/dimens.dart' as dimens;

class ContactUsWidget {
  Widget ContactUs(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Padding(
      padding: EdgeInsets.all(dimens.margin),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: size.height * 0.02),
          TopMenu(),
          SizedBox(height: size.height * 0.15),
          Logo(),
          SizedBox(height: size.height * 0.07),
          EditText(
            placeholder: "Name *",
            // value: bloc.login,
            // onChange: (value) => bloc.setLogin(value),
            // prefixIcon: Icons.email_sharp,
            keyboardType: TextInputType.text,
          ),
          SizedBox(height: size.height * 0.02),
          EditText(
            placeholder: "Email *",
            // value: bloc.login,
            // onChange: (value) => bloc.setLogin(value),
            // prefixIcon: Icons.email_sharp,
            keyboardType: TextInputType.text,
          ),
          SizedBox(height: size.height * 0.02),
          EditText(
            placeholder: "Category *",
            // value: bloc.login,
            // onChange: (value) => bloc.setLogin(value),
            // prefixIcon: Icons.email_sharp,
            keyboardType: TextInputType.text,
          ),
          SizedBox(height: size.height * 0.02),
          EditText(
            placeholder: "Message *",
            // value: bloc.login,
            // onChange: (value) => bloc.setLogin(value),
            // prefixIcon: Icons.email_sharp,
            keyboardType: TextInputType.text,
          ),
          SizedBox(height: size.height * 0.04),

          CustomButton(
              label: "SUBMIT",
              // onPress: () => bloc.signIn(),
              onPress: () {},
              width: size.width * 0.9,
              height: size.height * 0.07),

          SizedBox(height: size.height * 0.02),

          // CustomText(
          //   text:
          //       'By continuing, you agree to VRNA Terms of Use and Privacy Policy',
          //   small: true,
          //   color: Colors.grey,
          //   bold: true,
          // ),
        ],
      ),
    ));
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
          padding: EdgeInsets.only(left: 4.0, right: 10.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Padding(
              padding: EdgeInsets.only(left: 0.0),
              child: Icon(
                Icons.keyboard_backspace,
                color: Colors.white,
                size: 30.0,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Text('Contact Us',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0),
            ),
          ]),
        ));
  }
}
