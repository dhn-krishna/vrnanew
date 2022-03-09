import 'package:flutter/material.dart';
import 'package:vrna_app_mobile/src/blocs/auth.bloc.dart';
import 'package:vrna_app_mobile/src/widgets/button.dart';
import 'package:vrna_app_mobile/src/widgets/edit_text.dart';
import 'package:vrna_app_mobile/src/widgets/text.dart';
import 'package:vrna_app_mobile/src/widgets/logo.dart';
import 'package:vrna_app_mobile/src/pages/termsconditions/termscondition.page.dart';
import 'package:vrna_app_mobile/src/pages/privacypolicy/privacypolicy.page.dart';
import 'package:vrna_app_mobile/src/pages/forgotpassword/forgotpassword.page.dart';
import 'package:vrna_app_mobile/src/pages/signup/signup.page.dart';
import 'package:vrna_app_mobile/src/values/dimens.dart' as dimens;

class LoginWidget {
  Widget form(BuildContext context, AuthBloc bloc) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Padding(
      padding: EdgeInsets.all(dimens.margin),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: size.height * 0.15),
          Logo(),
          SizedBox(height: size.height * 0.12),
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
          SizedBox(height: size.height * 0.02),
          CustomButton(
              label: "LOGIN",
              onPress: () => bloc.signIn(context),
              // onPress: () {
              //   Route route =
              //       MaterialPageRoute(builder: (context) => DashboardPage());
              //   Navigator.push(context, route);
              // },
              width: size.width * 0.9,
              height: size.height * 0.07),
          SizedBox(height: size.height * 0.03),
          InkWell(
            child: CustomText(
              text: 'Forgot password ?',
              small: true,
              color: Colors.grey,
              bold: true,
            ),
            onTap: () {
              Route route =
                  MaterialPageRoute(builder: (context) => ForgotPasswordPage());
              Navigator.push(context, route);
            },
          ),
          SizedBox(height: size.height * 0.02),
          CustomText(
            text: '---------     or    ---------',
            small: true,
            color: Colors.grey,
            bold: true,
          ),
          SizedBox(height: size.height * 0.01),
          CustomButton(
              label: "Continue with Google",
              onPress: () => null,
              width: size.width * 0.9,
              height: size.height * 0.07,
              google: true),
          SizedBox(height: size.height * 0.01),
          CustomButton(
              label: "Continue with Facebook",
              onPress: () => null,
              width: size.width * 0.9,
              height: size.height * 0.07,
              facebook: true),
          SizedBox(height: size.height * 0.02),
          InkWell(
            child: CustomText(
              text: 'Create Account Instead?',
              small: true,
              color: Colors.grey,
              bold: true,
            ),
            onTap: () {
              Route route =
                  MaterialPageRoute(builder: (context) => SignupPage());
              Navigator.push(context, route);
            },
          ),

          SizedBox(height: size.height * 0.03),
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('By continuing, you agree to VRNA ',
                style: TextStyle(
                  color: Colors.white,
                ),
                textAlign: TextAlign.left),
            InkWell(
              child: Text('Terms of Use',
                  style: TextStyle(
                    color: Colors.yellow,
                  ),
                  textAlign: TextAlign.left),
              onTap: () {
                Route route = MaterialPageRoute(
                    builder: (context) => TermsConditionPage());
                Navigator.push(context, route);
              },
            ),
            Text('and ',
                style: TextStyle(
                  color: Colors.white,
                ),
                textAlign: TextAlign.left),
          ]),
          InkWell(
            child: Text('Privacy Policy',
                style: TextStyle(
                  color: Colors.yellow,
                ),
                textAlign: TextAlign.center),
            onTap: () {
              Route route =
                  MaterialPageRoute(builder: (context) => PrivacyPolicyPage());
              Navigator.push(context, route);
            },
          )

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
