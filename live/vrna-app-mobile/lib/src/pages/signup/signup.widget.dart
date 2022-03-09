import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:vrna_app_mobile/src/blocs/signup.bloc.dart';
import 'package:vrna_app_mobile/src/values/devicescreen.dart';
import 'package:vrna_app_mobile/src/widgets/button.dart';
import 'package:vrna_app_mobile/src/widgets/edit_text.dart';
import 'package:vrna_app_mobile/src/widgets/text.dart';
import 'package:vrna_app_mobile/src/widgets/logo.dart';
import 'package:vrna_app_mobile/src/pages/termsconditions/termscondition.page.dart';
import 'package:vrna_app_mobile/src/pages/privacypolicy/privacypolicy.page.dart';
import 'package:vrna_app_mobile/src/pages/login/login.page.dart';
import 'package:vrna_app_mobile/src/values/dimens.dart' as dimens;
import 'package:vrna_app_mobile/src/widgets/themeTV.dart';
import '../../widgets/theme.dart' as customTheme;

class SignupWidget {
  var showPassword = false;
  var showConfirmPassword = false;
  Widget Signup(BuildContext context, SignupBloc bloc) {
    var mediaQuery = MediaQuery.of(context);
    var device = getDeviceType(mediaQuery);
    bool layoutDecide = MediaQuery.of(context).size.width < 1024;
    customTheme.Theme theme = customTheme.Theme.getTheme(device);
    Size size = MediaQuery.of(context).size;
    return StatefulBuilder(builder: (innerContext, innerSetState) {
      return ListView(scrollDirection: Axis.vertical, children: <Widget>[
        Padding(
          //padding: EdgeInsets.all(dimens.margin),
          padding: EdgeInsets.all(0),
          child: Flex(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            direction: layoutDecide ? Axis.vertical : Axis.horizontal,
            children: <Widget>[
              Container(
                //  padding: EdgeInsets.only(right: 50.0),
                width: layoutDecide
                    ? mediaQuery.size.width
                    : mediaQuery.size.width * 0.40,
                child: layoutDecide
                    ? Text("")
                    : Image.asset(
                        "assets/loginbg.png",
                        height: MediaQuery.of(context).size.height,
                        width: mediaQuery.size.width * 0.40,
                        fit: BoxFit.cover,
                      ),
              ),
              Container(
                  padding: EdgeInsets.only(                      
                    left:layoutDecide? mediaQuery.size.width * 0.05 : mediaQuery.size.width * 0.15,
                    right:layoutDecide? mediaQuery.size.width * 0.05 : mediaQuery.size.width * 0.15),
                  width: layoutDecide
                      ? mediaQuery.size.width
                      : mediaQuery.size.width * 0.55,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Logo(),
                      SizedBox(height: size.height * 0.07),
                      EditText(
                        placeholder: "Email",
                        value: bloc.email,
                        onChange: (value) => bloc.setEmail(value),
                        prefixIcon: Icons.email_sharp,
                        keyboardType: TextInputType.text,
                      ),
                      SizedBox(height: size.height * 0.02),
                      EditText(
                        placeholder: "Phone",
                        value: bloc.phone,
                        onChange: (value) => bloc.setPhone(value),
                        prefixIcon: Icons.call,
                        keyboardType: TextInputType.text,
                      ),
                      SizedBox(height: size.height * 0.02),
                      Stack(
                        alignment: AlignmentDirectional.centerEnd,
                        children: [
                          EditText(
                            placeholder: "Password",
                            value: bloc.password,
                            onChange: (value) => bloc.setPassword(value),
                            prefixIcon: Icons.lock,
                            password: !showPassword,
                            keyboardType: TextInputType.text,
                          ),
                          InkWell(
                            child: Icon(
                              Icons.visibility,
                              color: Colors.white,
                            ),
                            onTap: () {
                                innerSetState(() {
                                showPassword = !showPassword;
                              });
                            },
                          )
                        ],
                      ),
                      SizedBox(height: size.height * 0.02),
                      Stack(
                        alignment: AlignmentDirectional.centerEnd,
                        children: [
                          EditText(
                            placeholder: "Re-Enter Password",
                            value: bloc.repassword,
                            onChange: (value) => bloc.setRepassword(value),
                            prefixIcon: Icons.lock,
                            password: !showConfirmPassword,
                            keyboardType: TextInputType.text,
                          ),
                          InkWell(
                            child: Icon(
                              showPassword ? Icons.visibility_off : Icons.visibility,
                              color: Colors.white,
                            ),
                            onTap: () {
                              innerSetState(() {
                                showConfirmPassword = !showConfirmPassword;
                              });
                            },
                          )
                        ],
                      ),
                      SizedBox(height: size.height * 0.05),
                      InkWell(
                        child: Container(
                          padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                          width: MediaQuery.of(context).size.width,
                          color: Color.fromRGBO(225, 185, 36, 1.0),
                          child: Text(
                            "SIGN UP".toUpperCase(),
                            textAlign: TextAlign.center,
                            style: theme.buttontext,
                          ),
                        ),
                        onTap: () => {
                          if (bloc.validate(context)) bloc.signUp(context),
                        },
                      ),
                      SizedBox(height: size.height * 0.05),
                      SizedBox(height: size.height * 0.02),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            text: 'You already have an account? ',
                            style: theme.forgotpassword,
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Sign in',
                                style: theme.forgotpasswordyellow,
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Route route = MaterialPageRoute(
                                        builder: (context) => LoginPage());
                                    Navigator.push(context, route);
                                  },
                              ),
                            ]),
                      ),
                      SizedBox(height: size.height * 0.03),
                      Container(
                        padding: EdgeInsets.only(left: 30.0, right: 30.0),
                        alignment: Alignment.center,
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              text: 'By continuing, you agree to VRNA\'s',
                              style: theme.bycont,
                              children: <TextSpan>[
                                TextSpan(
                                  text: ' Terms of Use',
                                  style: theme.bycontyellow,
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Route route = MaterialPageRoute(
                                          builder: (context) =>
                                              TermsConditionPage());
                                      Navigator.push(context, route);
                                    },
                                ),
                                TextSpan(
                                  text: ' and ',
                                  style: theme.forgotpassword,
                                ),
                                TextSpan(
                                  text: 'Privacy Policy',
                                  style: theme.bycontyellow,
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Route route = MaterialPageRoute(
                                          builder: (context) =>
                                              PrivacyPolicyPage());
                                      Navigator.push(context, route);
                                    },
                                ),
                              ]),
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ]);
    });
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
              child: Text('Sign Up',
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
