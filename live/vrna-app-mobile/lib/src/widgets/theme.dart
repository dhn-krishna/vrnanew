import 'package:vrna_app_mobile/src/pages/contactus/contactus.page.dart';
import 'package:vrna_app_mobile/src/pages/dashboard/dashboard.page.dart';
import 'package:vrna_app_mobile/src/pages/profile/profile.page.dart';
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
  static BuildContext get context => null;

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
  
final appYellow = Color(0xFFE1B924);
  final buttontextbig = TextStyle(
      color: Color.fromRGBO(0, 1, 1, 1.0),
      fontSize: 14.0,
      fontFamily: 'Roboto Light',
      fontWeight: FontWeight.w300,
      );
 final buttontext = TextStyle(
      color: Color.fromRGBO(0, 1, 1, 1.0),
      fontSize: 20.0,
      fontFamily: 'Roboto Light',
      fontWeight: FontWeight.w300,); 
       final buttontextwt = TextStyle(
      color: Colors.white,
      fontSize: 20.0,
      fontFamily: 'Roboto Light',
      fontWeight: FontWeight.w300,);
  final buttontextwhite = TextStyle(
      color: Color.fromRGBO(255, 255, 255, 1.0),
      fontSize: 14.0,
      fontFamily: 'Roboto Light',
      fontWeight: FontWeight.w300,);
  final buttontextgrey = TextStyle(
      color: Color.fromRGBO(147, 143, 138, 1.0),
      fontSize: 14.0,
      fontFamily: 'Roboto Light',
      fontWeight: FontWeight.w300,);
  final forgotpassword = TextStyle(
      color: Color.fromRGBO(206, 206, 206, 0.8),
      fontSize: 16.0,
      fontFamily: 'Roboto Light',
      fontWeight: FontWeight.w300,
      letterSpacing: 1.0, );
  final forgotpasswordyellow = TextStyle(
      color: Color.fromRGBO(225, 185, 36, 0.8),
      fontSize: 16.0,
      fontFamily: 'Roboto Light',
      fontWeight: FontWeight.w300,
      letterSpacing: 1.0, );
  final ortxt = TextStyle(
      color: Color.fromRGBO(206, 206, 206, 0.8),
      fontSize: 16.0,
      fontFamily: 'Roboto Light',
      fontWeight: FontWeight.w300,
      letterSpacing: 1.0, );
  final contgoogle = TextStyle(
      color: Color.fromRGBO(0, 1, 1, 1.0),
      fontSize: 14.0,
      fontFamily: 'Roboto Light',
      fontWeight: FontWeight.w300,
      letterSpacing: 1.0, );
  final contfb = TextStyle(
      color: Color.fromRGBO(172, 172, 172, 1.0),
      fontSize: 14.0,
      fontFamily: 'Roboto Light',
      fontWeight: FontWeight.w300,
      letterSpacing: 1.0, );

  final bycont = TextStyle(
      color: Color.fromRGBO(206, 206, 206, 0.8),
      fontSize: 14.0,
      height: 1.4,
      fontFamily: 'Roboto Light',
      fontWeight: FontWeight.w300,
      letterSpacing: 1.0, );

  final bycontyellow = TextStyle(
      color: Color.fromRGBO(225, 185, 36, 0.8),
      fontSize: 14.0,
      height: 1.4,
      fontFamily: 'Roboto Light',
      fontWeight: FontWeight.w300,
      letterSpacing: 1.0, );

  final entermail = TextStyle(
      color: Color.fromRGBO(206, 206, 206, 0.8),
      fontFamily: 'Roboto Light',
      fontWeight: FontWeight.w300,
      letterSpacing: 1.0,
      fontSize: 16.0,
      height: 1.4, );

  final termscontent = TextStyle(
      color: Color.fromRGBO(148, 181, 198, 1.0),
      fontSize: 14.0,
      fontFamily: 'Roboto Light',
      fontWeight: FontWeight.w300,
      letterSpacing: 1.4, );

  final termsheading = TextStyle(
      color: Color.fromRGBO(255, 255, 255, 1.0),
      fontSize: 18.0,
      fontFamily: 'Candara',
      fontWeight: FontWeight.w400,
      letterSpacing: 1.4, );

  final termsheadingsub = TextStyle(
      color: Color.fromRGBO(255, 255, 255, 1.0),
      fontSize: 16.0,
      fontFamily: 'Candara',
      fontWeight: FontWeight.w400,
      letterSpacing: 1.0, );

  final termsappbarheading = TextStyle(
      color: Color.fromRGBO(255, 255, 255, 1.0),
      fontSize: 18.0,
      fontFamily: 'Candara',
      fontWeight: FontWeight.w400,
      letterSpacing: 1.0, );

  final bullet = Container(
    alignment: Alignment.topLeft,
    width: 5.0,
    height: 5.0,
    color: Color.fromRGBO(148, 181, 198, 1.0),
    margin: EdgeInsets.only(top: 5.0),
  );
  
  final bannerwhitehead = TextStyle(
      color: Color.fromRGBO(255, 255, 255, 1.0),
      fontSize: 55.0,
      fontFamily: 'Candara',
      fontWeight: FontWeight.w400,
      letterSpacing: 1.0, );

  final latesthead = TextStyle(
      color: Color.fromRGBO(255, 255, 255, 1.0),
      fontSize: 45.0,
      fontFamily: 'Candara',
      fontWeight: FontWeight.w400,
      letterSpacing: 1.0, );

  final latestheadyellow = TextStyle(
      color: Color.fromRGBO(225, 185, 36, 0.8),
      fontSize: 45.0,
      fontFamily: 'Candara',
      letterSpacing: 1.0,
      fontWeight: FontWeight.w400);
  final unsellabel = TextStyle(
      fontSize: 16.0,
      color: Color.fromRGBO(117, 110, 129, 1),
      fontStyle: FontStyle.normal,
      fontFamily: 'Roboto Light',
      fontWeight: FontWeight.w300,
      height: 1.3, );

  final tablabelstyle = TextStyle(
      fontSize: 16.0,
      color: Color.fromRGBO(117, 110, 129, 1),
      fontStyle: FontStyle.normal,
      fontFamily: 'Roboto Light',
      fontWeight: FontWeight.w300,
      height: 1.3, );

  final actorname = TextStyle(
      fontSize: 18.0,
      color: Color.fromRGBO(255, 255, 255, 1),
      fontStyle: FontStyle.normal,
      fontFamily: 'Roboto Light',
      fontWeight: FontWeight.w300,
      height: 1.3, );

  final director = TextStyle(
      fontSize: 18.0,
      color: Color.fromRGBO(255, 255, 255, 1),
      fontStyle: FontStyle.normal,
		  fontFamily: 'Candara',
		  fontWeight: FontWeight.w400,
      height: 1.3, );
  final directoryellow = TextStyle(
      fontSize: 18.0,
      color: Color.fromRGBO(225, 185, 36, 0.8),
      fontStyle: FontStyle.normal,
		  fontFamily: 'Candara',
		  fontWeight: FontWeight.w400,
      height: 1.3, );
  final fmoviedesc = TextStyle(
      fontSize: 20.0,
      color: Color.fromRGBO(181, 201, 214, 1.0),
      fontStyle: FontStyle.normal,
      fontFamily: 'Roboto Light',
      height: 1.3,
      fontWeight: FontWeight.w300);

  final raterace = TextStyle(
      fontSize: 30.0,
      color: Color.fromRGBO(225, 185, 36, 0.8),
      fontStyle: FontStyle.normal,
      fontFamily: 'Candara',
      fontWeight: FontWeight.w400,
      height: 1.3,
      );

  final moviehead = TextStyle(
      fontSize: 18.0,
      color: Color.fromRGBO(225, 185, 36, 1.0),
      fontStyle: FontStyle.normal,
		  fontFamily: 'Candara',
		  fontWeight: FontWeight.w400,
      height: 1.3, );

  final yrlang = TextStyle(
      fontSize: 14.0,
      color: Color.fromRGBO(34, 188, 238, 1.0),
      fontStyle: FontStyle.normal,
      fontFamily: 'Roboto Light',
      fontWeight: FontWeight.w300,
      height: 1.3, );

  final moviedesc = TextStyle(
      fontSize: 14.0,
      color: Color.fromRGBO(255, 255, 255, 1.0),
      fontStyle: FontStyle.normal,
      fontFamily: 'Roboto Light',
      fontWeight: FontWeight.w300,
      height: 1.3, );

  final moviedescyel = TextStyle(
      fontSize: 14.0,
      color: Color.fromRGBO(225, 185, 36, 1.0),
      fontStyle: FontStyle.normal,
      fontFamily: 'Roboto Light',
      fontWeight: FontWeight.w300,
      height: 1.3, );

  final movieheadwhite = TextStyle(
      fontSize: 20.0,
      color: Color.fromRGBO(225, 255, 255, 1.0),
      fontStyle: FontStyle.normal,
		  fontFamily: 'Candara',
		  fontWeight: FontWeight.w400,
      height: 1.3, );

  final movietype = TextStyle(
      fontSize: 14.0,
      color: Color.fromRGBO(225, 255, 255, 0.7),
      fontStyle: FontStyle.normal,
      fontFamily: 'Roboto Light',
      fontWeight: FontWeight.w300,
      height: 1.3, );

  final moviefare = TextStyle(
      fontSize: 16.0,
      color: Color.fromRGBO(225, 255, 255, 1.0),
      fontStyle: FontStyle.normal,
      fontFamily: 'Roboto Light',
      fontWeight: FontWeight.w300,
      height: 1.3, );


      final tabbartxt = TextStyle(        
        color: Colors.white,
      fontSize: 25.0,
      height: 1.4,
		  fontFamily: 'Candara',
		  fontWeight: FontWeight.w400,
      letterSpacing: 1.0, 
      );
  final userintro = TextStyle(
      color: Color.fromRGBO(206, 206, 206, 0.8),
      fontSize: 28.0,
      height: 1.4,
		  fontFamily: 'Candara',
		  fontWeight: FontWeight.w400,
      letterSpacing: 1.0, );

  final userintroyellow = TextStyle(
      color: Color.fromRGBO(225, 185, 36, 0.8),
      fontSize: 28.0,
      height: 1.4,
		  fontFamily: 'Candara',
		  fontWeight: FontWeight.w400,
      letterSpacing: 1.0, );


  final mainmenu = TextStyle(
      fontSize: 20.0,
      color:Colors.white,
      height:1.2,
		  fontFamily: 'Candara',
		  fontWeight: FontWeight.w400,
  );

