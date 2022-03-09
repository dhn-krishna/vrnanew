import 'package:flutter/material.dart';
import 'package:vrna_app_mobile/src/pages/moviedetails/movie.details.page.dart';
import 'package:vrna_app_mobile/src/pages/actordetails/actor.details.page.dart';
// import 'package:vrna_app_mobile/src/blocs/auth.bloc.dart';
import 'package:vrna_app_mobile/src/widgets/button.dart';
import 'package:vrna_app_mobile/src/widgets/edit_text.dart';
import 'package:vrna_app_mobile/src/widgets/text.dart';
import 'package:vrna_app_mobile/src/widgets/logo.dart';
import 'package:vrna_app_mobile/src/pages/dashboard/dashboard.slider.dart';
import 'package:vrna_app_mobile/src/values/colors.dart' as colors;
import 'package:vrna_app_mobile/src/values/dimens.dart' as dimens;

class DashboardWidget {
  Widget dashboard(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: size.height * 0.03),
          CustomSlider(),
          SizedBox(height: size.height * 0.03),
          LatestMovies(),
          SizedBox(height: size.height * 0.03),
          TopMovies(),
          // SizedBox(height: size.height * 0.03),
          // FeaturedMovie(),
          SizedBox(height: size.height * 0.03),
          FeaturedActors(),
          SizedBox(height: size.height * 0.03),
        ],
      ),
    );
  }
}

class LatestMovies extends StatelessWidget {
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
                    child: Text('LATEST',
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
                    InkWell(
                      child: Image.asset('assets/images/latest1.jpg',
                          fit: BoxFit.cover, width: 150.0, height: 100.0),
                      onTap: () {
                        Route route = MaterialPageRoute(
                            builder: (context) => MovieDetailsPage());
                        Navigator.push(context, route);
                      },
                    ),
                    const Padding(padding: EdgeInsets.all(4)),
                    InkWell(
                      child: Image.asset('assets/images/latest2.jpg',
                          fit: BoxFit.cover, width: 150.0, height: 100.0),
                      onTap: () {
                        Route route = MaterialPageRoute(
                            builder: (context) => MovieDetailsPage());
                        Navigator.push(context, route);
                      },
                    ),
                    const Padding(padding: EdgeInsets.all(4)),
                    InkWell(
                      child: Image.asset('assets/images/latest3.jpg',
                          fit: BoxFit.cover, width: 150.0, height: 100.0),
                      onTap: () {
                        Route route = MaterialPageRoute(
                            builder: (context) => MovieDetailsPage());
                        Navigator.push(context, route);
                      },
                    ),
                    const Padding(padding: EdgeInsets.all(4)),
                    InkWell(
                      child: Image.asset('assets/images/latest4.jpeg',
                          fit: BoxFit.cover, width: 150.0, height: 100.0),
                      onTap: () {
                        Route route = MaterialPageRoute(
                            builder: (context) => MovieDetailsPage());
                        Navigator.push(context, route);
                      },
                    ),
                    const Padding(padding: EdgeInsets.all(4)),
                    InkWell(
                      child: Image.asset('assets/images/latest1.jpg',
                          fit: BoxFit.cover, width: 150.0, height: 100.0),
                      onTap: () {
                        Route route = MaterialPageRoute(
                            builder: (context) => MovieDetailsPage());
                        Navigator.push(context, route);
                      },
                    ),
                    const Padding(padding: EdgeInsets.all(4)),
                    InkWell(
                      child: Image.asset('assets/images/latest3.jpg',
                          fit: BoxFit.cover, width: 150.0, height: 100.0),
                      onTap: () {
                        Route route = MaterialPageRoute(
                            builder: (context) => MovieDetailsPage());
                        Navigator.push(context, route);
                      },
                    ),
                  ],
                ),
              )
            ]));
  }
}

class TopMovies extends StatelessWidget {
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
                child: Text('TOP',
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
                Image.asset('assets/images/top1.jpg',
                    fit: BoxFit.cover, width: 100.0, height: 150.0),
                const Padding(padding: EdgeInsets.all(4)),
                Image.asset('assets/images/top2.jpg',
                    fit: BoxFit.cover, width: 100.0, height: 150.0),
                const Padding(padding: EdgeInsets.all(4)),
                Image.asset('assets/images/top3.jpg',
                    fit: BoxFit.cover, width: 100.0, height: 150.0),
                const Padding(padding: EdgeInsets.all(4)),
                Image.asset('assets/images/top4.jpg',
                    fit: BoxFit.cover, width: 100.0, height: 150.0),
                const Padding(padding: EdgeInsets.all(4)),
                Image.asset('assets/images/top5.jpg',
                    fit: BoxFit.cover, width: 100.0, height: 150.0),
                const Padding(padding: EdgeInsets.all(4)),
                Image.asset('assets/images/top3.jpg',
                    fit: BoxFit.cover, width: 100.0, height: 150.0),
              ],
            ),
          )
        ]));
  }
}

class FeaturedMovie extends StatelessWidget {
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
                child: Text('FEATURED',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5.0),
                child: Text('MOVIE',
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
              mainAxisAlignment: MainAxisAlignment.start,
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
              ],
            ),
          )
        ]));
  }
}

class FeaturedActors extends StatelessWidget {
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
                child: Text('FEATURED',
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
                InkWell(
                  child: Image.asset('assets/images/actor5.jpg',
                      fit: BoxFit.cover, width: 100.0, height: 100.0),
                  onTap: () {
                    Route route = MaterialPageRoute(
                        builder: (context) => ActorDetailsPage());
                    Navigator.push(context, route);
                  },
                ),
                const Padding(padding: EdgeInsets.all(4)),
                InkWell(
                  child: Image.asset('assets/images/actor4.jpg',
                      fit: BoxFit.cover, width: 100.0, height: 100.0),
                  onTap: () {
                    Route route = MaterialPageRoute(
                        builder: (context) => ActorDetailsPage());
                    Navigator.push(context, route);
                  },
                ),
                const Padding(padding: EdgeInsets.all(4)),
                InkWell(
                  child: Image.asset('assets/images/actor3.jpg',
                      fit: BoxFit.cover, width: 100.0, height: 100.0),
                  onTap: () {
                    Route route = MaterialPageRoute(
                        builder: (context) => ActorDetailsPage());
                    Navigator.push(context, route);
                  },
                ),
                const Padding(padding: EdgeInsets.all(4)),
                InkWell(
                  child: Image.asset('assets/images/actor2.jpg',
                      fit: BoxFit.cover, width: 100.0, height: 100.0),
                  onTap: () {
                    Route route = MaterialPageRoute(
                        builder: (context) => ActorDetailsPage());
                    Navigator.push(context, route);
                  },
                ),
                const Padding(padding: EdgeInsets.all(4)),
                InkWell(
                  child: Image.asset('assets/images/actor1.jpg',
                      fit: BoxFit.cover, width: 100.0, height: 100.0),
                  onTap: () {
                    Route route = MaterialPageRoute(
                        builder: (context) => ActorDetailsPage());
                    Navigator.push(context, route);
                  },
                ),
              ],
            ),
          )
        ]));
  }
}
