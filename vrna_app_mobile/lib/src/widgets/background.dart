import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
            gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF070B0D), Color(0xFF19272F), Color(0xFF070A0D)])),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
         
          child,
        ],
      ),
    );
  }
}