final submenu =TextStyle(
                              fontSize: 18.0,
                              color:Color.fromRGBO(146, 179, 195, 1.0),
                              height:1.2,
      fontFamily: 'Roboto Light',
      fontWeight: FontWeight.w300,
                            );    

                            final submenublack =TextStyle(
                              fontSize: 15.0,
                              color:Colors.black,
                              height:1.2,
      fontFamily: 'Roboto Light',
      fontWeight: FontWeight.w300,
                            ); 

final submenuwhite =TextStyle(
fontSize: 15.0,
color:Color.fromRGBO(127, 155, 170, 1.0),
height:1.2,
      fontFamily: 'Roboto Light',
      fontWeight: FontWeight.w300,
);    

final logout =TextStyle(
fontSize: 15.0,
color:Color.fromRGBO(149, 182, 199, 1.0),
height:1.2,
      fontFamily: 'Roboto Light',
      fontWeight: FontWeight.w300,
);   

final applyfilter =TextStyle(
fontSize: 15.0,
color:Colors.black,
height:1.2,
      fontFamily: 'Roboto Light',
      fontWeight: FontWeight.w300,
); 


final submenuhideshow =TextStyle(
                              fontSize: 18.0,
                              color:Color.fromRGBO(226, 186, 31, 1.0),
                              height:1.2,
      fontFamily: 'Roboto Light',
      fontWeight: FontWeight.w300,
                            ); 






