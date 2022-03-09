import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:vrna_app_mobile/src/blocs/actordetails.bloc.dart';
import 'package:vrna_app_mobile/src/blocs/dashboard.bloc.dart';
import 'package:vrna_app_mobile/src/models/actor.model.dart';
import 'package:vrna_app_mobile/src/models/movie.model.dart';
import 'package:vrna_app_mobile/src/models/moviecast.model.dart';
import 'package:vrna_app_mobile/src/pages/dashboard/dashboard.page.dart';
import 'package:vrna_app_mobile/src/pages/moviedetails/movie.details.page.dart';
import 'package:vrna_app_mobile/src/widgets/on_hover.dart';
import '../../widgets/theme.dart' as customTheme;
import 'package:vrna_app_mobile/src/values/devicescreen.dart';

class ActorDetailsWidget {
  Widget actorDetails(BuildContext context, ActorDetailsBloc bloc) {
    var mediaQuery = MediaQuery.of(context);
    var device = getDeviceType(mediaQuery);
    customTheme.Theme theme = customTheme.Theme.getTheme(device);
    Size size = MediaQuery.of(context).size;
    bool layoutDecide = MediaQuery.of(context).size.width < 1024;
    return SingleChildScrollView(
        child: Padding(
      padding: EdgeInsets.all(0.0),
      child: Column(
        children: <Widget>[
          // TopMenu(),
          // SizedBox(height: size.height * 0.03),

          StreamBuilder<dynamic>(
              stream: bloc.castDetailResponse,
              initialData: "",
              builder: (context, snapshot) {
                Actor actor;
                if (snapshot.hasData) if (snapshot.connectionState.index == 2 && snapshot.data != null &&
                    snapshot.data?.cast != null) {
                  actor = snapshot.data?.cast[0];
                }
                return actor != null
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 30.0, right: 30.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 40.0),
                                Flex(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    direction: layoutDecide
                                        ? Axis.vertical
                                        : Axis.horizontal,
                                    children: <Widget>[ 
                                      
                                      Container(
                                        padding: EdgeInsets.only(right: 50.0, left:20.0),
                                        width: layoutDecide
                                            ? mediaQuery.size.width
                                            : mediaQuery.size.width * 0.25,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(actor.castname ?? '',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 30.0,
                                                    fontFamily: 'SF UI Display',
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            SizedBox(height: 10.0),

                                            Container(
                        width: size.width * 1,
                        height: 250.0,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    'http://ec2-3-21-205-116.us-east-2.compute.amazonaws.com:8089/images' +
                                        actor.imageUrl),
                                fit: BoxFit.cover)),
                        child: Text("")),

                                            SizedBox(height: 15.0),


                                             
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: layoutDecide
                                            ? mediaQuery.size.width
                                            : mediaQuery.size.width * 0.65,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                                SizedBox(height:60.0),
                                            Text(actor.description,
                                                style: theme.fmoviedesc),
                                                SizedBox(height:10.0),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                    width: 200.0,
                                                    child: Text(
                                                      "Date Of Birth:",
                                                      style: theme.director,
                                                    )),
                                                Expanded(
                                                  child: Text(
                                                    actor?.dob ?? '',
                                                    style: theme.directoryellow,
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(height: 5.0),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                    width: 200.0,
                                                    child: Text(
                                                      "Notable Work:",
                                                      style: theme.director,
                                                    )),
                                                Expanded(
                                                  child: Text(
                                                    actor?.notableWork
                                                            ?.join(',') ??
                                                        '-',
                                                    style: theme.directoryellow,
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(height: 5.0),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                    width: 200.0,
                                                    child: Text(
                                                      "Spouse:",
                                                      style: theme.director,
                                                    )),
                                                Expanded(
                                                  child: Text(
                                                    actor?.spouse?.join(',') ??
                                                        '-',
                                                    style: theme.directoryellow,
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(height: 5.0),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                    width: 200.0,
                                                    child: Text(
                                                      "Children:",
                                                      style: theme.director,
                                                    )),
                                                Expanded(
                                                  child: Text(
                                                    actor?.children
                                                            ?.join(',') ??
                                                        '-',
                                                    style: theme.directoryellow,
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(height: 5.0),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                    width: 200.0,
                                                    child: Text(
                                                      "Years Active:",
                                                      style: theme.director,
                                                    )),
                                                Expanded(
                                                  child: Text(
                                                    actor?.yearsActive ?? '-',
                                                    style: theme.directoryellow,
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(height: 40.0),
                                          ],
                                        ),
                                      ),
                                    ]),
                                SizedBox(height: 40.0),
                              ],
                            ),
                          )
                        ],
                      )
                    : Container();
              }),
          HisMovies(data: bloc.moviesByActor),
          SizedBox(height: size.height * 0.03),
          theme.commonfooter,
        ],
      ),
    ));
  }
}

class TopMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var device = getDeviceType(mediaQuery);
    customTheme.Theme theme = customTheme.Theme.getTheme(device);
    Size size = MediaQuery.of(context).size;
    return Container(
        width: size.width * 0.99,
        child: Padding(
          padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: InkWell(
                  onTap: () {
                    Route route = MaterialPageRoute(
                        builder: (context) => DashboardPage());
                    Navigator.pushReplacement(context, route);
                  },
                  child: Icon(
                    Icons.keyboard_backspace,
                    color: Colors.white,
                    size: 30.0,
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Text('Actor',
                  style: theme.tabbartxt, textAlign: TextAlign.left),
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

class ActorBanner extends StatefulWidget {
  final Stream<MovieCastResponseModel> castResponseModel;

  const ActorBanner({Key key, this.castResponseModel}) : super(key: key);

  @override
  _ActorBannerState createState() => _ActorBannerState();
}

class _ActorBannerState extends State<ActorBanner> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var device = getDeviceType(mediaQuery);
    customTheme.Theme theme = customTheme.Theme.getTheme(device);
    Size size = MediaQuery.of(context).size;
    var data = widget.castResponseModel;
    return StreamBuilder<dynamic>(
        stream: data,
        initialData: "",
        builder: (context, snapshot) {
          Actor actor;
          if (snapshot.hasData) if (snapshot.data != null && snapshot.connectionState.index == 2 &&
              snapshot.data?.cast != null) {
            actor = snapshot.data?.cast[0];
          }
          return actor != null
              ? Stack(
                  children: [
                    Container(
                        width: size.width * 1,
                        height: 450.0,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    'http://ec2-3-21-205-116.us-east-2.compute.amazonaws.com:8089/images' +
                                        actor.imageUrl),
                                fit: BoxFit.cover)),
                        child: Text("")),
                    Container(
                        height: 450.0,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment
                                .bottomCenter, // 10% of the width, so there are ten blinds.
                            colors: <Color>[
                              Color.fromRGBO(000, 000, 000, 0.20),
                              Color.fromRGBO(000, 000, 000, 0.40),
                              Color.fromRGBO(000, 000, 000, 0.60),
                              Color.fromRGBO(000, 000, 000, 0.80),
                              Color.fromRGBO(000, 000, 000, 1),
                            ], // red to yellow
                            tileMode: TileMode
                                .repeated, // repeats the gradient over the canvas
                          ),
                        )),
                    Container(
                      width: size.width * 1,
                      height: 450.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Text(actor.castname,
                                style: theme.bannerwhitehead,
                                textAlign: TextAlign.left),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 10.0, top: 10.0, bottom: 30.0),
                            child: Text('Actor',
                                style: theme.latestheadyellow,
                                textAlign: TextAlign.left),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              : Container();
        });
  }
}

class HisMovies extends StatelessWidget {
  final data;
  const HisMovies({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var device = getDeviceType(mediaQuery);
    customTheme.Theme theme = customTheme.Theme.getTheme(device);
    bool layoutDecide = MediaQuery.of(context).size.width < 1024;
    Size size = MediaQuery.of(context).size;
    List movieList = [];
    return StreamBuilder<dynamic>(
        stream: data,
        initialData: "",
        builder: (context, snapshot) {
          // List movieList = [];
          if (snapshot.connectionState.index == 2 && snapshot.data != null && snapshot.data.movieList != null) {
            movieList = snapshot.data.movieList;
          }
          return movieList.isNotEmpty
              ? Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  width: size.width * 0.99,
                  child: Column(children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text('HIS',
                              style: theme.latesthead,
                              textAlign: TextAlign.left),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Text('MOVIES',
                              style: theme.latestheadyellow,
                              textAlign: TextAlign.left),
                        ),
                      ],
                    ),
                    const Padding(padding: EdgeInsets.all(2)),
                    SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 350.0,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          child: ListView(
                                            scrollDirection: Axis.horizontal,
                                            children: [
                                              for (Movie movie in movieList)
                                                layoutDecide
                                                    ? Container(
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
                                                                movie.posterurl,
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
                                                      )
                                                    : OnHover(
                                                        builder: (isHovered) {
                                                        return PhysicalModel(
                                                            color: Colors
                                                                .transparent,
                                                            elevation: isHovered
                                                                ? 100
                                                                : 10,
                                                            child:
                                                                Transform.scale(
                                                                    scale:
                                                                        isHovered
                                                                            ? 1.1
                                                                            : 1,
                                                                    child:
                                                                        Container(
                                                                      decoration: BoxDecoration(
                                                                          boxShadow: isHovered
                                                                              ? [
                                                                                  new BoxShadow(
                                                                                    color: Color.fromRGBO(225, 185, 36, 0.5),
                                                                                    blurRadius: 26.5,
                                                                                    spreadRadius: 0.5,
                                                                                  ),
                                                                                ]
                                                                              : []),
                                                                      margin: EdgeInsets.only(
                                                                          top:
                                                                              20.0,
                                                                          left:
                                                                              10.0,
                                                                          right:
                                                                              10.0,
                                                                          bottom:
                                                                              20.0),
                                                                      child:
                                                                          Row(
                                                                        children: <
                                                                            Widget>[
                                                                          const Padding(
                                                                              padding: EdgeInsets.all(4)),
                                                                          InkWell(
                                                                            child:
                                                                                Image.network(
                                                                              movie.posterurl,
                                                                              fit: BoxFit.fill,
                                                                              width: 200.0,
                                                                              height: 350.0,
                                                                            ),
                                                                            onTap:
                                                                                () {
                                                                              Route route = MaterialPageRoute(
                                                                                  builder: (context) => MovieDetailsPage(
                                                                                        details: movie,
                                                                                      ));
                                                                              Navigator.push(context, route);
                                                                            },
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    )));
                                                      }),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  )

/* Text */
                                  ),
                            ]) /*Row(
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
            ),*/
                        )
                  ]))
              : Container();
        });
  }
}
