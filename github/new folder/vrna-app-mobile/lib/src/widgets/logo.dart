import 'package:flutter/material.dart';
import 'package:vrna_app_mobile/src/values/devicescreen.dart';

class Logo extends StatelessWidget {
  final bool header;
  final bool small;

  const Logo({Key key, this.small, this.header}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var device = getDeviceType(mediaQuery);
    Size size = MediaQuery.of(context).size;
    double widthSize = mediaQuery.size.width * 0.6;
    if (device == DeviceScreenType.Tablet) {
      widthSize = size.width * 0.3;
    } else if (device == DeviceScreenType.Desktop) {
      widthSize = mediaQuery.size.width * 0.3;
    }

    var _logo = new AssetImage("assets/logo.png");
    var _logoHeader = new AssetImage("assets/logo_header.png");

    return Image(
      image: header == true ? _logoHeader : _logo,
     width: 200.0,
      //width: widthSize,
      // width: small == true ? 180 : size.width * 0.6,
      //fit: BoxFit.cover,
    );
  }
}
