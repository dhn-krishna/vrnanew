import 'package:vrna_app_mobile/src/values/devicescreen.dart';
import 'package:vrna_app_mobile/src/widgets/themeTV.dart';
import 'package:vrna_app_mobile/src/widgets/themeWEB.dart';
import 'package:vrna_app_mobile/src/widgets/themeIPAD.dart';
import 'package:vrna_app_mobile/src/widgets/themeMOBILE.dart';
// import 'colors.dart' as colors;

import 'dart:ui';
import 'package:flutter/material.dart';
import 'theme.dart' as customStyles;

class Theme {
  static Theme getTheme(device) {
    if (device == DeviceScreenType.Tv) {
      return TvTheme();
    } else if (device == DeviceScreenType.Desktop) {
      return WEBTheme();
    } else if (device == DeviceScreenType.Tablet) {
      return IPADTheme();
    } else if (device == DeviceScreenType.Mobile) {
      return MOBILETheme();
    }
  }

  final homecarouselheight = 500.0;
  final latestthumbwidth = 200.0;
  final latestthumbheight = 300.0;
  final latestthumbwidth1 = 300.0;
  final latestthumbheight1 = 200.0;
  final featactwidth = 200.0;
  final featactheight = 200.0;
  final topmoviewidth = 200.0;
  final topmovieheight = 300.0;
  
  final buttontextbig = TextStyle(
      color: Color.fromRGBO(0, 1, 1, 1.0),
      fontSize: 14.0,
      fontFamily: 'SF UI Display',
      fontWeight: FontWeight.bold);
  final buttontext = TextStyle(
      color: Color.fromRGBO(0, 1, 1, 1.0),
      fontSize: 14.0,
      fontFamily: 'SF UI Display',
      fontWeight: FontWeight.bold);
  final buttontextwhite = TextStyle(
      color: Color.fromRGBO(255, 255, 255, 1.0),
      fontSize: 14.0,
      fontFamily: 'SF UI Display',
      fontWeight: FontWeight.bold);
  final buttontextgrey = TextStyle(
      color: Color.fromRGBO(147, 143, 138, 1.0),
      fontSize: 14.0,
      fontFamily: 'SF UI Display',
      fontWeight: FontWeight.bold);
  final forgotpassword = TextStyle(
      color: Color.fromRGBO(206, 206, 206, 0.8),
      fontSize: 16.0,
      fontFamily: 'SF UI Display',
      letterSpacing: 1.0,
      fontWeight: FontWeight.normal);
  final forgotpasswordyellow = TextStyle(
      color: Color.fromRGBO(225, 185, 36, 0.8),
      fontSize: 16.0,
      fontFamily: 'SF UI Display',
      letterSpacing: 1.0,
      fontWeight: FontWeight.normal);
  final ortxt = TextStyle(
      color: Color.fromRGBO(206, 206, 206, 0.8),
      fontSize: 16.0,
      fontFamily: 'SF UI Display',
      letterSpacing: 1.0,
      fontWeight: FontWeight.w700);
  final contgoogle = TextStyle(
      color: Color.fromRGBO(0, 1, 1, 1.0),
      fontSize: 16.0,
      fontFamily: 'SF UI Display',
      letterSpacing: 1.0,
      fontWeight: FontWeight.w700);
  final contfb = TextStyle(
      color: Color.fromRGBO(172, 172, 172, 1.0),
      fontSize: 16.0,
      fontFamily: 'SF UI Display',
      letterSpacing: 1.0,
      fontWeight: FontWeight.w700);

  final bycont = TextStyle(
      color: Color.fromRGBO(206, 206, 206, 0.8),
      fontSize: 14.0,
      height: 1.4,
      fontFamily: 'SF UI Display',
      letterSpacing: 1.0,
      fontWeight: FontWeight.normal);

  final bycontyellow = TextStyle(
      color: Color.fromRGBO(225, 185, 36, 0.8),
      fontSize: 14.0,
      height: 1.4,
      fontFamily: 'SF UI Display',
      letterSpacing: 1.0,
      fontWeight: FontWeight.normal);

