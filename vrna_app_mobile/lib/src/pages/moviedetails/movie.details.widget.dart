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

class MovieDetailsWidget {
  Widget MovieDetails(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Padding(
      padding: EdgeInsets.all(0.0),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          MovieBanner(),
          SizedBox(height: size.height * 0.03),
          MovieDescription(),
          SizedBox(height: size.height * 0.03),
          MovieActors(),
          SizedBox(height: size.height * 0.03),
          MovieTrailor(),
          SizedBox(height: size.height * 0.03),
          MovieScene(),
          SizedBox(height: size.height * 0.03),
          RelatedMovies(),
          SizedBox(height: size.height * 0.03),
          More(),
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

class MovieBanner extends StatelessWidget {
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
                  image: AssetImage("assets/images/latest3.jpg"),
                  fit: BoxFit.cover)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.play_circle_outline,
                color: Colors.white,
                size: 30.0,
              )
            ],
          ),
        ),
        Positioned(
          top: 40.0,
          child: TopMenu(),
        )
      ],
    );
  }
}

class MovieDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
        width: size.width * 0.99,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text('JODHAA AKBAR',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center),
              SizedBox(height: size.height * 0.03),
              Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text('1h 45min',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.left),
                ),
                Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.grey,
                      child: Text("Historical"),
                      onPressed: () {},
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                    )),
                Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.grey,
                      child: Text("Ramance"),
                      onPressed: () {},
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                    ))
              ]),
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
              SizedBox(height: size.height * 0.03),
              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Container(
                  width: size.width * 0.3,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text('Actors',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.left),
                  ),
                ),
                Container(
                  width: size.width * 0.6,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                        'Aishwaya Rai, Hrithik Roshan, Sonu sood, Khubhushan Kharbanda, ila Arun',
                        style: TextStyle(
                          color: Colors.yellow,
                        ),
                        textAlign: TextAlign.left),
                  ),
                )
              ]),
              SizedBox(height: size.height * 0.001),
              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Container(
                  width: size.width * 0.3,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text('Director',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.left),
                  ),
                ),
                Container(
                  width: size.width * 0.6,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text('Ashutosh Gowariker',
                        style: TextStyle(
                          color: Colors.yellow,
                        ),
                        textAlign: TextAlign.left),
                  ),
                )
              ])
            ]));
  }
}

class MovieScene extends StatelessWidget {
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
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text('MOVIE',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5.0),
                    child: Text('SCENE',
                        style: TextStyle(
                            color: colors.appYellow,
                            fontWeight: FontWeight.bold),
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
                    Container(
                      color: Colors.green, // Yellow
                      height: 100.0,
                      width: 150.0,
                    ),
                    const Padding(padding: EdgeInsets.all(4)),
                    Container(
                      color: Colors.yellow, // Yellow
                      height: 100.0,
                      width: 150.0,
                    ),
                    const Padding(padding: EdgeInsets.all(4)),
                    Container(
                      color: Colors.blue, // Yellow
                      height: 100.0,
                      width: 150.0,
                    ),
                    const Padding(padding: EdgeInsets.all(4)),
                    Container(
                      color: Colors.red, // Yellow
                      height: 100.0,
                      width: 150.0,
                    ),
                    const Padding(padding: EdgeInsets.all(4)),
                    Container(
                      color: Colors.pink, // Yellow
                      height: 100.0,
                      width: 150.0,
                    ),
                    const Padding(padding: EdgeInsets.all(4)),
                    Container(
                      color: Colors.orange, // Yellow
                      height: 100.0,
                      width: 150.0,
                    ),
                  ],
                ),
              )
            ]));
  }
}

class RelatedMovies extends StatelessWidget {
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
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text('RELATED',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5.0),
                    child: Text('MOVIES',
                        style: TextStyle(
                            color: colors.appYellow,
                            fontWeight: FontWeight.bold),
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
                    Container(
                      color: Colors.green, // Yellow
                      height: 100.0,
                      width: 150.0,
                    ),
                    const Padding(padding: EdgeInsets.all(4)),
                    Container(
                      color: Colors.yellow, // Yellow
                      height: 100.0,
                      width: 150.0,
                    ),
                    const Padding(padding: EdgeInsets.all(4)),
                    Container(
                      color: Colors.blue, // Yellow
                      height: 100.0,
                      width: 150.0,
                    ),
                    const Padding(padding: EdgeInsets.all(4)),
                    Container(
                      color: Colors.red, // Yellow
                      height: 100.0,
                      width: 150.0,
                    ),
                    const Padding(padding: EdgeInsets.all(4)),
                    Container(
                      color: Colors.pink, // Yellow
                      height: 100.0,
                      width: 150.0,
                    ),
                    const Padding(padding: EdgeInsets.all(4)),
                    Container(
                      color: Colors.orange, // Yellow
                      height: 100.0,
                      width: 150.0,
                    ),
                  ],
                ),
              )
            ]));
  }
}

class More extends StatelessWidget {
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
                child: Text('MORE',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5.0),
                child: Text('HISTORICAL-ROMANCE',
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
                Container(
                  color: Colors.green, // Yellow
                  height: 150.0,
                  width: 100.0,
                ),
                const Padding(padding: EdgeInsets.all(4)),
                Container(
                  color: Colors.yellow, // Yellow
                  height: 150.0,
                  width: 100.0,
                ),
                const Padding(padding: EdgeInsets.all(4)),
                Container(
                  color: Colors.blue, // Yellow
                  height: 150.0,
                  width: 100.0,
                ),
                const Padding(padding: EdgeInsets.all(4)),
                Container(
                  color: Colors.red, // Yellow
                  height: 150.0,
                  width: 100.0,
                ),
                const Padding(padding: EdgeInsets.all(4)),
                Container(
                  color: Colors.pink, // Yellow
                  height: 150.0,
                  width: 100.0,
                ),
                const Padding(padding: EdgeInsets.all(4)),
                Container(
                  color: Colors.orange, // Yellow
                  height: 150.0,
                  width: 100.0,
                ),
              ],
            ),
          )
        ]));
  }
}

class MovieActors extends StatelessWidget {
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
                child: Text('MOVIE',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5.0),
                child: Text('ACTORS',
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
                Image.asset('assets/images/movieactor1.jpg',
                    fit: BoxFit.cover, width: 100.0, height: 100.0),
                const Padding(padding: EdgeInsets.all(4)),
                Image.asset('assets/images/movieactor2.jpg',
                    fit: BoxFit.cover, width: 100.0, height: 100.0),
                const Padding(padding: EdgeInsets.all(4)),
                Image.asset('assets/images/movieactor3.jpg',
                    fit: BoxFit.cover, width: 100.0, height: 100.0),
                const Padding(padding: EdgeInsets.all(4)),
                Image.asset('assets/images/movieactor4.jpg',
                    fit: BoxFit.cover, width: 100.0, height: 100.0),
                const Padding(padding: EdgeInsets.all(4)),
                Image.asset('assets/images/movieactor2.jpg',
                    fit: BoxFit.cover, width: 100.0, height: 100.0),
                const Padding(padding: EdgeInsets.all(4)),
                Image.asset('assets/images/movieactor4.jpg',
                    fit: BoxFit.cover, width: 100.0, height: 100.0),
              ],
            ),
          )
        ]));
  }
}
