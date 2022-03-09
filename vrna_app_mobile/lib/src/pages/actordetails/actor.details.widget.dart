import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
// import 'package:vrna_app_mobile/src/blocs/auth.bloc.dart';
import 'package:vrna_app_mobile/src/widgets/button.dart';
import 'package:vrna_app_mobile/src/widgets/edit_text.dart';
import 'package:vrna_app_mobile/src/widgets/text.dart';
import 'package:vrna_app_mobile/src/widgets/logo.dart';
import 'package:vrna_app_mobile/src/pages/moviedetails/movie.trailors.dart';
import 'package:vrna_app_mobile/src/values/colors.dart' as colors;
import 'package:vrna_app_mobile/src/values/dimens.dart' as dimens;

class ActorDetailsWidget {
  Widget ActorDetails(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Padding(
      padding: EdgeInsets.all(0.0),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: size.height * 0.02),
          TopMenu(),
          SizedBox(height: size.height * 0.03),
          ActorBanner(),
          SizedBox(height: size.height * 0.03),
          HisMovies(),
          SizedBox(height: size.height * 0.03),
          ActorAbout(),
          SizedBox(height: size.height * 0.03),
          MovieTrailor(),
          SizedBox(height: size.height * 0.03),
          ActorInformation(),
          SizedBox(height: size.height * 0.03),
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
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Icon(
                Icons.keyboard_backspace,
                color: Colors.white,
                size: 30.0,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Text('Actor',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left),
            ),
            Row(children: [
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Icon(
                  Icons.share_outlined,
                  color: Colors.white,
                  size: 30.0,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                  size: 30.0,
                ),
              )
            ]),
          ]),
        ));
  }
}

class ActorBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Container(
          width: size.width * 1,
          height: size.height * 0.25,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/actor5.jpg"),
                  fit: BoxFit.cover)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text('KEANUREEVES',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text('Actor',
                    style: TextStyle(
                        color: Colors.yellow, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class ActorAbout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
        width: size.width * 0.99,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: size.height * 0.03),
              Padding(
                  padding: EdgeInsets.all(0.20),
                  child: Image.asset('assets/images/actor6.jpg',
                      fit: BoxFit.cover,
                      height: size.height * 0.3,
                      width: size.width * 0.95)),
              SizedBox(height: size.height * 0.03),
              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Container(
                  width: size.width * 0.92,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.left),
                  ),
                )
              ]),
              SizedBox(height: size.height * 0.01),
            ]));
  }
}

class ActorInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
        // margin: EdgeInsets.symmetric(vertical: 10),
        width: size.width * 0.99,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Container(
                      width: size.width * 0.92,
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.left),
                      ),
                    )
                  ]),
                ],
              ),
              const Padding(padding: EdgeInsets.all(2)),
            ]));
  }
}

class HisMovies extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        width: size.width * 0.99,
        child: Column(children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text('HIS',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5.0),
                child: Text('MOVIES',
                    style: TextStyle(
                        color: colors.appYellow, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left),
              ),
            ],
          ),
          const Padding(padding: EdgeInsets.all(2)),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                const Padding(padding: EdgeInsets.all(4)),
                Image.asset('assets/images/relatedmovie1.jpg',
                    fit: BoxFit.cover, height: 150.0, width: 100.0),
                const Padding(padding: EdgeInsets.all(4)),
                Image.asset('assets/images/relatedmovie2.jpg',
                    fit: BoxFit.cover, height: 150.0, width: 100.0),
                const Padding(padding: EdgeInsets.all(4)),
                Image.asset('assets/images/relatedmovie3.jpg',
                    fit: BoxFit.cover, height: 150.0, width: 100.0),
                const Padding(padding: EdgeInsets.all(4)),
                Image.asset('assets/images/relatedmovie4.jpg',
                    fit: BoxFit.cover, height: 150.0, width: 100.0),
                const Padding(padding: EdgeInsets.all(4)),
                Image.asset('assets/images/relatedmovie2.jpg',
                    fit: BoxFit.cover, height: 150.0, width: 100.0),
                const Padding(padding: EdgeInsets.all(4)),
                Image.asset('assets/images/relatedmovie4.jpg',
                    fit: BoxFit.cover, height: 150.0, width: 100.0),
              ],
            ),
          )
        ]));
  }
}