  final entermail = TextStyle(
      color: Color.fromRGBO(206, 206, 206, 0.8),
      fontFamily: 'SF UI Display',
      letterSpacing: 1.0,
      fontSize: 16.0,
      height: 1.4,
      fontWeight: FontWeight.normal);

  final termscontent = TextStyle(
      color: Color.fromRGBO(148, 181, 198, 1.0),
      fontSize: 14.0,
      fontFamily: 'SF UI Display',
      letterSpacing: 1.4,
      fontWeight: FontWeight.normal);

  final termsheading = TextStyle(
      color: Color.fromRGBO(255, 255, 255, 1.0),
      fontSize: 18.0,
      fontFamily: 'SF UI Display',
      letterSpacing: 1.4,
      fontWeight: FontWeight.normal);

  final termsheadingsub = TextStyle(
      color: Color.fromRGBO(255, 255, 255, 1.0),
      fontSize: 16.0,
      fontFamily: 'SF UI Display',
      letterSpacing: 1.0,
      fontWeight: FontWeight.normal);

  final termsappbarheading = TextStyle(
      color: Color.fromRGBO(255, 255, 255, 1.0),
      fontSize: 18.0,
      fontFamily: 'SF UI Display',
      letterSpacing: 1.0,
      fontWeight: FontWeight.normal);

  final bullet = Container(
    alignment: Alignment.topLeft,
    width: 5.0,
    height: 5.0,
    color: Color.fromRGBO(148, 181, 198, 1.0),
    margin: EdgeInsets.only(top: 5.0),
  );
  
  final bannerwhitehead = TextStyle(
      color: Color.fromRGBO(255, 255, 255, 1.0),
      fontSize: 45.0,
      fontFamily: 'SF UI Display Black',
      letterSpacing: 1.0,
      fontWeight: FontWeight.bold);

  final latesthead = TextStyle(
      color: Color.fromRGBO(255, 255, 255, 1.0),
      fontSize: 50.0,
      fontFamily: 'SF UI Display Black',
      letterSpacing: 1.0,
      fontWeight: FontWeight.bold);

  final latestheadyellow = TextStyle(
      color: Color.fromRGBO(225, 185, 36, 0.8),
      fontSize: 50.0,
      fontFamily: 'SF UI Display Black',
      letterSpacing: 1.0,
      fontWeight: FontWeight.bold);
  final unsellabel = TextStyle(
      fontSize: 16.0,
      color: Color.fromRGBO(117, 110, 129, 1),
      fontStyle: FontStyle.normal,
      fontFamily: 'SF UI Display',
      height: 1.3,
      fontWeight: FontWeight.w400);

  final tablabelstyle = TextStyle(
      fontSize: 16.0,
      color: Color.fromRGBO(117, 110, 129, 1),
      fontStyle: FontStyle.normal,
      fontFamily: 'SF UI Display',
      height: 1.3,
      fontWeight: FontWeight.w400);

  final actorname = TextStyle(
      fontSize: 18.0,
      color: Color.fromRGBO(255, 255, 255, 1),
      fontStyle: FontStyle.normal,
      fontFamily: 'SF UI Display',
      height: 1.3,
      fontWeight: FontWeight.normal);

  final director = TextStyle(
      fontSize: 18.0,
      color: Color.fromRGBO(255, 255, 255, 1),
      fontStyle: FontStyle.normal,
      fontFamily: 'SF UI Display',
      height: 1.3,
      fontWeight: FontWeight.w700);
  final directoryellow = TextStyle(
      fontSize: 18.0,
      color: Color.fromRGBO(225, 185, 36, 0.8),
      fontStyle: FontStyle.normal,
      fontFamily: 'SF UI Display',
      height: 1.3,
      fontWeight: FontWeight.w700);
  final fmoviedesc = TextStyle(
      fontSize: 16.0,
      color: Color.fromRGBO(181, 201, 214, 1.0),
      fontStyle: FontStyle.normal,
      fontFamily: 'SF UI Display',
      height: 1.3,
      fontWeight: FontWeight.w700);

