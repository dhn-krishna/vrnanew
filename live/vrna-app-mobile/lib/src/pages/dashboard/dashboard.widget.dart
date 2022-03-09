import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart' hide Card;
import 'package:rxdart/rxdart.dart';
import 'package:video_player/video_player.dart';
import 'package:vrna_app_mobile/src/helpers/storage/storage.helper.dart';
import 'package:vrna_app_mobile/src/models/movie.model.dart';
import 'package:vrna_app_mobile/src/pages/actordetails/actor.details.page.dart';
import 'package:vrna_app_mobile/src/pages/moviedetails/movie.details.page.dart';
import 'package:vrna_app_mobile/src/blocs/dashboard.bloc.dart';
import 'package:vrna_app_mobile/src/pages/dashboard/dashboard.slider.dart';
import 'package:vrna_app_mobile/src/values/devicescreen.dart';
import 'package:vrna_app_mobile/src/values/movie_genres.dart';
import 'package:vrna_app_mobile/src/widgets/on_hover.dart';
import '../../widgets/theme.dart' as customTheme;
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DashboardWidget {
  Widget dashboard(BuildContext context, DashboardBloc bloc) {
    var mediaQuery = MediaQuery.of(context);
    var device = getDeviceType(mediaQuery);
    customTheme.Theme theme = customTheme.Theme.getTheme(device);
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          CustomSlider(bannerdata: bloc.responsedata, parentBloc: bloc),
          SizedBox(height: size.height * 0.03),
          LatestMovies(
            data: bloc.latestMovieData,
            parentBloc: bloc,
          ),
          SizedBox(height: size.height * 0.03),
          TopMovies(
            data: bloc.topMovieData,
            parentBloc: bloc,
          ),
          SizedBox(height: size.height * 0.03),
          FeaturedMovie(data: bloc.featuredMovieResponseModel),
          SizedBox(height: 20.0),
          PersonalizedMovieList(
            data: bloc.personalizedMovieListData,
            parentBloc: bloc,
          ),
          SizedBox(height: 40.0),
          FeaturedActors(data: bloc.featuredActorModel),
          SizedBox(height: size.height * 0.03),
          theme.commonfooter,
        ],
      ),
    );
  }
}

class LatestMovies extends StatefulWidget {
  final Stream<dynamic> data;
  final Stream<dynamic> rentedMovies;
  final DashboardBloc parentBloc;
  const LatestMovies({Key key, this.data, this.rentedMovies, this.parentBloc});

  @override
  _LatestMoviesApp createState() => _LatestMoviesApp();
}

