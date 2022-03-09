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
  var expiryYear = "2021";
  var expiryMonth = "June";
  var cvvTextController = TextEditingController();
  var cardNumberTextControler = TextEditingController();
  var cardListResponse;
  List<String> rentedMovies;
  PaymentBloc bloc;
  int _currentIndex = 0;
  VideoPlayerController _controller;
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

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    bloc = Provider.of<PaymentBloc>(context);
    bloc.getCardList(context);
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var device = getDeviceType(mediaQuery);
    customTheme.Theme theme = customTheme.Theme.getTheme(device);
    Size size = MediaQuery.of(context).size;
    var activeCard;
    int cardSelected = 0;
    var currentMovie;
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
            currentMovie = cardList[0];
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
                      onPageChanged: (index, reason) =>
                          {currentMovie = cardList[index]},
                      height: layoutDecide ? 250.0 : 350.0,
                      //height: theme.homecarouselheight,
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
                          height: layoutDecide ? 250.0 : 350.0,
                          width: size.width,
                          child: InkWell(
                              child: Card( 
                                child: Container(
                                  child: Image.network(movie.moviebannerurl,
                                      fit: BoxFit.fill),
                                ),
                              ),
                              onTap: () {
                                print("${movie.moviename}");
                              }),
                        );
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
              Container(
                padding: EdgeInsets.only(
                  bottom: 60.0,
                ),
                child: Row(
                  children: [
                    SizedBox(width: 100.0),
                    Expanded(
                      child: Center(
                        child: InkWell(
                          child: Container(
                              alignment: Alignment.center,
                              width: 160.0,
                              height: 60.0,
                              child: Image.asset(
                                "assets/play.png",
                                width: 100.0,
                                height: 40.0,
                              )),
                          onTap: () {
                            var movie;
                            if (currentMovie != null) {
                              movie = currentMovie;
                            }
                            Route route = MaterialPageRoute(
                                builder: (context) => MovieDetailsPage(
                                      details: movie,
                                    ));
                            Navigator.push(context, route);
                          },
                        ),
                      ),
                    ),
                    SizedBox(width: 10.0),
                    InkWell(
                      child: Icon(
                        Icons.info_outline,
                        color: Colors.white,
                        size: 34.0,
                      ),
                    ),
                    SizedBox(width: 10.0),
                    InkWell(
                      child: Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                        size: 34.0,
                      ),
                    ),
                    SizedBox(width: 10.0),
                  ],
                ),
              ),
            ],
          ));
        });
  }
}
