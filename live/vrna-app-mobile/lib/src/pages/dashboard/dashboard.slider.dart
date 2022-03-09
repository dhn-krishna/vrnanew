import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:vrna_app_mobile/src/helpers/storage/storage.helper.dart';
import 'package:vrna_app_mobile/src/pages/moviedetails/movie.details.page.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:vrna_app_mobile/src/blocs/dashboard.bloc.dart';
import 'package:vrna_app_mobile/src/blocs/payment.bloc.dart';
import 'package:vrna_app_mobile/src/values/devicescreen.dart';
import '../../widgets/theme.dart' as customTheme;

class CustomSlider extends StatefulWidget {
  final Stream<dynamic> bannerdata;
  final DashboardBloc parentBloc;
  const CustomSlider({Key key, this.bannerdata, this.parentBloc});
  @override
  _CustomSliderApp createState() => _CustomSliderApp();
}

class _CustomSliderApp extends State<CustomSlider> {
  var genreData = {};
  var cardListResponse;
  List<String> rentedMovies;
  PaymentBloc bloc;
  int _currentIndex = 0;
  VideoPlayerController _controller;
  var mediaPlayer;
  var currentMovie;

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

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
    bloc?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var device = getDeviceType(mediaQuery);
    customTheme.Theme theme = customTheme.Theme.getTheme(device);
    Size size = MediaQuery.of(context).size;
    bool layoutDecide = MediaQuery.of(context).size.width < 1024;
    return StreamBuilder<dynamic>(
        stream: widget.bannerdata,
        initialData: "",
        builder: (context, snapshot) {
          List cardList = [];
          if (snapshot.data != null &&
              snapshot.data != '' &&
              snapshot.data.banners != null) {
            cardList = snapshot.data.banners;
            if (currentMovie == null) {
              currentMovie = cardList[0];
            }
          }
          return Container(
              child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  CarouselSlider(
                    options: CarouselOptions(
                      onPageChanged: (index, reason) => {
                        setState(() {
                          currentMovie = cardList[index];
                          _currentIndex = index;
                        }),
                      },
                      height: layoutDecide ? 250.0 : 350.0,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      viewportFraction: layoutDecide ? 0.9 : 0.7,
                      aspectRatio: 2.0,
                      enlargeCenterPage: false,
                    ),
                    items: cardList.map((movie) {
                      return Builder(builder: (BuildContext context) {
                        return Container(
                            color: Colors.transparent,
                            alignment: Alignment.bottomCenter,
                            child: Stack(
                              alignment: AlignmentDirectional.bottomCenter,
                              children: [
                                Container(
                                  height: layoutDecide ? 250.0 : 350.0,
                                  width: size.width,
                                  child: InkWell(
                                      child: Card(
                                        child: Container(
                                          child: Image.network(
                                              movie.moviebannerurl,
                                              fit: BoxFit.fill),
                                        ),
                                      ),
                                      onTap: () {
                                        Route route = MaterialPageRoute(
                                            builder: (context) =>
                                                MovieDetailsPage(
                                                  details: currentMovie,
                                                ));
                                        Navigator.push(context, route);
                                      }),
                                ),
                                Container(
                                  padding: EdgeInsets.only(bottom: 30.0),
                                  alignment: Alignment.bottomCenter,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      // InkWell(
                                      //   child: Container(
                                      //     alignment: Alignment.center,
                                      //     width: 160.0,
                                      //     height: 60.0,
                                      //     child: Container(
                                      //         width: 100.0,
                                      //         height: 45.0,
                                      //         decoration: BoxDecoration(
                                      //           color: Color.fromRGBO(
                                      //               225, 185, 36, 1.0),
                                      //           borderRadius:
                                      //               BorderRadius.circular(22.0),
                                      //         ),
                                      //         child: Stack(
                                      //           alignment: Alignment.centerLeft,
                                      //           children: [
                                      //             Icon(Icons.arrow_right,
                                      //                 size: 50.0,
                                      //                 color: Colors.black),
                                      //             Container(
                                      //                 padding: EdgeInsets.only(
                                      //                     left: 40.0, top: 0.0),
                                      //                 child: Text(
                                      //                   "Play",
                                      //                   style: TextStyle(
                                      //                       fontSize: 18.0,
                                      //                       color: Colors.black,
                                      //                       fontWeight:
                                      //                           FontWeight
                                      //                               .bold),
                                      //                 ))
                                      //           ],
                                      //         )),
                                      //   ),
                                      //   onTap: () {
                                      //     Route route = MaterialPageRoute(
                                      //         builder: (context) =>
                                      //             MovieDetailsPage(
                                      //               details: currentMovie,
                                      //             ));
                                      //     Navigator.push(context, route);
                                      //   },
                                      // ),
                                    ],
                                  ),
                                ),
                              ],
                            ));
                      });
                    }).toList(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: map<Widget>(cardList, (index, url) {
                      return Container(
                        width: 10.0,
                        height: 10.0,
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 2.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentIndex == index
                              ? Colors.yellow
                              : Colors.grey,
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ],
          ));
        });
  }
}