final commonfooter = 

Container(
  padding:EdgeInsets.only(top:20.0),
  decoration: BoxDecoration( 
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment
                                .bottomCenter, // 10% of the width, so there are ten blinds.
                            colors: <Color>[
                              Color.fromRGBO(7, 10, 13, 0.8),
                              Color.fromRGBO(136, 106, 46, 1),
                              Color.fromRGBO(188, 139, 42, 1),
                            ], // red to yellow
                            tileMode: TileMode
                                .repeated, // repeats the gradient over the canvas
                          ), 

                         
                          
                          
          ),
          child: Column(
            mainAxisAlignment:MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [


              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                
                children: [
                InkWell(
                  child:Text("Home",
                style: TextStyle(color: Colors.white, fontSize: 14.0, 
      fontFamily: 'Roboto Light',
      fontWeight: FontWeight.w300,)),
      onTap: () {
                        Route route = MaterialPageRoute(
                            builder: (context) => DashboardPage());
                        Navigator.pushReplacement(context, route);
                      }
                ),
                SizedBox(width:15.0),
                InkWell(
                  child:Text("Profile",
                style: TextStyle(color: Colors.white, fontSize: 14.0, 
      fontFamily: 'Roboto Light',
      fontWeight: FontWeight.w300,)),
      onTap: () {
                        Route route = MaterialPageRoute(
                            builder: (context) => ProfilePage());
                        Navigator.pushReplacement(context, route);
                      }
                ),
                SizedBox(width:15.0),
                InkWell(
                  child:Text("Rented",
                style: TextStyle(color: Colors.white, fontSize: 14.0, 
      fontFamily: 'Roboto Light',
      fontWeight: FontWeight.w300,)),
      onTap: () => {loadFilteredMovies('rented')}
                ),
                SizedBox(width:15.0),
                InkWell(
                  child:Text("Support",
                style: TextStyle(color: Colors.white, fontSize: 14.0, 
      fontFamily: 'Roboto Light',
      fontWeight: FontWeight.w300,)),
      onTap: () {
                      Route route = MaterialPageRoute(
                          builder: (context) => ContactUsPage());
                      Navigator.pushReplacement(context, route);
                    },
                ), 

              ],),
SizedBox(height:15.0),

Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                
                children: [
                InkWell(
                  child:Text("Privacy Policy",
                style: TextStyle(color: Colors.white, fontSize: 14.0, 
      fontFamily: 'Roboto Light',
      fontWeight: FontWeight.w300,)),
                ),
                SizedBox(width:15.0),
                InkWell(
                  child:Text("Terms of Use",
                style: TextStyle(color: Colors.white, fontSize: 14.0, 
      fontFamily: 'Roboto Light',
      fontWeight: FontWeight.w300,)),
                ),

              ],),
SizedBox(height:15.0),

               Text("© 2021 VRNA Media Markets",
                style: TextStyle(color: Colors.white, fontSize: 14.0, 
      fontFamily: 'Roboto Light',
      fontWeight: FontWeight.w300,)),

SizedBox(height:15.0),

            ],
          ),
);

  static loadFilteredMovies(String s) {}

}

