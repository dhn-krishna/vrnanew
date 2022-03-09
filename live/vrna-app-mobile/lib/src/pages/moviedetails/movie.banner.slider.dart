import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:vrna_app_mobile/src/blocs/dashboard.bloc.dart';
import 'package:vrna_app_mobile/src/blocs/movie.player.bloc.dart';
import 'package:vrna_app_mobile/src/blocs/payment.bloc.dart';
import 'package:vrna_app_mobile/src/blocs/favorites.bloc.dart';

import 'package:vrna_app_mobile/src/helpers/storage/storage.helper.dart';
import 'package:vrna_app_mobile/src/models/movie.model.dart';
import 'package:vrna_app_mobile/src/models/movieplaymeta.model.dart';
import 'package:vrna_app_mobile/src/repositories/sources/network/base/endpoints.dart';
import '../../helpers/video_player_helper.dart';
import 'package:vrna_app_mobile/src/values/devicescreen.dart';
import '../rent/rent.widget.dart';
import '../../widgets/theme.dart' as customTheme;

class MovieBannerSlider extends StatefulWidget {
  final DashboardBloc dashboardBloc;
  final FavoritesBloc favoritesBloc;
  final String bannerUrl;
  final Movie movie;
  final hideAppBarDelegate;
  const MovieBannerSlider(
      {Key key,
      this.movie,
      this.bannerUrl,
      this.dashboardBloc,
      this.favoritesBloc,
      this.hideAppBarDelegate});
  @override
  _MovieBannerState createState() => _MovieBannerState();
}

