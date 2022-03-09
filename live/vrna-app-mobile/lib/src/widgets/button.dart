import 'package:flutter/material.dart';
import 'package:vrna_app_mobile/src/widgets/text.dart';
import 'package:vrna_app_mobile/src/values/colors.dart' as colors;

class CustomButton extends StatelessWidget {
  final String label;
  final Function onPress;
  final bool disabled;
  final bool transparent;
  final IconData icon;
  final bool facebook;
  final bool google;
  final double width;
  final double height;
  final double _elevation = 3;

  const CustomButton({
    Key key, 
    this.label,
    this.onPress,
    this.disabled,
    this.transparent,
    this.icon,
    this.facebook,
    this.google,
    this.width,
    this.height
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final action = disabled == true ? null : onPress;

    Color backgroundColor = colors.accentColor;
    Color borderColor = colors.accentColor;
    Color textColor = Colors.white;

    if (transparent == true) {
      backgroundColor = colors.backgroundColor;
      borderColor = colors.accentLightColor;
      textColor = colors.accentLightColor;
    } else {
      backgroundColor = Color(0xFFE1B924);
      borderColor = Color(0xFFE1B924);
      textColor = Color(0xFF000101);
    }

    if (facebook == true) {
      backgroundColor = colors.facebookColor;
      borderColor = Colors.grey;
      textColor = Colors.grey;
    }

    if (google == true) {
      backgroundColor = colors.googleColor;
      borderColor = colors.googleColor;
      textColor = Colors.black;
    }
    
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child:ButtonTheme(
      minWidth: width,
      height: height,
      child: RaisedButton(
        padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 36.0),
        shape: RoundedRectangleBorder(
          side: BorderSide( color: borderColor ),
          borderRadius: BorderRadius.circular(0)
        ),
        onPressed: action,
        elevation: _elevation,
        color: backgroundColor,
        child: CustomText(text: label ?? "Label", small: true, color: textColor,bold: true, )
      ),
    )
    );
  }
}