class _LatestMoviesApp extends State<LatestMovies> {
  // final _formKey = GlobalKey<FormState>();
  List<String> rentedMovies;
  @override
  void initState() {
    super.initState();
    StorageHelper.get("rentedMovies").then((val) {
      rentedMovies = val != null ? val.split(",") : [];
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var device = getDeviceType(mediaQuery);
    customTheme.Theme theme = customTheme.Theme.getTheme(device);
    Size size = MediaQuery.of(context).size;
    CarouselController carouselController = new CarouselController();
    CarouselController carouselController1 = new CarouselController();
    bool layoutDecide = MediaQuery.of(context).size.width < 1024;
    double elevation = 4.0;
    double scale = 1.0;
    Offset translate = Offset(0, 0);
    // if(widget.rentedMovies.)
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
              padding: EdgeInsets.only(left: 15.0, right: 15.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('LATEST',
                            style: theme.latesthead, textAlign: TextAlign.left),
                        SizedBox(width: 10.0),
                        Text('MOVIES',
                            style: theme.latestheadyellow,
                            textAlign: TextAlign.left),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              InkWell(
                                child: Icon(Icons.arrow_back_ios,
                                    size: 35.0, color: Colors.white),
                                onTap: () =>
                                    {carouselController.previousPage()},
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              InkWell(
                                child: Icon(Icons.arrow_forward_ios,
                                    size: 35.0, color: Colors.white),
                                onTap: () => {carouselController.nextPage()},
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    CarouselSlider(
                      items: [
                        for (var movie in latestMovieList)
                          layoutDecide
                              ? Container(
                                  margin: EdgeInsets.only(
                                      top: 20.0,
                                      left: 5.0,
                                      right: 5.0,
                                      bottom: 20.0),
                                  child: Row(
                                    children: <Widget>[
                                      const Padding(padding: EdgeInsets.all(4)),
                                      InkWell(
                                        child: Image.network(
                                          movie.landscapeurl,
                                          // "https://vrna-movie-image-content.s3.ap-south-1.amazonaws.com/backdrops/imaikanodikal-backdrop.jpg",
                                          fit: BoxFit.fill,
                                          width: 350.0,
                                          height: 200.0,
                                        ),
                                        onTap: () {
                                          Route route = MaterialPageRoute(
                                              builder: (context) =>
                                                  MovieDetailsPage(
                                                    details: movie,
                                                  ));
                                          Navigator.push(context, route);
                                        },
                                      ),
                                    ],
                                  ),
                                )
                              : OnHover(builder: (isHovered) {
                                  return PhysicalModel(
                                      color: Colors.transparent,
                                      elevation: isHovered ? 100 : 10,
                                      child: Transform.scale(
                                        scale: isHovered ? 1.1 : 1,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              boxShadow: isHovered
                                                  ? [
                                                      new BoxShadow(
                                                        color: Color.fromRGBO(
                                                            225, 185, 36, 0.5),
                                                        blurRadius: 26.5,
                                                        spreadRadius: 0.5,
                                                      ),
                                                    ]
                                                  : []),
                                          margin: EdgeInsets.only(
                                              top: 20.0,
                                              left: 5.0,
                                              right: 5.0,
                                              bottom: 20.0),
                                          child: Row(
                                            children: <Widget>[
                                              const Padding(
                                                  padding: EdgeInsets.all(4)),
                                              InkWell(
                                                child: Image.network(
                                                  movie.landscapeurl,
                                                  // "https://vrna-movie-image-content.s3.ap-south-1.amazonaws.com/backdrops/imaikanodikal-backdrop.jpg",
                                                  fit: BoxFit.fill,
                                                  width: 350.0,
                                                  height: 200.0,
                                                ),
                                                onTap: () {
                                                  Route route =
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              MovieDetailsPage(
                                                                details: movie,
                                                              ));
                                                  Navigator.push(
                                                      context, route);
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ));
                                }),
                      ],
                      options: CarouselOptions(
                        height: 230,
                        aspectRatio: 2.0,
                        viewportFraction: layoutDecide ? 1.04 : 0.28,
                      ),
                      carouselController: carouselController,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ]));
        });
  }
}

class TopMovies extends StatefulWidget {
  final Stream<dynamic> data;
  final DashboardBloc parentBloc;
  const TopMovies({Key key, this.data, this.parentBloc});

  @override
  _TopMoviesApp createState() => _TopMoviesApp();
}

class _TopMoviesApp extends State<TopMovies> with TickerProviderStateMixin {
  TabController _tabController;
  List<String> rentedMovies;
  @override
  void initState() {
    super.initState();
    StorageHelper.get("rentedMovies").then((val) {
      rentedMovies = val != null ? val.split(",") : [];
    });
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var device = getDeviceType(mediaQuery);
    customTheme.Theme theme = customTheme.Theme.getTheme(device);  
    bool layoutDecide = MediaQuery.of(context).size.width < 1024;
    Size size = MediaQuery.of(context).size;
    return StreamBuilder<dynamic>(
        stream: widget.data,
        initialData: "",
        builder: (context, snapshot) {
          List topMovies = [];
          if (snapshot.data != null && snapshot.data != '') {
            topMovies = snapshot.data.dataTopMovie;
          }
          Set genres = new Set();
          topMovies.forEach((element) {
            genres.addAll(element.genre);
          });
          _tabController =
              new TabController(length: genres.length, vsync: this);
          return topMovies != null && topMovies.isNotEmpty
              ? Container(
                  padding: EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('TOP',
                                style: theme.latesthead,
                                textAlign: TextAlign.left),
                            SizedBox(width: 10.0),
                            Text('MOVIES',
                                style: theme.latestheadyellow,
                                textAlign: TextAlign.left),
                          ],
                        ),
                        SizedBox(height: 20.0),
                        Container(
                            width: MediaQuery.of(context).size.width,
                            height: 450.0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(20.0),
                                  margin: EdgeInsets.only(bottom: 30.0),
                                  width: MediaQuery.of(context).size.width,
                                  child: TabBar(
                                    isScrollable: true,
                                    unselectedLabelColor: Colors.white,
                                    labelStyle: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 1.0,
                                    ),
                                    indicatorSize: TabBarIndicatorSize.label,
                                    indicatorColor: Colors.white,
                                    indicator: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Color.fromRGBO(238, 185, 34, 1.0),
                                    ),
                                    tabs: [
                                      for (var genre in genres)
                                        Tab(
                                          child: Container(
                                            // color: Colors.red,
                                            padding: EdgeInsets.only(
                                              left: 20.0,
                                              right: 20.0,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                MovieGenres.genres[genre],
                                              ),
                                            ),
                                          ),
                                        ),
                                    ],
                                    controller: _tabController,
                                  ),
                                ),
                                Expanded(
                                  child: TabBarView(
                                    children: [
                                      for (var genre in genres)
                                        Container(
                                          child: ListView(
                                            scrollDirection: Axis.horizontal,
                                            children: [
                                              for (var movie in (topMovies
                                                  .where((element) => element
                                                      .genre
                                                      .contains(genre))
                                                  .toList()))


                                                  layoutDecide ? 

                                                  Container( 
                                                            margin:
                                                                EdgeInsets.only(
                                                                    top: 20.0,
                                                                    left: 10.0,
                                                                    right: 10.0,
                                                                    bottom:
                                                                        20.0),
                                                            child: Row(
                                                              children: <
                                                                  Widget>[
                                                                const Padding(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            4)),
                                                                InkWell(
                                                                  child: Image
                                                                      .network(
                                                                    movie
                                                                        ?.posterurl,
                                                                    //"https://vrna-movie-image-content.s3.ap-south-1.amazonaws.com/posters/imaikanodikal-poster.jpg",
                                                                    fit: BoxFit
                                                                        .fill,
                                                                    width:
                                                                        200.0,
                                                                    height:
                                                                        350.0,
                                                                  ),
                                                                  onTap: () {
                                                                    Route
                                                                        route =
                                                                        MaterialPageRoute(
                                                                            builder: (context) =>
                                                                                MovieDetailsPage(
                                                                                  details: movie,
                                                                                ));
                                                                    Navigator.push(
                                                                        context,
                                                                        route);
                                                                  },
                                                                ),
                                                              ],
                                                            ),
                                                          )

                                                          :


                                                OnHover(builder: (isHovered) {
                                                  return PhysicalModel(
                                                      color: Colors.transparent,
                                                      elevation:
                                                          isHovered ? 100 : 10,
                                                      child: Transform.scale(
                                                          scale: isHovered
                                                              ? 1.1
                                                              : 1,
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                                    boxShadow:
                                                                        isHovered
                                                                            ? [
                                                                                new BoxShadow(
                                                                                  color: Color.fromRGBO(225, 185, 36, 0.5),
                                                                                  blurRadius: 26.5,
                                                                                  spreadRadius: 0.5,
                                                                                ),
                                                                              ]
                                                                            : []),
                                                            margin:
                                                                EdgeInsets.only(
                                                                    top: 20.0,
                                                                    left: 10.0,
                                                                    right: 10.0,
                                                                    bottom:
                                                                        20.0),
                                                            child: Row(
                                                              children: <
                                                                  Widget>[
                                                                const Padding(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            4)),
                                                                InkWell(
                                                                  child: Image
                                                                      .network(
                                                                    movie
                                                                        ?.posterurl,
                                                                    //"https://vrna-movie-image-content.s3.ap-south-1.amazonaws.com/posters/imaikanodikal-poster.jpg",
                                                                    fit: BoxFit
                                                                        .fill,
                                                                    width:
                                                                        200.0,
                                                                    height:
                                                                        350.0,
                                                                  ),
                                                                  onTap: () {
                                                                    Route
                                                                        route =
                                                                        MaterialPageRoute(
                                                                            builder: (context) =>
                                                                                MovieDetailsPage(
                                                                                  details: movie,
                                                                                ));
                                                                    Navigator.push(
                                                                        context,
                                                                        route);
                                                                  },
                                                                ),
                                                              ],
                                                            ),
                                                          )));
                                                }),
                                            ],
                                          ),
                                        ),
                                    ],
                                    controller: _tabController,
                                  ),
                                ),
                              ],
                            )),
                      ]))
              : Container();
        });
  }
}

