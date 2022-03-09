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

class ForgotPasswordWidget {
  Widget ForgotPassword(BuildContext context, AuthBloc bloc) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Padding(
      padding: EdgeInsets.all(dimens.margin),
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
                  padding: EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
                  child: Icon(
                    Icons.lock,
                    color: Colors.white,
                    size: 30.0,
                  ),
                ),
                Container(
                  width: size.width * 0.82,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                        'Enter your email address and we will send you a link to reset your password',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.left),
                  ),
                )
              ]),
          SizedBox(height: size.height * 0.07),
          EditText(
            placeholder: "Email Address",
            value: bloc.forgotEmail,
            onChange: (value) => bloc.setForgotEmail(value),
            prefixIcon: Icons.email_sharp,
            keyboardType: TextInputType.text,
          ),
          SizedBox(height: size.height * 0.04),

          CustomButton(
              label: "RESET YOUR PASSWORD",
              onPress: () => bloc.forgotPassword(context),
              width: size.width * 0.9,
              height: size.height * 0.07),
          SizedBox(height: size.height * 0.07),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: 'Dont have an account?',
                small: true,
                color: Colors.grey,
                bold: true,
              ),
              CustomText(
                text: 'Create Account',
                small: true,
                color: Colors.yellow,
                bold: true,
              )
            ],
          ),

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
