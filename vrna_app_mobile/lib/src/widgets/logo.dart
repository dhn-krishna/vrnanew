import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final bool header;
  final bool small;

  const Logo({Key key, this.small, this.header}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var _logo = new AssetImage("assets/logo.png");
    var _logoHeader= new AssetImage("assets/logo_header.png");

    return Image(
      image: header == true ? _logoHeader : _logo,
      width: small == true ? 180 : size.width * 0.6,
      //fit: BoxFit.cover,
    );
  }
}