class FeaturedMovie extends StatefulWidget {
  final Stream<dynamic> data;
  const FeaturedMovie({Key key, this.data});

  @override
  _FeaturedMovieState createState() => _FeaturedMovieState();
}

class _FeaturedMovieState extends State<FeaturedMovie> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var device = getDeviceType(mediaQuery);
    customTheme.Theme theme = customTheme.Theme.getTheme(device);
    Size size = MediaQuery.of(context).size;
    bool layoutDecide = MediaQuery.of(context).size.width < 1024;
    return StreamBuilder<dynamic>(
        stream: widget.data,
        initialData: "",
        builder: (context, snapshot) {
          Movie featuredMovie;
          if (snapshot.data != null && snapshot.data != '') {
            featuredMovie = snapshot.data.featuredMovie;
          }
          return featuredMovie != null
              ? Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 20.0, bottom: 40.0),
                  child: Column(children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('FEATURED',
                            style: theme.latesthead, textAlign: TextAlign.left),
                        SizedBox(width: 10.0),
                        Text('MOVIE',
                            style: theme.latestheadyellow,
                            textAlign: TextAlign.left),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Container(
                        color: Color.fromRGBO(49, 62, 70, 1.0),
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.width * 0.03),
                        child: Flex(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          direction:
                              layoutDecide ? Axis.vertical : Axis.horizontal,
                          children: [
                            Container(
                              padding: EdgeInsets.only(right: 30.0),
                              width: 250,
                              height: 300.0,
                              alignment: Alignment.topLeft,
                              child: Image.network(
                                featuredMovie?.posterurl,
                                fit: BoxFit.fill,
                                width: 350,
                                height: 500.0,
                              ),
                            ),
                            layoutDecide
                                ? Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(height: 10.0),
                                                  Text(
                                                      featuredMovie.moviename
                                                          .toUpperCase(),
                                                      style: theme.raterace),
                                                  SizedBox(height: 10.0),
                                                  RatingBarIndicator(
                                                    rating: featuredMovie
                                                        .userRating
                                                        .toDouble(),
                                                    itemBuilder:
                                                        (context, index) =>
                                                            Icon(
                                                      Icons.star,
                                                      color: Color.fromRGBO(
                                                          255, 185, 36, 1.0),
                                                    ),
                                                    itemCount: 5,
                                                    itemSize: 30.0,
                                                    unratedColor: Colors.white,
                                                    direction: Axis.horizontal,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            // Icon(
                                            //   Icons.favorite_outline,
                                            //   color: Colors.white,
                                            //   size: 34.0,
                                            // ),
                                          ],
                                        ),
                                        SizedBox(height: 20.0),
                                        Text(featuredMovie.description,
                                            style: theme.fmoviedesc),
                                        SizedBox(height: 20.0),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  RichText(
                                                    textAlign: TextAlign.left,
                                                    text: TextSpan(
                                                        text: 'Director: ',
                                                        style: theme.director,
                                                        children: <TextSpan>[
                                                          TextSpan(
                                                            text: featuredMovie
                                                                    ?.director
                                                                    ?.join(
                                                                        ",") ??
                                                                '',
                                                            style: theme
                                                                .directoryellow,
                                                          ),
                                                        ]),
                                                  ),
                                                  SizedBox(height: 5.0),
                                                  RichText(
                                                    textAlign: TextAlign.left,
                                                    text: TextSpan(
                                                        text: 'Producer: ',
                                                        style: theme.director,
                                                        children: <TextSpan>[
                                                          TextSpan(
                                                            text: featuredMovie
                                                                    ?.producer
                                                                    ?.join(
                                                                        ",") ??
                                                                '',
                                                            style: theme
                                                                .directoryellow,
                                                          ),
                                                        ]),
                                                  ),
                                                  SizedBox(height: 5.0),
                                                  RichText(
                                                    textAlign: TextAlign.left,
                                                    text: TextSpan(
                                                        text: 'Year: ',
                                                        style: theme.director,
                                                        children: <TextSpan>[
                                                          TextSpan(
                                                            text: featuredMovie
                                                                .year,
                                                            style: theme
                                                                .directoryellow,
                                                          ),
                                                        ]),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            InkWell(
                                              child: Container(
                                                width: 100.0,
                                                padding: EdgeInsets.only(
                                                    top: 15.0, bottom: 15.0),
                                                decoration: BoxDecoration(
                                                    color: Color.fromRGBO(
                                                        225, 185, 36, 1.0),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0)),
                                                child: Text(
                                                  "Trailer",
                                                  textAlign: TextAlign.center,
                                                  style: theme.buttontext,
                                                ),
                                              ),
                                              onTap: () {
                                                Route route = MaterialPageRoute(
                                                    builder: (context) =>
                                                        MovieDetailsPage(
                                                          details:
                                                              featuredMovie,
                                                        ));
                                                Navigator.push(context, route);
                                                // flickPlayerDialog(
                                                //     context,
                                                //     _controller,
                                                //     featuredMovie.trailerurl)
                                              },
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                : Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                      featuredMovie.moviename
                                                          .toUpperCase(),
                                                      style: theme.raterace),
                                                  SizedBox(height: 10.0),
                                                  RatingBarIndicator(
                                                    rating: featuredMovie
                                                        .userRating
                                                        .toDouble(),
                                                    itemBuilder:
                                                        (context, index) =>
                                                            Icon(
                                                      Icons.star,
                                                      color: Color.fromRGBO(
                                                          255, 185, 36, 1.0),
                                                    ),
                                                    itemCount: 5,
                                                    itemSize: 30.0,
                                                    unratedColor: Colors.white,
                                                    direction: Axis.horizontal,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            // Icon(
                                            //   Icons.favorite_outline,
                                            //   color: Colors.white,
                                            //   size: 34.0,
                                            // ),
                                          ],
                                        ),
                                        SizedBox(height: 20.0),
                                        Text(featuredMovie.description,
                                            style: theme.fmoviedesc),
                                        SizedBox(height: 20.0),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Expanded(
                                                child: Container(
                                              alignment: Alignment.topLeft,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  RichText(
                                                    textAlign: TextAlign.left,
                                                    text: TextSpan(
                                                        text: 'Director: ',
                                                        style: theme.director,
                                                        children: <TextSpan>[
                                                          TextSpan(
                                                            text: featuredMovie
                                                                    ?.director
                                                                    ?.join(
                                                                        ",") ??
                                                                '',
                                                            style: theme
                                                                .directoryellow,
                                                          ),
                                                        ]),
                                                  ),
                                                  SizedBox(height: 5.0),
                                                  RichText(
                                                    textAlign: TextAlign.left,
                                                    text: TextSpan(
                                                        text: 'Producer: ',
                                                        style: theme.director,
                                                        children: <TextSpan>[
                                                          TextSpan(
                                                            text: featuredMovie
                                                                    ?.producer
                                                                    ?.join(
                                                                        ",") ??
                                                                '',
                                                            style: theme
                                                                .directoryellow,
                                                          ),
                                                        ]),
                                                  ),
                                                  SizedBox(height: 5.0),
                                                  RichText(
                                                    textAlign: TextAlign.left,
                                                    text: TextSpan(
                                                        text: 'Year: ',
                                                        style: theme.director,
                                                        children: <TextSpan>[
                                                          TextSpan(
                                                            text: featuredMovie
                                                                .year,
                                                            style: theme
                                                                .directoryellow,
                                                          ),
                                                        ]),
                                                  ),
                                                ],
                                              ),
                                            )),
                                            InkWell(
                                              child: Container(
                                                width: 100.0,
                                                padding: EdgeInsets.only(
                                                    top: 15.0, bottom: 15.0),
                                                decoration: BoxDecoration(
                                                    color: Color.fromRGBO(
                                                        225, 185, 36, 1.0),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0)),
                                                child: Text(
                                                  "Trailer",
                                                  textAlign: TextAlign.center,
                                                  style: theme.buttontext,
                                                ),
                                              ),
                                              onTap: () {
                                                Route route = MaterialPageRoute(
                                                    builder: (context) =>
                                                        MovieDetailsPage(
                                                          details:
                                                              featuredMovie,
                                                        ));
                                                Navigator.push(context, route);
                                                // flickPlayerDialog(
                                                //     context,
                                                //     _controller,
                                                //     featuredMovie.trailerurl)
                                              },
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                          ],
                        ))
                  ]),
                )
              : Container();
        });
  }
}

