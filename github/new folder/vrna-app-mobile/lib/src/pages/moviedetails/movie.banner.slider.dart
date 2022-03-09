import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vrna_app_mobile/src/blocs/movie.player.bloc.dart';
import 'package:vrna_app_mobile/src/helpers/storage/storage.helper.dart';
import 'package:vrna_app_mobile/src/models/movie.model.dart';
import 'package:vrna_app_mobile/src/models/movieplaymeta.model.dart';
import '../../helpers/video_player_helper.dart';
import 'package:vrna_app_mobile/src/values/devicescreen.dart';
import '../../widgets/theme.dart' as customTheme;

class MovieBannerSlider extends StatefulWidget {
  final String bannerUrl;
  final Movie movie;
  const MovieBannerSlider({
    Key key,
    this.movie,
    this.bannerUrl,
  });
  @override
  _MovieBannerState createState() => _MovieBannerState();
}

class _MovieBannerState extends State<MovieBannerSlider> {
  var genreData = {};
  var rentedMovies = [];
  var cvvTextController = TextEditingController();
  var cardNumberTextControler = TextEditingController();
  MoviePlayerBloc moviePlayerBloc;
  var mediaPlayer;
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

  Future<Map<String, String>> playMovie(movieId) async {
    Map<String, String> metaData = {};
    MoviePlayMeta moviePlayMetaData =
        await moviePlayerBloc.getMoviePlayMetaData(movieId);
    var movieUrl = moviePlayMetaData.movieUrl;
    var signedCookie =
        'G_ENABLED_IDPS=google;CloudFront-Policy=${moviePlayMetaData.cloudFrontPolicy};CloudFront-Signature=${moviePlayMetaData.cloudFrontSignature};CloudFront-Key-Pair-Id=${moviePlayMetaData.cloudFrontKeyPairId}';
    print(
        'Movie URL : $movieUrl, signedCookie : ${moviePlayMetaData.cloudFrontSignature}');
    metaData['movieUrl'] = movieUrl;
    metaData['cookie'] = signedCookie;
    return metaData;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    moviePlayerBloc = Provider.of<MoviePlayerBloc>(context);
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
        ? Container(
                    alignment:Alignment.topCenter, 
            child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [              
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[ 

                  Container( 
                    alignment:Alignment.topCenter,
                    width: size.width,
                    child: InkWell(
                        child: Card( 
                          child: Container(
                            height:layoutDecide? 250.0 : 350.0,
                            color:Colors.black,
                            width: MediaQuery.of(context).size.width,
                            child: Image.network(
                              widget.bannerUrl,
                                fit:layoutDecide? BoxFit.fitWidth : BoxFit.fill),
                          ),
                        ),
                        onTap: () {}),
                  ),
                ],
              ),




              Container( 
                alignment: Alignment.bottomLeft,
                padding: EdgeInsets.only(bottom: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(width: 10.0),
                    // InkWell(
                    //   child: (rentedMovies
                    //           .any((e) => int.tryParse(e) == movie.movieId))
                    //       ? Image.asset(
                    //           "assets/play.png",
                    //           width: 76.0,
                    //           height: 31.0,
                    //         )
                    //       : Text(''),
                    //   onTap: () {
                    //     (rentedMovies
                    //             .any((e) => int.tryParse(e) == movie.movieId))
                    //         ? playMovie(movie.movieId).then((value) {
                    //             flickPlayerDialog(
                    //                 context, null, movie.trailerurl,signatureHeader: value['cookie']);
                    //           })
                    //         : () {};
                    //   },
                    // ),
                    // SizedBox(width: 10.0),
                    InkWell(
                      child: Image.asset(
                        "assets/watchtrailer.png",
                        width: 123.0,
                        height: 31.0,
                      ),
                      onTap: () {
                        // (rentedMovies
                        //     .any((e) => int.tryParse(e) == movie.movieId)) ?
                        //     flickPlayerDialog(context,null,movie.movieurl) :
                        flickPlayerDialog(context, null, movie.trailerurl);
                      },
                    ),

                    // InkWell(
                    //   child: Image.asset(
                    //     "assets/rent.png",
                    //     width: 123.0,
                    //     height: 31.0,
                    //   ),
                    //   onTap: () {
                    //     // (rentedMovies
                    //     //     .any((e) => int.tryParse(e) == movie.movieId)) ?
                    //     //     flickPlayerDialog(context,null,movie.movieurl) :
                    //     flickPlayerDialog(context, null, movie.trailerurl);
                    //   },
                    // ),
                    Expanded(child: Text("")),
                    SizedBox(width: 10.0),
                    InkWell(
                      child: Container(
                        padding: EdgeInsets.only(top: 30.0),
                        child: Icon(
                          Icons.info_outline,
                          color: Colors.white,
                          size: 34.0,
                        ),
                      ),
                    ),
                    SizedBox(width: 10.0),
                    InkWell(
                      child: Container(
                        padding: EdgeInsets.only(top: 30.0),
                        child: Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                          size: 34.0,
                        ),
                      ),
                    ),
                    SizedBox(width: 10.0),
                  ],
                ),
              ),
              (rentedMovies
                             .any((e) => int.tryParse(e) == movie.movieId)) ?
              Container(  
                height: layoutDecide? 250.0 : 350.0,
                alignment: Alignment.center, 
                child: InkWell(
                      child: Image.asset(
                       "assets/play.png",
                              width: 76.0,
                              height: 31.0,
                      ),
                      onTap: () {
                        (rentedMovies
                             .any((e) => int.tryParse(e) == movie.movieId))?
                        flickPlayerDialog(context, null, movie.trailerurl) : (){};
                      }, 
                    ), 
              ) : Container(),
            ],
          ))
        : Container();
    // });
  }
}
