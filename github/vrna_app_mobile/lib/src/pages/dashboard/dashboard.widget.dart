import 'package:flutter/material.dart';
import 'package:vrna_app_mobile/src/pages/moviedetails/movie.details.page.dart';
import 'package:vrna_app_mobile/src/pages/actordetails/actor.details.page.dart';
import 'package:vrna_app_mobile/src/blocs/dashboard.bloc.dart';
import 'package:vrna_app_mobile/src/pages/dashboard/dashboard.slider.dart';
import 'package:vrna_app_mobile/src/values/colors.dart' as colors;
// import 'package:vrna_app_mobile/src/values/dimens.dart' as dimens;

class DashboardWidget {
  Widget dashboard(BuildContext context, DashboardBloc bloc) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: size.height * 0.03),
          CustomSlider(bannerdata: bloc.responsedata),
          SizedBox(height: size.height * 0.03),
          LatestMovies(data: bloc.latestMovieData),
          SizedBox(height: size.height * 0.03),
          TopMovies(data: bloc.topMovieData),
          SizedBox(height: size.height * 0.03),
          RentalMovies(data: bloc.rentalMovieData),
          SizedBox(height: size.height * 0.03),
          RecomendedMovies(data: bloc.recomendedMovieData),
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

class LatestMovies extends StatefulWidget {
  final Stream<dynamic> data;
  const LatestMovies({Key key, this.data});

  @override
  _LatestMoviesApp createState() => _LatestMoviesApp();
}

class _LatestMoviesApp extends State<LatestMovies> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return StreamBuilder<dynamic>(
        stream: widget.data,
        initialData: "",
        builder: (context, snapshot) {
          List latestMovieList = [];
          if (snapshot.data != null && snapshot.data != '') {
            latestMovieList = snapshot.data.dataLatestMovie;
          }
          return Container(
              // margin: EdgeInsets.symmetric(vertical: 10),
              width: size.width * 0.99,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text('LATEST',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
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
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          for (var result in latestMovieList)
                            Container(
                              child: Row(
                                children: <Widget>[
                                  const Padding(padding: EdgeInsets.all(4)),
                                  InkWell(
                                    child: Image.network(result.moviebannerurl,
                                        fit: BoxFit.cover,
                                        width: 150.0,
                                        height: 100.0),
                                    onTap: () {
                                      Route route = MaterialPageRoute(
                                          builder: (context) =>
                                              MovieDetailsPage(
                                                  details: result));
                                      Navigator.push(context, route);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          const Padding(padding: EdgeInsets.all(4)),
                        ],
                      ),
                    )
                  ]));
        });
  }
}

class TopMovies extends StatefulWidget {
  final Stream<dynamic> data;
  const TopMovies({Key key, this.data});

  @override
  _TopMoviesApp createState() => _TopMoviesApp();
}

class _TopMoviesApp extends State<TopMovies> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return StreamBuilder<dynamic>(
        stream: widget.data,
        initialData: "",
        builder: (context, snapshot) {
          List topMovieList = [];
          if (snapshot.data != null && snapshot.data != '') {
            topMovieList = snapshot.data.dataTopMovie;
          }
          return Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              width: size.width * 0.99,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text('TOP',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
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
                          for (var result in topMovieList)
                            Container(
                                child: Row(children: <Widget>[
                              const Padding(padding: EdgeInsets.all(4)),
                              InkWell(
                                child: Image.network(result.moviebannerurl,
                                    fit: BoxFit.cover,
                                    width: 100.0,
                                    height: 150.0),
                                onTap: () {
                                  Route route = MaterialPageRoute(
                                      builder: (context) =>
                                          MovieDetailsPage(details: result));
                                  Navigator.push(context, route);
                                },
                              )
                            ])),
                        ],
                      ),
                    )
                  ]));
        });
  }
}

class RentalMovies extends StatefulWidget {
  final Stream<dynamic> data;
  const RentalMovies({Key key, this.data});

  @override
  _RentalMoviesApp createState() => _RentalMoviesApp();
}

class _RentalMoviesApp extends State<RentalMovies> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return StreamBuilder<dynamic>(
        stream: widget.data,
        initialData: "",
        builder: (context, snapshot) {
          List rentalMovieList = [];
          if (snapshot.data != null && snapshot.data != '') {
            rentalMovieList = snapshot.data.dataRentalMovie;
          }
          return Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              width: size.width * 0.99,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text('RENTAL',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
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
                          for (var result in rentalMovieList)
                            Container(
                                child: Row(children: <Widget>[
                              const Padding(padding: EdgeInsets.all(4)),
                              InkWell(
                                child: Image.network(result.moviebannerurl,
                                    fit: BoxFit.cover,
                                    width: 100.0,
                                    height: 150.0),
                                onTap: () {
                                  Route route = MaterialPageRoute(
                                      builder: (context) =>
                                          MovieDetailsPage(details: result));
                                  Navigator.push(context, route);
                                },
                              )
                            ])),
                        ],
                      ),
                    )
                  ]));
        });
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

class RecomendedMovies extends StatefulWidget {
  final Stream<dynamic> data;
  const RecomendedMovies({Key key, this.data});

  @override
  _RecomendedMoviesApp createState() => _RecomendedMoviesApp();
}

class _RecomendedMoviesApp extends State<RecomendedMovies> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return StreamBuilder<dynamic>(
        stream: widget.data,
        initialData: "",
        builder: (context, snapshot) {
          List recomendedMovieList = [];
          if (snapshot.data != null && snapshot.data != '') {
            recomendedMovieList = snapshot.data.dataRecomendedMovie;
          }
          return Container(
              // margin: EdgeInsets.symmetric(vertical: 10),
              width: size.width * 0.99,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text('RECOMENDED',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
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
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          for (var result in recomendedMovieList)
                            Container(
                              child: Row(
                                children: <Widget>[
                                  const Padding(padding: EdgeInsets.all(4)),
                                  InkWell(
                                    child: Image.network(result.moviebannerurl,
                                        fit: BoxFit.cover,
                                        width: 150.0,
                                        height: 100.0),
                                    onTap: () {
                                      Route route = MaterialPageRoute(
                                          builder: (context) =>
                                              MovieDetailsPage(
                                                  details: result));
                                      Navigator.push(context, route);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          const Padding(padding: EdgeInsets.all(4)),
                        ],
                      ),
                    )
                  ]));
        });
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
