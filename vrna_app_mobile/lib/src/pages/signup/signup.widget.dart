import 'package:flutter/material.dart';
import 'package:vrna_app_mobile/src/blocs/auth.bloc.dart';
import 'package:vrna_app_mobile/src/pages/dashboard/dashboard.page.dart';
import 'package:vrna_app_mobile/src/widgets/button.dart';
import 'package:vrna_app_mobile/src/widgets/edit_text.dart';
import 'package:vrna_app_mobile/src/widgets/text.dart';
import 'package:vrna_app_mobile/src/widgets/logo.dart';
import 'package:vrna_app_mobile/src/pages/termsconditions/termscondition.page.dart';
import 'package:vrna_app_mobile/src/pages/privacypolicy/privacypolicy.page.dart';
import 'package:vrna_app_mobile/src/pages/login/login.page.dart';
import 'package:vrna_app_mobile/src/values/dimens.dart' as dimens;

class SignupWidget {
  Widget Signup(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Padding(
      padding: EdgeInsets.all(dimens.margin),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: size.height * 0.02),
          TopMenu(),
          SizedBox(height: size.height * 0.10),
          Logo(),
          SizedBox(height: size.height * 0.07),
          EditText(
            placeholder: "Email",
            // value: bloc.login,
            // onChange: (value) => bloc.setLogin(value),
            prefixIcon: Icons.email_sharp,
            keyboardType: TextInputType.text,
          ),
          SizedBox(height: size.height * 0.02),
          EditText(
            placeholder: "Phone",
            // value: bloc.login,
            // onChange: (value) => bloc.setLogin(value),
            prefixIcon: Icons.call,
            keyboardType: TextInputType.text,
          ),
          SizedBox(height: size.height * 0.02),
          EditText(
            placeholder: "Password",
            // value: bloc.login,
            // onChange: (value) => bloc.setLogin(value),
            prefixIcon: Icons.lock,
            password: true,
            keyboardType: TextInputType.text,
          ),
          SizedBox(height: size.height * 0.02),
          EditText(
            placeholder: "Re-Enter Password",
            // value: bloc.login,
            // onChange: (value) => bloc.setLogin(value),
            prefixIcon: Icons.lock,
            password: true,
            keyboardType: TextInputType.text,
          ),
          SizedBox(height: size.height * 0.04),
          CustomButton(
              label: "SIGN UP",
              // onPress: () => bloc.signIn(),
              onPress: () {},
              width: size.width * 0.9,
              height: size.height * 0.07),
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
              text: 'You already have an account?',
              small: true,
              color: Colors.grey,
              bold: true,
            ),
            onTap: () {
              Route route =
                  MaterialPageRoute(builder: (context) => LoginPage());
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
