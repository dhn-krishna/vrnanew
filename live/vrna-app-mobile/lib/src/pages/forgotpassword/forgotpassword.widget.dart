import 'package:flutter/material.dart';
import 'package:vrna_app_mobile/src/blocs/auth.bloc.dart';
import 'package:vrna_app_mobile/src/pages/signup/signup.page.dart';
import 'package:vrna_app_mobile/src/values/devicescreen.dart';
import 'package:vrna_app_mobile/src/widgets/edit_text.dart';
import 'package:vrna_app_mobile/src/widgets/logo.dart';
import 'package:vrna_app_mobile/src/values/dimens.dart' as dimens;
import '../../widgets/theme.dart' as customTheme;

class ForgotPasswordWidget {
  Widget ForgotPassword(BuildContext context, AuthBloc bloc) {
    var mediaQuery = MediaQuery.of(context);
    var device = getDeviceType(mediaQuery);
    bool layoutDecide = MediaQuery.of(context).size.width < 1024;
    customTheme.Theme theme = customTheme.Theme.getTheme(device);
    Size size = MediaQuery.of(context).size;
    return ListView(scrollDirection: Axis.vertical, children: <Widget>[
      Padding(
        padding: EdgeInsets.all(dimens.margin),
        child: Flex(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          direction: layoutDecide ? Axis.vertical : Axis.horizontal,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(right: 50.0),
              width: layoutDecide
                  ? mediaQuery.size.width
                  : mediaQuery.size.width * 0.50,
              child: layoutDecide
                  ? Text("")
                  : Image.asset(
                      "assets/loginbg.png",
                      height: MediaQuery.of(context).size.height - 40.0,
                      fit: BoxFit.cover,
                    ),
            ),
            Container(
              width: layoutDecide
                  ? mediaQuery.size.width
                  : mediaQuery.size.width * 0.44,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: size.height * 0.15),
                  Logo(),
                  SizedBox(height: size.height * 0.12),
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: 10.0, top: 0.0, right: 10.0, bottom: 10.0),
                          child: Icon(
                            Icons.lock_outlined,
                            color: Colors.white,
                            size: 30.0,
                          ),
                        ),
                        Expanded(
                          child: Text(
                              'Enter your email address and we will send you a link to reset your password',
                              style: theme.entermail,
                              textAlign: TextAlign.left),
                        )
                      ]),
                  SizedBox(height: size.height * 0.07),
                  EditText(
                    placeholder: "Email Address",
                    value: bloc.forgotEmail,
                    onChange: (value) => bloc.setForgotEmail(value),
                    prefixIcon: Icons.email_outlined,
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(height: size.height * 0.04),
                  InkWell(
                    child: Container(
                      padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                      width: MediaQuery.of(context).size.width,
                      color: Color.fromRGBO(225, 185, 36, 1.0),
                      child: Text(
                        "reset your password".toUpperCase(),
                        textAlign: TextAlign.center,
                        style: theme.buttontext,
                      ),
                    ),
                    onTap: () => {
                      if (bloc.validate(context)) bloc.forgotPassword(context)
                    },
                  ),
                  SizedBox(height: size.height * 0.07),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        child: Text(
                          "Dont have an account?",
                          style: theme.forgotpassword,
                        ),
                        onTap: () {
                          Route route = MaterialPageRoute(
                              builder: (context) => SignupPage());
                          Navigator.pushReplacement(context, route);
                        },
                      ),
                      InkWell(
                        child: Text(
                          "Create Account",
                          style: theme.forgotpasswordyellow,
                        ),
                        onTap: () {
                          Route route = MaterialPageRoute(
                              builder: (context) => SignupPage());
                          Navigator.pushReplacement(context, route);
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.02),
                ],
              ),
            )
          ],
        ),
      )
    ]);
  }
}