class FeaturedActors extends StatefulWidget {
  final Stream<dynamic> data;
  const FeaturedActors({Key key, this.data});

  @override
  _FeaturedActorsState createState() => _FeaturedActorsState();
}

class _FeaturedActorsState extends State<FeaturedActors> {
  final formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var device = getDeviceType(mediaQuery);
    customTheme.Theme theme = customTheme.Theme.getTheme(device);
    Size size = MediaQuery.of(context).size;
    return StreamBuilder<dynamic>(
        stream: widget.data,
        initialData: "",
        builder: (context, snapshot) {
          List featuredActors = [];
          if (snapshot.data != null && snapshot.data != '') {
            featuredActors = snapshot.data.actors;
          }
          return Container(
              padding: EdgeInsets.only(left: 15.0, right: 15.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('FEATURED',
                            style: theme.latesthead, textAlign: TextAlign.left),
                        SizedBox(width: 10.0),
                        Text('ACTORS',
                            style: theme.latestheadyellow,
                            textAlign: TextAlign.left),
                      ],
                    ),
                    const Padding(padding: EdgeInsets.all(2)),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          const Padding(padding: EdgeInsets.all(4)),
                          for (var actor in featuredActors)
                            Container(
                              padding: EdgeInsets.only(
                                  top: 20.0,
                                  bottom: 20.0,
                                  right: 5.0,
                                  left: 5.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  InkWell(
                                      child: Container(
                                          margin: EdgeInsets.only(
                                              top: 20.0,
                                              left: 10.0,
                                              right: 10.0,
                                              bottom: 20.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                  // decoration:
                                                  //     BoxDecoration(boxShadow: [
                                                  //   new BoxShadow(
                                                  //       color: Color.fromRGBO(
                                                  //           225, 185, 36, 0.5),
                                                  //       blurRadius: 20.5,
                                                  //       spreadRadius: 0.5,
                                                  //       offset: Offset(0, 0)),
                                                  // ]),
                                                  child: Image.network(
                                                (actor.imageUrl != null &&
                                                        actor.imageUrl != "")
                                                    ? 'http://' + actor.imageUrl
                                                    : 'http://placehold.it/32x32',
                                                fit: BoxFit.cover,
                                                width: 200.0,
                                                height: 200.0,
                                              )),
                                              SizedBox(height: 10.0),
                                              Text(actor.castname,
                                                  style: theme.actorname)
                                            ],
                                          )),
                                      onTap: () {
                                        Route route = MaterialPageRoute(
                                            builder: (context) =>
                                                ActorDetailsPage(
                                                    actorId: actor.castId));
                                        Navigator.push(context, route);
                                        // actor.castId
                                      }),
                                ],
                              ),
                            ),
                        ],
                      ),
                    )
                  ]));
        });
  }
}

