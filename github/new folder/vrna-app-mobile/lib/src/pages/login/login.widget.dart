import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:vrna_app_mobile/src/blocs/auth.bloc.dart';
import 'package:vrna_app_mobile/src/values/devicescreen.dart';
import 'package:vrna_app_mobile/src/widgets/edit_text.dart';
import 'package:vrna_app_mobile/src/widgets/logo.dart';
import 'package:vrna_app_mobile/src/pages/termsconditions/termscondition.page.dart';
import 'package:vrna_app_mobile/src/pages/privacypolicy/privacypolicy.page.dart';
import 'package:vrna_app_mobile/src/pages/forgotpassword/forgotpassword.page.dart';
import 'package:vrna_app_mobile/src/pages/signup/signup.page.dart';
import 'package:vrna_app_mobile/src/values/dimens.dart' as dimens;
import '../../widgets/theme.dart' as customTheme;

class LoginWidget {
  Widget form(BuildContext context, AuthBloc bloc) {
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
            //  padding: EdgeInsets.only(right: 50.0),
              width: layoutDecide
                  ? mediaQuery.size.width
                  : mediaQuery.size.width * 0.50,
              child: layoutDecide
                  ? Text("")
                  : Image.asset(
                      "assets/loginbg.png",
                      height: MediaQuery.of(context).size.height - 40.0,
                      fit: BoxFit.fitWidth,
                    ),
            ),
            Container(
              padding:EdgeInsets.only(left:mediaQuery.size.width*0.10, right:mediaQuery.size.width*0.10),
              width: layoutDecide
                  ? mediaQuery.size.width
                  : mediaQuery.size.width * 0.45,
               
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: size.height * 0.03),
                    Logo(),
                    SizedBox(height: size.height * 0.03),
                    EditText(
                      placeholder: "Username/Email Address",
                      value: bloc.login,
                      onChange: (value) => bloc.setLogin(value),
                      prefixIcon: Icons.person,
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(height: size.height * 0.02),
                    EditText(
                      placeholder: "Password",
                      value: bloc.password,
                      onChange: (value) => bloc.setPassword(value),
                      prefixIcon: Icons.lock,
                      password: true,
                      keyboardType: TextInputType.text,
                      onSubmit: () => bloc.signIn(context),
                    ),
                    SizedBox(height: 40.0),
                    InkWell(
                      child: Container(
                        padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                        width: MediaQuery.of(context).size.width,
                        color: Color.fromRGBO(225, 185, 36, 1.0),
                        child: Text(
                          "Login".toUpperCase(),
                          textAlign: TextAlign.center,
                          style: theme.buttontext,
                        ),
                      ),
                      onTap: () => {bloc.signIn(context)},
                    ),
                    SizedBox(height: 25.0),
                    InkWell(
                      child: Text(
                        "Forgot Password?",
                        textAlign: TextAlign.center,
                        style: theme.forgotpassword,
                      ),
                      onTap: () {
                        Route route = MaterialPageRoute(
                            builder: (context) => ForgotPasswordPage());
                        Navigator.push(context, route);
                      },
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.only(right: 10.0),
                          width: 100.0,
                          child: Divider(
                            thickness: 1,
                            color: Colors.white,
                            height: 2.0,
                          ),
                        ),
                        Text(
                          "or",
                          textAlign: TextAlign.center,
                          style: theme.ortxt,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10.0),
                          width: 100.0,
                          child: Divider(
                            thickness: 1,
                            color: Colors.white,
                            height: 2.0,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Text(
                        "Continue with",
                        textAlign: TextAlign.center,
                        style: theme.forgotpassword,
                      ),
                    SizedBox(height: 20.0),
                    Flex(
                      mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          direction: layoutDecide ? Axis.horizontal : Axis.horizontal,
                      children: [
                        InkWell(
                          child: Image(
                                    image: AssetImage("assets/google.png"),
                                    width: 38.0,
                                    height: 38.0,
                                  ),
                          onTap: () => {bloc.googleSignIn(context)},
                        ),
                        SizedBox(width: 20.0),
                        InkWell(
                          child: Image(
                                    image: AssetImage("assets/fb.png"),
                                    width: 38.0,
                                    height: 38.0,
                                  ),
                          onTap: () => {
                            bloc.facebookSignIn(context),
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 30.0), 
                    RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            text: 'Create Account Instead? ',
                            style: theme.forgotpassword,
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Signup',
                                style: theme.forgotpasswordyellow,
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Route route = MaterialPageRoute(
                                        builder: (context) =>
                                            SignupPage());
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
                                style: theme.bycont,
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
                    SizedBox(height: 10.0),
                  ],
                ),
              
            )
          ],
        ),
      )
    ]);
  }
}
