import 'package:flutter/material.dart';
import 'colors.dart' as colors;

final ThemeData theme = ThemeData(
  primaryColor: colors.primaryColor,
  accentColor: colors.accentColor,
   scaffoldBackgroundColor: colors.transparent,

  appBarTheme: AppBarTheme(
     color: colors.transparent,
    iconTheme: IconThemeData(color: colors.accentLightColor)
  ),

  buttonTheme: ButtonThemeData(
    buttonColor: colors.accentLightColor,
    disabledColor: colors.primaryColorDark
  )
);