class PersonalizedMovieList extends StatefulWidget {
  final Stream<dynamic> data;
  final DashboardBloc parentBloc;
  final Stream<dynamic> rentedMovies;
  final int refresh;
  const PersonalizedMovieList(
      {Key key, this.data, this.parentBloc, this.rentedMovies, this.refresh});

  @override
  _PersonalizedMovies createState() => _PersonalizedMovies();
}

class _PersonalizedMovies extends State<PersonalizedMovieList>
    with TickerProviderStateMixin {
  BehaviorSubject<int> rentalBoxStream = BehaviorSubject<int>();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    rentalBoxStream.close();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var device = getDeviceType(mediaQuery);
    customTheme.Theme theme = customTheme.Theme.getTheme(device);
     bool layoutDecide = MediaQuery.of(context).size.width < 1024;
    return StreamBuilder<dynamic>(
        stream: widget.data,
        initialData: "",
        builder: (context, movieSnapshot) {
          Map personalizedMovieList = {};
          if (movieSnapshot.data != null && movieSnapshot.data != '') {
            personalizedMovieList = movieSnapshot.data.personalizedMovieList;
          }
          return Column(children: [
            for (var movieList in personalizedMovieList.entries)
              if (movieList.value != null &&
                  (movieList.value as List).isNotEmpty)
                Container(
                    padding: EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: 40.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(movieList.key,
                                  style: theme.latesthead,
                                  textAlign: TextAlign.left),
                              // SizedBox(width: 10.0),
                              // Text('MOVIES',
                              //     style: theme.latestheadyellow,
                              //     textAlign: TextAlign.left),
                            ],
                          ),
                          SizedBox(height: 10.0),
                          Container(
                              width: MediaQuery.of(context).size.width,
                              height: 350.0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Container(
                                      child: ListView(
                                        scrollDirection: Axis.horizontal,
                                        children: [
                                          for (var movie in (movieList.value))


                                          layoutDecide ? Container( 
                                                        margin: EdgeInsets.only(
                                                            top: 20.0,
                                                            left: 10.0,
                                                            right: 10.0,
                                                            bottom: 20.0), 
                                                        child: Row(
                                                          children: <Widget>[
                                                            const Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            4)),
                                                            InkWell(
                                                              child:
                                                                  Image.network(
                                                                movie
                                                                    ?.posterurl,
                                                                fit:
                                                                    BoxFit.fill,
                                                                width: 200.0,
                                                                height: 350.0,
                                                              ),
                                                              onTap: () {
                                                                Route route =
                                                                    MaterialPageRoute(
                                                                        builder: (context) =>
                                                                            MovieDetailsPage(
                                                                              details: movie,
                                                                            ));
                                                                Navigator.push(
                                                                    context,
                                                                    route);
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                      ) :
                                            OnHover(builder: (isHovered) {
                                              return PhysicalModel(
                                                  color: Colors.transparent,
                                                  elevation:
                                                      isHovered ? 100 : 10,
                                                  child: Transform.scale(
                                                      scale:
                                                          isHovered ? 1.1 : 1,
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                                boxShadow:
                                                                    isHovered
                                                                        ? [
                                                                            new BoxShadow(
                                                                              color: Color.fromRGBO(225, 185, 36, 0.5),
                                                                              blurRadius: 26.5,
                                                                              spreadRadius: 0.5,
                                                                            ),
                                                                          ]
                                                                        : []),
                                                        margin: EdgeInsets.only(
                                                            top: 20.0,
                                                            left: 10.0,
                                                            right: 10.0,
                                                            bottom: 20.0),
                                                        // decoration:
                                                        //     BoxDecoration(
                                                        //       boxShadow: [
                                                        //   new BoxShadow(
                                                        //     color: Color.fromRGBO(
                                                        //         225, 185, 36, 0.5),
                                                        //     blurRadius: 26.5,
                                                        //     spreadRadius: 0.5,
                                                        //   ),
                                                        // ]),
                                                        child: Row(
                                                          children: <Widget>[
                                                            const Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            4)),
                                                            InkWell(
                                                              child:
                                                                  Image.network(
                                                                movie
                                                                    ?.posterurl,
                                                                fit:
                                                                    BoxFit.fill,
                                                                width: 200.0,
                                                                height: 350.0,
                                                              ),
                                                              onTap: () {
                                                                Route route =
                                                                    MaterialPageRoute(
                                                                        builder: (context) =>
                                                                            MovieDetailsPage(
                                                                              details: movie,
                                                                            ));
                                                                Navigator.push(
                                                                    context,
                                                                    route);
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                      )));
                                            })
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                        ]))
          ]);
        });
  }
}
