import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:vrna_app_mobile/src/blocs/auth.bloc.dart';
import 'package:vrna_app_mobile/src/values/devicescreen.dart';
import 'package:vrna_app_mobile/src/widgets/button.dart';
import 'package:vrna_app_mobile/src/widgets/edit_text.dart';
import 'package:vrna_app_mobile/src/widgets/text.dart';
import 'package:vrna_app_mobile/src/widgets/logo.dart';
import 'package:vrna_app_mobile/src/pages/termsconditions/termscondition.page.dart';
import 'package:vrna_app_mobile/src/pages/privacypolicy/privacypolicy.page.dart';
import 'package:vrna_app_mobile/src/pages/forgotpassword/forgotpassword.page.dart';
import 'package:vrna_app_mobile/src/pages/signup/signup.page.dart';
import 'package:vrna_app_mobile/src/values/dimens.dart' as dimens;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:vrna_app_mobile/src/widgets/themeTV.dart';
import '../../widgets/theme.dart' as customTheme;

class LoginWidget {
  
  Widget form(BuildContext context, AuthBloc bloc) {
    var mediaQuery = MediaQuery.of(context);
    var device = getDeviceType(mediaQuery);
    customTheme.Theme theme = customTheme.Theme.getTheme(device);
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Padding(
      padding: EdgeInsets.all(dimens.margin),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: size.height * 0.07),
          Logo(),
          SizedBox(height: size.height * 0.12), 
          EditText(
            placeholder: "Temporary Password",
            value: bloc.tempPassword,
            onChange: (value) => bloc.setTempPassword(value),
            prefixIcon: Icons.lock,
            password: true,
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
          ),
          SizedBox(height: size.height * 0.02),
          EditText(
            placeholder: "Confirm Password",
            // value: bloc.password,
            // onChange: (value) => bloc.setPassword(value),
            prefixIcon: Icons.lock,
            password: true,
            keyboardType: TextInputType.text,
          ),
          SizedBox(height: 40.0),
          InkWell(
            child: Container(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              width: MediaQuery.of(context).size.width,
              color: Color.fromRGBO(225, 185, 36, 1.0),
              child: Text(
                "UPDATE PASSWORD",
                textAlign: TextAlign.center,
                style: theme.buttontext,
              ),
            ),
            onTap: () => {bloc.updatePassword(context)},
          ),
          SizedBox(height: 30.0), 
        ],
      ),
    ));
  }
}