class _MovieBannerState extends State<MovieBannerSlider> with RentWidget {
  var genreData = {};
  var rentedMovies = [];
  var cvvTextController = TextEditingController();
  var cardNumberTextControler = TextEditingController();
  MoviePlayerBloc moviePlayerBloc;
  PaymentBloc paymentBloc;
  FavoritesBloc favoritesBloc;
  var mediaPlayer;
  // For video player
  var showVideoPlayer = false;
  var videoUrl = '';
  var signedCookie = '';
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
    WidgetsFlutterBinding.ensureInitialized();
    StorageHelper.get("rentedMovies").then((val) {
      rentedMovies = val != null ? val.split(",") : [];
    });
  }

  Future<Map<String, String>> playMovie(movieId) async {
    Map<String, String> metaData = {};
    MoviePlayMeta moviePlayMetaData =
        await moviePlayerBloc.getMoviePlayMetaData(movieId);
    var movieUrl = moviePlayMetaData.movieUrl;
    var signature = moviePlayMetaData.cloudFrontSignature;
    // var signedCookie =
    //     'G_ENABLED_IDPS=google;CloudFront-Policy=${moviePlayMetaData.cloudFrontPolicy};CloudFront-Signature=${moviePlayMetaData.cloudFrontSignature};CloudFront-Key-Pair-Id=${moviePlayMetaData.cloudFrontKeyPairId}';
    // print(
    //     'Movie URL : $movieUrl, signedCookie : ${moviePlayMetaData.cloudFrontSignature}');
    metaData['movieUrl'] = movieUrl;
    metaData['cookie'] = signature;
    return metaData;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    moviePlayerBloc = Provider.of<MoviePlayerBloc>(context);
    paymentBloc = Provider.of<PaymentBloc>(context);
    favoritesBloc = Provider.of<FavoritesBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var device = getDeviceType(mediaQuery);
    customTheme.Theme theme = customTheme.Theme.getTheme(device);
    Size size = MediaQuery.of(context).size;
    var currentMovie;
    var movie = widget.movie;
    bool layoutDecide = MediaQuery.of(context).size.width < 700;
    return widget.bannerUrl != null && widget.bannerUrl != ''
        ? showVideoPlayer
            ? flickPlayerWidget(context, null, videoUrl, movie,
                signatureHeader: signedCookie)
            : Container(
                alignment: Alignment.topCenter,
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          alignment: Alignment.topCenter,
                          width: size.width,
                          child: InkWell(
                              child: Card(
                                child: Container(
                                  height: layoutDecide ? 250.0 : 350.0,
                                  color: Colors.black,
                                  width: MediaQuery.of(context).size.width,
                                  child: Image.network(widget.bannerUrl,
                                      fit: layoutDecide
                                          ? BoxFit.fitWidth
                                          : BoxFit.fill),
                                ),
                              ),
                              onTap: () {}),
                        ),
                      ],
                    ),
                    Container(
                      alignment: Alignment.bottomLeft,
                      padding: EdgeInsets.only(bottom: 30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(width: 10.0),
                          Transform.scale(
                              scale: layoutDecide ? 0.8 : 1.0,
                              child: InkWell(
                                child: Container(
                                    width: 170.0,
                                    height: 48.0,
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(225, 185, 36, 1.0),
                                      borderRadius: BorderRadius.circular(22.0),
                                    ),
                                    child: Stack(
                                      alignment: Alignment.centerLeft,
                                      children: [
                                        Icon(Icons.arrow_right,
                                            size: 50.0, color: Colors.black),
                                        Container(
                                            padding: EdgeInsets.only(
                                                left: 40.0, top: 0.0),
                                            child: Text(
                                              "Watch Trailer",
                                              style: TextStyle(
                                                  fontSize: 18.0,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ))
                                      ],
                                    )),
                                onTap: () {
                                  // (rentedMovies
                                  //     .any((e) => int.tryParse(e) == movie.movieId)) ?
                                  //     flickPlayerDialog(context,null,movie.movieurl) :
                                  // flickPlayerDialog(
                                  //     context, null, movie.trailerurl);
                                  this.setState(() {
                                    videoUrl = movie.trailerurl;
                                    // signedCookie = value['cookie'];
                                    showVideoPlayer = true;
                                  });
                                  widget.hideAppBarDelegate(true);
                                },
                              )),
                          if (!(rentedMovies
                              .any((e) => int.tryParse(e) == movie.movieId)))
                            Transform.scale(
                              scale: layoutDecide ? 0.8 : 1.0,
                              child: InkWell(
                                child: Container(
                                    width: 100.0,
                                    height: 48.0,
                                    margin: EdgeInsets.only(
                                      left: 15.0,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(225, 185, 36, 1.0),
                                      borderRadius: BorderRadius.circular(22.0),
                                    ),
                                    child: Stack(
                                      alignment: Alignment.centerLeft,
                                      children: [
                                        Icon(Icons.arrow_right,
                                            size: 50.0, color: Colors.black),
                                        Container(
                                            padding: EdgeInsets.only(
                                                left: 40.0, top: 0),
                                            child: Text(
                                              "Rent",
                                              style: TextStyle(
                                                  fontSize: 18.0,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ))
                                      ],
                                    )),
                                onTap: () {
                                  (rentedMovies.any((e) =>
                                          int.tryParse(e) == movie.movieId))
                                      ? flickPlayerDialog(
                                          context, null, movie.trailerurl)
                                      : showRentDialog(
                                          context,
                                          widget.dashboardBloc,
                                          paymentBloc,
                                          movie);
                                },
                              ),
                            ),
                          Transform.scale(
                            scale: layoutDecide ? 0.8 : 1.0,
                            child: InkWell(
                              child: Container(
                                  width: 50.0,
                                  height: 48.0,
                                  margin: EdgeInsets.only(
                                    left: 15.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(225, 185, 36, 1.0),
                                    borderRadius: BorderRadius.circular(22.0),
                                  ),
                                  child: Stack(
                                    alignment: Alignment.centerLeft,
                                    children: [
                                      Icon(Icons.favorite,
                                          size: 40.0, color: Colors.black),
                                      // Container(
                                      //     padding: EdgeInsets.only(
                                      //         left: 40.0, top: 0),
                                      //     child: Text(
                                      //       "Add to Fav",
                                      //       style: TextStyle(
                                      //           fontSize: 18.0,
                                      //           color: Colors.black,
                                      //           fontWeight: FontWeight.bold),
                                      //     ))
                                    ],
                                  )),
                              onTap: () {
                                favoritesBloc.addFavoriteMovie(
                                    context, movie.movieId, movie.moviename);
                              },
                            ),
                          ),
                          Expanded(child: Text("")),
                          SizedBox(width: 10.0),
                        ],
                      ),
                    ),
                    (rentedMovies.any((e) => int.tryParse(e) == movie.movieId))
                        ? Container(
                            height: layoutDecide ? 250.0 : 350.0,
                            alignment: Alignment.center,
                            child: InkWell(
                              child: Container(
                                  width: 50.0,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(225, 185, 36, 1.0),
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                  child: Stack(
                                    alignment: Alignment.centerLeft,
                                    children: [
                                      Icon(Icons.arrow_right,
                                          size: 50.0, color: Colors.black),
                                      // Container(
                                      //     padding: EdgeInsets.only(
                                      //         left: 40.0, top: 0),
                                      //     child: Text(
                                      //       "Play",
                                      //       style: TextStyle(
                                      //           fontSize: 18.0,
                                      //           color: Colors.black,
                                      //           fontWeight: FontWeight.bold),
                                      //     ))
                                    ],
                                  )),
                              onTap: () {
                                (rentedMovies.any((e) =>
                                        int.tryParse(e) == movie.movieId))
                                    ? playMovie(movie.movieId).then((value) {
                                        this.setState(() {
                                          videoUrl = value['movieUrl'];
                                          signedCookie = value['cookie'];
                                          showVideoPlayer = true;
                                        });
                                        widget.hideAppBarDelegate(true);
                                        // flickPlayerDialog(
                                        //     context, null, value['movieUrl'],
                                        //     signatureHeader: value['cookie']);
                                      })
                                    : () {};
                              },
                            ),
                          )
                        : Container(),
                  ],
                ))
        : Container();
    // });
  }
}