  final raterace = TextStyle(
      fontSize: 18.0,
      color: Color.fromRGBO(225, 185, 36, 0.8),
      fontStyle: FontStyle.normal,
      fontFamily: 'SF UI Display',
      height: 1.3,
      fontWeight: FontWeight.w700);

  final moviehead = TextStyle(
      fontSize: 18.0,
      color: Color.fromRGBO(225, 185, 36, 1.0),
      fontStyle: FontStyle.normal,
      fontFamily: 'SF UI Display',
      height: 1.3,
      fontWeight: FontWeight.w700);

  final yrlang = TextStyle(
      fontSize: 14.0,
      color: Color.fromRGBO(34, 188, 238, 1.0),
      fontStyle: FontStyle.normal,
      fontFamily: 'SF UI Display',
      height: 1.3,
      fontWeight: FontWeight.w500);

  final moviedesc = TextStyle(
      fontSize: 14.0,
      color: Color.fromRGBO(255, 255, 255, 1.0),
      fontStyle: FontStyle.normal,
      fontFamily: 'SF UI Display',
      height: 1.3,
      fontWeight: FontWeight.w500);

  final moviedescyel = TextStyle(
      fontSize: 14.0,
      color: Color.fromRGBO(225, 185, 36, 1.0),
      fontStyle: FontStyle.normal,
      fontFamily: 'SF UI Display',
      height: 1.3,
      fontWeight: FontWeight.w500);

  final movieheadwhite = TextStyle(
      fontSize: 20.0,
      color: Color.fromRGBO(225, 255, 255, 1.0),
      fontStyle: FontStyle.normal,
      fontFamily: 'SF UI Display',
      height: 1.3,
      fontWeight: FontWeight.w700);

  final movietype = TextStyle(
      fontSize: 14.0,
      color: Color.fromRGBO(225, 255, 255, 0.7),
      fontStyle: FontStyle.normal,
      fontFamily: 'SF UI Display',
      height: 1.3,
      fontWeight: FontWeight.w700);

  final moviefare = TextStyle(
      fontSize: 16.0,
      color: Color.fromRGBO(225, 255, 255, 1.0),
      fontStyle: FontStyle.normal,
      fontFamily: 'SF UI Display',
      height: 1.3,
      fontWeight: FontWeight.w700);


      final tabbartxt = TextStyle(        
        color: Colors.white,
      fontSize: 25.0,
      height: 1.4,
      fontFamily: 'SF UI Display',
      letterSpacing: 1.0,
      fontWeight: FontWeight.normal
      );
  final userintro = TextStyle(
      color: Color.fromRGBO(206, 206, 206, 0.8),
      fontSize: 28.0,
      height: 1.4,
      fontFamily: 'SF UI Display',
      letterSpacing: 1.0,
      fontWeight: FontWeight.normal);

  final userintroyellow = TextStyle(
      color: Color.fromRGBO(225, 185, 36, 0.8),
      fontSize: 28.0,
      height: 1.4,
      fontFamily: 'SF UI Display',
      letterSpacing: 1.0,
      fontWeight: FontWeight.normal);


  final mainmenu = TextStyle(
      fontSize: 20.0,
      color:Colors.white,
      height:1.2,
      fontFamily: 'SF UI Display',
                            );

final submenu =TextStyle(
                              fontSize: 18.0,
                              color:Color.fromRGBO(146, 179, 195, 1.0),
                              height:1.2,
                            );    

                            final submenublack =TextStyle(
                              fontSize: 15.0,
                              color:Colors.black,
                              height:1.2,
                            ); 

final submenuwhite =TextStyle(
fontSize: 15.0,
color:Color.fromRGBO(127, 155, 170, 1.0),
height:1.2,
);    

final logout =TextStyle(
fontSize: 15.0,
color:Color.fromRGBO(149, 182, 199, 1.0),
height:1.2,
);   

final applyfilter =TextStyle(
fontSize: 15.0,
color:Colors.black,
height:1.2,
); 


final submenuhideshow =TextStyle(
                              fontSize: 18.0,
                              color:Color.fromRGBO(226, 186, 31, 1.0),
                              height:1.2,
                            ); 


}

      