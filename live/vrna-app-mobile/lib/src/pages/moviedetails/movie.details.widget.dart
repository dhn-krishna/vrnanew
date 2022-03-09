import 'package:flutter/material.dart' hide Card;
import 'package:flutter/rendering.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:vrna_app_mobile/src/blocs/dashboard.bloc.dart';
import 'package:provider/provider.dart';
import 'package:vrna_app_mobile/src/blocs/movie.bloc.dart';
import 'package:vrna_app_mobile/src/blocs/movie.player.bloc.dart';
import 'package:vrna_app_mobile/src/blocs/payment.bloc.dart';
import 'package:vrna_app_mobile/src/helpers/storage/storage.helper.dart';
import 'package:vrna_app_mobile/src/models/actor.model.dart';
import 'package:vrna_app_mobile/src/models/movieplaymeta.model.dart';
import 'package:vrna_app_mobile/src/models/payment/Card.dart';
import 'package:vrna_app_mobile/src/models/payment/CardListResponse.dart';
import 'package:vrna_app_mobile/src/pages/actordetails/actor.details.page.dart';
import 'package:vrna_app_mobile/src/widgets/on_hover.dart';
import '../../helpers/video_player_helper.dart';
import 'package:vrna_app_mobile/src/widgets/edit_text.dart';
import 'package:vrna_app_mobile/src/pages/moviedetails/movie.detail.video.dart';
import 'package:video_player/video_player.dart';
import 'package:vrna_app_mobile/src/widgets/button.dart';
import 'package:vrna_app_mobile/src/values/devicescreen.dart';
import '../../widgets/theme.dart' as customTheme;
import 'movie.banner.slider.dart';
import 'movie.details.page.dart';

class MovieDetailsWidget extends StatefulWidget {
  final details;
  final bloc;
  final hideAppBarDelegate;
  MovieDetailsWidget({this.bloc, this.details, this.hideAppBarDelegate});

  @override
  State<StatefulWidget> createState() => _MovieDetailsWidgetState();
}

class _MovieDetailsWidgetState extends State<MovieDetailsWidget> {
  List rentedMovies = [];
  PaymentBloc paymentBloc;
  MoviePlayerBloc moviePlayerBloc;
  MovieBloc movieBloc;

  get gender => null;
  @override
  void initState() {
    super.initState();
    StorageHelper.get("rentedMovies").then((val) {
      setState(() {
        rentedMovies = val != null ? val.split(",") : [];
      });
    });
  }

  Future<Map<String, String>> playMovie(movieId) async {
    Map<String, String> metaData = {};
    MoviePlayMeta moviePlayMetaData =
        await moviePlayerBloc.getMoviePlayMetaData(movieId);
    var movieUrl = moviePlayMetaData.movieUrl;
    var signedCookie =
        'G_ENABLED_IDPS=google;CloudFront-Policy=${moviePlayMetaData.cloudFrontPolicy};CloudFront-Signature=${moviePlayMetaData.cloudFrontSignature};CloudFront-Key-Pair-Id=${moviePlayMetaData.cloudFrontKeyPairId}';
    print('Movie URL : $movieUrl, signedCookie : $signedCookie');
    metaData['movieUrl'] = movieUrl;
    metaData['cookie'] = signedCookie;
    return metaData;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    paymentBloc = Provider.of<PaymentBloc>(context);
    moviePlayerBloc = Provider.of<MoviePlayerBloc>(context);
    movieBloc = Provider.of<MovieBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    var details = widget.details;
    var bloc = widget.bloc;
    var mediaQuery = MediaQuery.of(context);
    var device = getDeviceType(mediaQuery);
    bool layoutDecide = MediaQuery.of(context).size.width < 1024;
    customTheme.Theme theme = customTheme.Theme.getTheme(device);
    Size size = MediaQuery.of(context).size;
    var isRentedMovie =
        rentedMovies.any((e) => int.tryParse(e) == details?.movieId);
    return SingleChildScrollView(
        child: Padding(
      padding: EdgeInsets.all(0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MovieBannerSlider(
              movie: details,
              bannerUrl: details?.moviebannerurl ?? '',
              dashboardBloc: bloc,
              hideAppBarDelegate: widget.hideAppBarDelegate),
          Column(
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        direction: layoutDecide ? Axis.vertical : Axis.vertical,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(right: 10.0),
                            width: layoutDecide
                                ? mediaQuery.size.width
                                : mediaQuery.size.width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: layoutDecide
                                  ? CrossAxisAlignment.center
                                  : CrossAxisAlignment.center,
                              children: [
                                Text(details?.moviename ?? '',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 35.0,
                                        fontFamily: 'SF UI Display',
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(height: 10.0),
                                RatingBar.builder(
                                  initialRating:
                                      (details?.userRating as num).toDouble(),
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: false,
                                  itemCount: 5,
                                  itemPadding:
                                      EdgeInsets.symmetric(horizontal: 4.0),
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Color.fromRGBO(255, 185, 36, 1.0),
                                    size: 6.0,
                                  ),
                                  onRatingUpdate: (rating) {
                                    movieBloc.rateMovie(
                                        context, details?.movieId, rating);
                                  },
                                ),
                                // RatingBar(
                                //   rating:
                                //       (details?.userRating as num).toDouble(),
                                //   itemBuilder: (context, index) => Icon(
                                //     Icons.star,
                                //     color: Color.fromRGBO(255, 185, 36, 1.0),
                                //     size: 6.0,
                                //   ),

                                // ),
                                SizedBox(height: 30.0),
                                Text(details?.description ?? '',
                                    style: theme.fmoviedesc),
                                SizedBox(height: 15.0),
                              ],
                            ),
                          ),
                          Container(
                            width: layoutDecide
                                ? mediaQuery.size.width
                                : mediaQuery.size.width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        width: 200.0,
                                        child: Text(
                                          "Actors:",
                                          style: theme.director,
                                        )),
                                    Expanded(
                                      child: Text(
                                        details?.cast?.join(",") ?? '',
                                        style: theme.directoryellow,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 5.0),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        width: 200.0,
                                        child: Text(
                                          "Producer:",
                                          style: theme.director,
                                        )),
                                    Expanded(
                                      child: Text(
                                        details?.producer?.join(",") ?? '',
                                        style: theme.directoryellow,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 5.0),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        width: 200.0,
                                        child: Text(
                                          "Director:",
                                          style: theme.director,
                                        )),
                                    Expanded(
                                      child: Text(
                                        details?.director?.join(",") ?? '',
                                        style: theme.directoryellow,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 5.0),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        width: 200.0,
                                        child: Text(
                                          "Language:",
                                          style: theme.director,
                                        )),
                                    Expanded(
                                      child: Text(
                                        details?.language ?? '',
                                        style: theme.directoryellow,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 5.0),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        width: 200.0,
                                        child: Text(
                                          "Year:",
                                          style: theme.director,
                                        )),
                                    Expanded(
                                      child: Text(
                                        details?.year ?? '',
                                        style: theme.directoryellow,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 15.0),
                                // Temporary section (for rent section)
                                // Padding(
                                //   padding: const EdgeInsets.all(2.0),
                                //   child: InkWell(
                                //     child: isRentedMovie
                                //         ? Container()
                                //         : Image.asset(
                                //             "assets/rent.png",
                                //             width: 76.0,
                                //             height: 31.0,
                                //           ),
                                //     onTap: () {
                                //       isRentedMovie
                                //           ? () {}
                                //           : showRentDialog(
                                //               context, bloc, details);
                                //     },
                                //   ),
                                // ),
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
          ),
          MovieActors(data: bloc.movieCastData),
          SizedBox(height: size.height * 0.03),
          //CustomSlidersub(bannerdata: bloc.responsedata, parentBloc: bloc),
          //SizedBox(height: size.height * 0.03),
          // MovieScene(
          //   data: bloc.latestMovieData,
          //   parentBloc: bloc,
          // ),
          // SizedBox(height: size.height * 0.03),
          RelatedMovie(
            movies: bloc.relatedMovieList,
            parentBloc: bloc,
          ),
          SizedBox(height: size.height * 0.03),
          // HistR(data: bloc.featuredActorModel),
        ],
      ),
    ));
  }

  void showRentDialog(context, bloc, movie) {
    var mediaQuery = MediaQuery.of(context);
    var device = getDeviceType(mediaQuery);
    customTheme.Theme theme = customTheme.Theme.getTheme(device);
    // Size size = MediaQuery.of(context).size;
    var expiryYear = "2021";
    var expiryMonth = "July";
    var cvvTextController = TextEditingController();
    var cardNumberTextControler = TextEditingController();
    var cardListResponse;
    var cardSelected = 0;
    var activeCard;

    bool layoutDecide = MediaQuery.of(context).size.width < 1024;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (context, StateSetter setState) {
            return FutureBuilder<CardListResponse>(
                future: bloc.getCardListPayLoad(context),
                builder: (context, paymentSnapshot) {
                  cardListResponse = [];
                  if (paymentSnapshot.data != null) {
                    cardListResponse = paymentSnapshot.data.cards;
                    if (cardListResponse != null)
                      activeCard = cardListResponse[0];
                  }
                  return AlertDialog(
                    backgroundColor: Color.fromRGBO(53, 70, 78, 1.0),
                    contentPadding: EdgeInsets.all(20.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    content: Stack(
                      overflow: Overflow.visible,
                      children: <Widget>[
                        Container(
                            width: MediaQuery.of(context).size.width * 0.6,
                            height: MediaQuery.of(context).size.height * 0.9,
                            child: ListView(
                              scrollDirection: Axis.vertical,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(
                                    left: 15.0,
                                    top: 15.0,
                                    right: 15.0,
                                    bottom: 15.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(34, 47, 53, 1.0),
                                  ),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                            color: Colors.green,
                                            child: Image.network(
                                              movie.landscapeurl,
                                              fit: BoxFit.fill,
                                              height: 150.0,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.75,
                                            )),
                                        SizedBox(height: 15.0),
                                        Flex(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            direction: layoutDecide
                                                ? Axis.vertical
                                                : Axis.horizontal,
                                            children: <Widget>[
                                              Container(
                                                padding: EdgeInsets.only(
                                                    right: 50.0),
                                                width: layoutDecide
                                                    ? mediaQuery.size.width
                                                    : (mediaQuery.size.width *
                                                            0.50) *
                                                        0.20,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(movie.moviename ?? '',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            fontSize: 18.0,
                                                            fontFamily:
                                                                'SF UI Display',
                                                            color:
                                                                Color.fromRGBO(
                                                                    225,
                                                                    185,
                                                                    36,
                                                                    0.8),
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                width: layoutDecide
                                                    ? mediaQuery.size.width
                                                    : (mediaQuery.size.width *
                                                            0.50) *
                                                        0.55,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    RichText(
                                                      textAlign: TextAlign.left,
                                                      text: TextSpan(
                                                          text: 'Actors: ',
                                                          style: theme.bycont,
                                                          children: <TextSpan>[
                                                            TextSpan(
                                                              text: movie?.cast
                                                                      ?.join(
                                                                          ",") ??
                                                                  '',
                                                              style: theme
                                                                  .bycontyellow,
                                                            ),
                                                          ]),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                width: layoutDecide
                                                    ? mediaQuery.size.width
                                                    : (mediaQuery.size.width *
                                                            0.50) *
                                                        0.20,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    RatingBarIndicator(
                                                      itemSize: 13.0,
                                                      rating: 15,
                                                      itemBuilder:
                                                          (context, index) =>
                                                              Icon(
                                                        Icons.star,
                                                        color: Color.fromRGBO(
                                                            255, 185, 36, 1.0),
                                                        size: 0.50,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ]),
                                        SizedBox(height: 15.0),
                                        Text(movie?.description ?? '',
                                            style: theme.bycont),
                                      ]),
                                ),
                                SizedBox(height: 15.0),
                                Container(
                                  child: SingleChildScrollView(
                                    child: Column(children: [
                                      Theme(
                                        data: Theme.of(context).copyWith(
                                          unselectedWidgetColor: Colors.red,
                                          disabledColor: Colors.blue,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            SizedBox(height: 30.0),
                                            Row(children: [
                                              Text("Your Card Details",
                                                  style: theme.moviefare),
                                            ]),
                                            for (var i = 0;
                                                i < cardListResponse.length;
                                                i++)
                                              ListTile(
                                                  title: Text(
                                                      "**** **** **** ${cardListResponse[i].cardNo}",
                                                      style: TextStyle(
                                                        color: Color.fromRGBO(
                                                            255, 255, 219, 1.0),
                                                      )),
                                                  leading: Radio<int>(
                                                    // toggleable: true,
                                                    activeColor: Colors.white,
                                                    value: i,
                                                    groupValue: cardSelected,
                                                    onChanged: (v) => {
                                                      setState(() {
                                                        activeCard =
                                                            cardListResponse[v];
                                                        cardSelected = v ?? 0;
                                                      })
                                                    },
                                                  )),
                                            ListTile(
                                                title: Text(
                                                    "New Credit/Debit/ATM Card",
                                                    style: TextStyle(
                                                      color: Color.fromRGBO(
                                                          255, 255, 219, 1.0),
                                                    )),
                                                leading: Radio<int>(
                                                  toggleable: true,
                                                  activeColor: Colors.white,
                                                  value:
                                                      cardListResponse.length,
                                                  groupValue: cardSelected,
                                                  onChanged: (v) => {
                                                    setState(() {
                                                      cardSelected = v ?? 0;
                                                    })
                                                  },
                                                )),
                                            SizedBox(height: 20.0),
                                            if (cardSelected ==
                                                cardListResponse.length)
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  TextFormField(
                                                    controller:
                                                        cardNumberTextControler,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                    decoration:
                                                        const InputDecoration(
                                                      hintText:
                                                          'Only Card Number',
                                                      labelText: 'Card Number',
                                                      labelStyle: TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: Color.fromRGBO(
                                                              225,
                                                              185,
                                                              36,
                                                              0.8),
                                                        ),
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: Color.fromRGBO(
                                                              225,
                                                              185,
                                                              36,
                                                              0.8),
                                                          width: 2.0,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(height: 30.0),
                                                  Row(
                                                      textDirection:
                                                          TextDirection.ltr,
                                                      children: [
                                                        Flexible(
                                                            child: Container(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 10.0,
                                                                  right: 10.0),
                                                          decoration:
                                                              BoxDecoration(
                                                            border: Border.all(
                                                                width: 2.0,
                                                                color: Color
                                                                    .fromRGBO(
                                                                        225,
                                                                        185,
                                                                        36,
                                                                        0.8)),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child:
                                                              DropdownButtonHideUnderline(
                                                            child:
                                                                DropdownButton<
                                                                    String>(
                                                              isDense: false,
                                                              isExpanded: true,
                                                              dropdownColor:
                                                                  Colors.black,
                                                              focusColor:
                                                                  Colors.black,
                                                              //value: _chosenValue,
                                                              //elevation: 5,
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black),
                                                              iconEnabledColor:
                                                                  Colors.orange,
                                                              items: {
                                                                'Jan':
                                                                    'January',
                                                                'Feb':
                                                                    'February',
                                                                'Mar': 'March',
                                                                'Apr': 'April',
                                                                'May': 'May',
                                                                'Jun': 'June',
                                                                'Jul': 'July',
                                                                'Aug': 'August',
                                                                'Sep':
                                                                    'September',
                                                                'Oct':
                                                                    'October',
                                                                'Nov':
                                                                    'November',
                                                                'Dec':
                                                                    'December'
                                                              }
                                                                  .map((k, v) {
                                                                    return new MapEntry(
                                                                        v,
                                                                        DropdownMenuItem(
                                                                          value:
                                                                              v,
                                                                          child:
                                                                              Text(
                                                                            k,
                                                                            style:
                                                                                TextStyle(color: Colors.white),
                                                                          ),
                                                                        ));
                                                                  })
                                                                  .values
                                                                  .toList(),
                                                              hint: Text(
                                                                "Expiry Month",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                              ),
                                                              onChanged: (String
                                                                  value) {
                                                                setState(() {
                                                                  expiryMonth =
                                                                      value ??
                                                                          '';
                                                                });
                                                              },
                                                              value:
                                                                  expiryMonth,
                                                            ),
                                                          ),
                                                        )),
                                                        SizedBox(width: 10.0),
                                                        Flexible(
                                                            child: Container(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 10.0,
                                                                  right: 10.0),
                                                          decoration:
                                                              BoxDecoration(
                                                            border: Border.all(
                                                                width: 2.0,
                                                                color: Color
                                                                    .fromRGBO(
                                                                        225,
                                                                        185,
                                                                        36,
                                                                        0.8)),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child:
                                                              DropdownButtonHideUnderline(
                                                            child:
                                                                DropdownButton<
                                                                    String>(
                                                              isDense: false,
                                                              isExpanded: true,
                                                              focusColor:
                                                                  Colors.black,
                                                              dropdownColor:
                                                                  Colors.black,
                                                              //value: _chosenValue,
                                                              //elevation: 5,
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black),
                                                              iconEnabledColor:
                                                                  Colors.orange,
                                                              items: <String>[
                                                                '2021',
                                                                '2022',
                                                                '2023',
                                                                '2024',
                                                                '2025',
                                                                '2026',
                                                                '2027',
                                                              ].map<
                                                                  DropdownMenuItem<
                                                                      String>>((String
                                                                  value) {
                                                                return DropdownMenuItem<
                                                                    String>(
                                                                  value: value,
                                                                  child: Text(
                                                                    value,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            12.0,
                                                                        color: Colors
                                                                            .white),
                                                                  ),
                                                                );
                                                              }).toList(),
                                                              hint: Text(
                                                                "Expiry Year",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                              ),
                                                              onChanged: (String
                                                                  value) {
                                                                setState(() {
                                                                  expiryYear =
                                                                      value ??
                                                                          '';
                                                                });
                                                              },
                                                              value: expiryYear,
                                                            ),
                                                          ),
                                                        )),
                                                        SizedBox(width: 10.0),
                                                        Flexible(
                                                          child: TextFormField(
                                                            controller:
                                                                cvvTextController,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            decoration:
                                                                const InputDecoration(
                                                              hintText: 'cvv',
                                                              labelText: 'CVV',
                                                              labelStyle:
                                                                  TextStyle(
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              ),
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          225,
                                                                          185,
                                                                          36,
                                                                          0.8),
                                                                  width: 2.0,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ]),
                                                ],
                                              )
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 30.0),
                                    ]),
                                  ),
                                )
                                // })
                                ,
                                SizedBox(height: 20.0),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: InkWell(
                                          child: Container(
                                            height: 40.0,
                                            padding: EdgeInsets.only(
                                                top: 6.0, bottom: 6.0),
                                            decoration: BoxDecoration(
                                              color: Color.fromRGBO(
                                                  255, 87, 34, 1.0),
                                              border: Border.all(
                                                  width: 1.0,
                                                  color: Color.fromRGBO(
                                                      255, 87, 34, 1.0)),
                                            ),
                                            child: Text(
                                              "Cancel",
                                              textAlign: TextAlign.center,
                                              style: theme.buttontext,
                                            ),
                                          ),
                                          onTap: () => {Navigator.pop(context)},
                                        ),
                                      ),
                                      SizedBox(width: 10.0),
                                      Expanded(
                                        child: InkWell(
                                          child: Container(
                                              height: 40.0,
                                              decoration: BoxDecoration(
                                                color: Color.fromRGBO(
                                                    225, 185, 36, 1.0),
                                              ),
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "Checkout",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: theme.buttontext,
                                                    ),
                                                  ])),
                                          onTap: () {
                                            if (cardSelected ==
                                                cardListResponse.length) {
                                              Card card = new Card(
                                                  cardNo:
                                                      cardNumberTextControler
                                                          .text,
                                                  expiryMonth: expiryMonth,
                                                  expiryYear: expiryYear,
                                                  secretPin:
                                                      cvvTextController.text);
                                              paymentBloc
                                                  .addNewCard(context, card)
                                                  .then((val) {
                                                if (val == 1) {
                                                  paymentBloc
                                                      .processPayment(
                                                          context, card, movie)
                                                      .then((val) {
                                                    if (val == 1) {
                                                      bloc.dashboardAllData(
                                                          context);
                                                      int count = 0;
                                                      Navigator.of(context)
                                                          .popUntil((_) =>
                                                              count++ >= 2);
                                                    }
                                                  });
                                                }
                                              });
                                            } else {
                                              activeCard = activeCard ??
                                                  cardListResponse[
                                                      cardSelected];
                                              paymentBloc
                                                  .processPayment(context,
                                                      activeCard, movie)
                                                  .then((val) {
                                                if (val == 1) {
                                                  bloc.dashboardAllData(
                                                      context);
                                                  int count = 0;
                                                  Navigator.of(context)
                                                      .popUntil(
                                                          (_) => count++ >= 2);
                                                }
                                              });
                                            }
                                          },
                                        ),
                                      ),
                                    ])
                              ],
                            )),
                        Positioned(
                          right: -20.0,
                          top: -20.0,
                          child: InkResponse(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: CircleAvatar(
                              radius: 16,
                              backgroundColor: Color.fromRGBO(23, 99, 124, 1.0),
                              child: CircleAvatar(
                                backgroundColor:
                                    Color.fromRGBO(13, 13, 13, 1.0),
                                child: Icon(Icons.close,
                                    size: 14.0,
                                    color: Color.fromRGBO(
                                      34,
                                      184,
                                      233,
                                      1.0,
                                    )),
                                radius: 14,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                });
          });
        });
  }

  void showAlertDialog(BuildContext context, DashboardBloc bloc) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.black,
            content: Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                Positioned(
                  right: -40.0,
                  top: -40.0,
                  child: InkResponse(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: CircleAvatar(
                      child: Icon(Icons.close),
                      backgroundColor: Colors.red,
                    ),
                  ),
                ),
                Form(
// key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(2.0),
                        child: EditText(
                          placeholder: "Card number",
                          value: bloc.cardnumber,
                          onChange: (value) => bloc.setCardnumber(value),
// prefixIcon: Icons.email_sharp,
                          keyboardType: TextInputType.text,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(2.0),
                        child: EditText(
                          placeholder: "Expiry month",
                          value: bloc.month,
                          onChange: (value) => bloc.setMonth(value),
// prefixIcon: Icons.email_sharp,
                          keyboardType: TextInputType.text,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(2.0),
                        child: EditText(
                          placeholder: "Expiry year",
                          value: bloc.year,
                          onChange: (value) => bloc.setYear(value),
// prefixIcon: Icons.email_sharp,
                          keyboardType: TextInputType.text,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(2.0),
                        child: EditText(
                          placeholder: "CVV",
                          value: bloc.cvv,
                          onChange: (value) => bloc.setCvv(value),
// prefixIcon: Icons.email_sharp,
                          keyboardType: TextInputType.text,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: RaisedButton(
                          child: Text("Submit"),
                          onPressed: () => null,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}

class TopMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        width: size.width * 0.99,
        child: Padding(
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: IconButton(
                  icon: Icon(
                    Icons.keyboard_backspace,
                    color: Colors.white,
                    size: 30.0,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
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

class MovieBanner extends StatefulWidget {
  final String posterurl;
  final int movieId;
  final String filepath;
  final int ppmCost;
  final Stream<dynamic> rentalData;
  const MovieBanner(
      {Key key,
      this.posterurl,
      this.movieId,
      this.filepath,
      this.ppmCost,
      this.rentalData});

  @override
  _MovieBannerApp createState() => _MovieBannerApp();
}

class _MovieBannerApp extends State<MovieBanner> {
  DashboardBloc bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    bloc = Provider.of<DashboardBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return StreamBuilder<dynamic>(
        stream: widget.rentalData,
        initialData: "",
        builder: (context, snapshot) {
          List rentalMovieList = [];
          if (snapshot.data != null && snapshot.data != '') {
            rentalMovieList = snapshot.data.dataRentalMovie;
          }
          var rental = false;
          for (var i = 0; i < rentalMovieList.length; i++) {
            if (rentalMovieList[i].movieId == widget.movieId) {
              rental = true;
              break;
            }
          }
          return Stack(
            children: [
              Container(
                width: size.width * 1,
                height: size.height * 0.25,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(widget.posterurl ?? ''),
                        fit: BoxFit.cover)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    rental
                        ? IconButton(
                            icon: Icon(
                              Icons.play_circle_outline,
                              color: Colors.white,
                              size: 30.0,
                            ),
                            onPressed: () {
                              Route route = MaterialPageRoute(
                                  builder: (context) => MovieVideo(
                                      movieUrl: widget.filepath ?? ''));
                              Navigator.push(context, route);
                            })
                        : CustomButton(
                            label: "Rent",
                            onPress: () {
                              // Route route = MaterialPageRoute(
                              //     builder: (context) =>
                              //      );
                              // Navigator.push(context, route);
                            },
                            width: size.width * 0.3,
                            height: size.height * 0.02,
                          ),
                  ],
                ),
              ),
              Positioned(
                top: 40.0,
                child: TopMenu(),
              )
            ],
          );
        });
  }
}

class MovieDescription extends StatelessWidget {
  final int movieId;
  final String moviename;
  final String description;
  final List cast;
  final List genre;
  final List director;
  const MovieDescription(
      {Key key,
      this.description,
      this.moviename,
      this.movieId,
      this.genre,
      this.cast,
      this.director});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String directorData = director.join(', ');
    String actorData = cast.join(', ');

    return Container(
        width: size.width * 0.99,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(moviename ?? '',
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
                for (var resultGenre in genre)
                  Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: RaisedButton(
                        textColor: Colors.white,
                        color: Colors.grey,
                        child: Text(resultGenre.toString()),
                        onPressed: () {},
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                      )),
              ]),
              SizedBox(height: size.height * 0.03),
              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Container(
                  width: size.width * 0.92,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(description ?? '',
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
                    child: Text(actorData,
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
                    child: Text(directorData,
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

enum SingingCharacter { lafayette, jefferson }

class MovieActors extends StatefulWidget {
  final Stream<dynamic> data;
  const MovieActors({Key key, this.data});
  @override
  _MovieActorsState createState() => _MovieActorsState();
}

class _MovieActorsState extends State<MovieActors> {
  final formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
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
          List cast = [];
          if (snapshot.data != null && snapshot.data != '') {
            cast = snapshot.data.cast;
          }
          return Container(
              padding: EdgeInsets.only(left: 30.0, right: 30.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('MOVIE',
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
                          Container(
                            padding: EdgeInsets.only(
                              top: 10.0,
                              bottom: 20.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                for (Actor actor in cast)
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
                                                actor?.imageUrl != null
                                                    ? 'http://' +
                                                        actor?.imageUrl
                                                    : 'http://placehold.it/32x32',
                                                fit: BoxFit.fill,
                                                width: 200.0,
                                                height: 200.0,
                                              )),
                                              SizedBox(height: 10.0),
                                              Text(actor?.castname,
                                                  style: theme.actorname)
                                            ],
                                          )),
                                      onTap: () {
                                        Route route = MaterialPageRoute(
                                            builder: (context) =>
                                                ActorDetailsPage(
                                                    actorId: actor.castId));
                                        Navigator.push(context, route);
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

// Movie Scene

class MovieScene extends StatefulWidget {
  final Stream<dynamic> data;
  final Stream<dynamic> rentedMovies;
  final DashboardBloc parentBloc;
  const MovieScene({Key key, this.data, this.rentedMovies, this.parentBloc});

  @override
  _MovieSceneApp createState() => _MovieSceneApp();
}

class _MovieSceneApp extends State<MovieScene> {
  final _formKey = GlobalKey<FormState>();
  var cvvTextController = TextEditingController();
  var cardNumberTextControler = TextEditingController();
  int cardSelected = 0;
  var cardListResponse;
  var activeCard;
  PaymentBloc bloc;
  List<String> rentedMovies;
  VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {}

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    bloc = Provider.of<PaymentBloc>(context);
    // bloc.getCardList(context);
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
          List latestMovieList = [];
          if (snapshot.data != null && snapshot.data != '') {
            latestMovieList = snapshot.data.dataLatestMovie;
          }
          return Container(
              padding: EdgeInsets.only(left: 30.0, right: 30.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('MOVIE ',
                            style: theme.latesthead, textAlign: TextAlign.left),
                        SizedBox(width: 10.0),
                        Text('SCENE',
                            style: theme.latestheadyellow,
                            textAlign: TextAlign.left),
                      ],
                    ),
                    SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Container(
                          padding: EdgeInsets.all(20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              for (var movie in latestMovieList)
                                Container(
                                  margin: EdgeInsets.only(
                                    top: 20.0,
                                    left: 10.0,
                                  ),
                                  decoration: BoxDecoration(boxShadow: [
                                    new BoxShadow(
                                      color: Color.fromRGBO(225, 185, 36, 0.5),
                                      blurRadius: 26.5,
                                      spreadRadius: 0.5,
                                    ),
                                  ]),
                                  child: Row(
                                    children: <Widget>[
                                      const Padding(padding: EdgeInsets.all(4)),
                                      InkWell(
                                        child: Image.network(
                                          movie.moviebannerurl,
                                          fit: BoxFit.cover,
                                          width: theme.latestthumbwidth1,
                                          height: theme.latestthumbheight1,
                                        ),
                                        onTap: () {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  backgroundColor:
                                                      Color.fromRGBO(
                                                          13, 13, 13, 1.0),
//   backgroundColor:Colors.white,
                                                  contentPadding:
                                                      EdgeInsets.all(20.0),
                                                  content: Stack(
                                                    overflow: Overflow.visible,
                                                    children: <Widget>[
                                                      Positioned(
                                                        right: -20.0,
                                                        top: -20.0,
                                                        child: InkResponse(
                                                          onTap: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          child: CircleAvatar(
                                                            radius: 16,
                                                            backgroundColor:
                                                                Color.fromRGBO(
                                                                    23,
                                                                    99,
                                                                    124,
                                                                    1.0),
                                                            child: CircleAvatar(
                                                              backgroundColor:
                                                                  Color
                                                                      .fromRGBO(
                                                                          13,
                                                                          13,
                                                                          13,
                                                                          1.0),
                                                              child: Icon(
                                                                  Icons.close,
                                                                  size: 14.0,
                                                                  color: Color
                                                                      .fromRGBO(
                                                                    34,
                                                                    184,
                                                                    233,
                                                                    1.0,
                                                                  )),
                                                              radius: 14,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.5,
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.7,
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: <Widget>[
                                                            Text(
                                                                movie.moviename,
                                                                style: theme
                                                                    .moviehead),
                                                            SizedBox(
                                                                height: 2.0),
                                                            Row(children: [
                                                              Text(movie.year,
                                                                  style: theme
                                                                      .yrlang),
                                                              SizedBox(
                                                                  width: 10.0),
                                                              Text("|",
                                                                  style: theme
                                                                      .yrlang),
                                                              SizedBox(
                                                                  width: 10.0),
                                                              Text(
                                                                  movie
                                                                      .language,
                                                                  style: theme
                                                                      .yrlang)
                                                            ]),
                                                            SizedBox(
                                                                height: 10.0),
                                                            Container(
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.15,
                                                              decoration:
                                                                  new BoxDecoration(
                                                                color:
                                                                    Colors.red,
                                                                image:
                                                                    new DecorationImage(
                                                                  image: new NetworkImage(
                                                                      movie
                                                                          .moviebannerurl),
                                                                  fit: BoxFit
                                                                      .fill,
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                                height: 10.0),
                                                            Expanded(
                                                                child:
                                                                    SingleChildScrollView(
                                                                        child: Column(
                                                                            children: [
                                                                  Text(
                                                                    movie
                                                                        .description,
                                                                    style: theme
                                                                        .moviedesc,
                                                                  ),
                                                                  SizedBox(
                                                                      height:
                                                                          10.0),
                                                                  Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        SizedBox(
                                                                          width:
                                                                              100.0,
                                                                          child: Text(
                                                                              "Director",
                                                                              style: theme.moviedescyel),
                                                                        ),
                                                                        Expanded(
                                                                            child:
                                                                                Text(movie.director.join(","), style: theme.moviedesc)),
                                                                      ]),
                                                                  SizedBox(
                                                                      height:
                                                                          10.0),
                                                                  Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        SizedBox(
                                                                          width:
                                                                              100.0,
                                                                          child: Text(
                                                                              "Producer",
                                                                              style: theme.moviedescyel),
                                                                        ),
                                                                        Expanded(
                                                                            child:
                                                                                Text(movie.producer.join(","), style: theme.moviedesc)),
                                                                      ]),
                                                                  SizedBox(
                                                                      height:
                                                                          5.0),
                                                                  Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        SizedBox(
                                                                          width:
                                                                              100.0,
                                                                          child: Text(
                                                                              "Musician",
                                                                              style: theme.moviedescyel),
                                                                        ),
                                                                        Expanded(
                                                                            child:
                                                                                Text(movie.musicdirector.join(""), style: theme.moviedesc)),
                                                                      ]),
                                                                  SizedBox(
                                                                      height:
                                                                          10.0),
                                                                  Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        SizedBox(
                                                                          width:
                                                                              100.0,
                                                                          child: Text(
                                                                              "Cast",
                                                                              style: theme.moviedescyel),
                                                                        ),
                                                                        Expanded(
                                                                            child:
                                                                                Text(movie.cast.join(","), style: theme.moviedesc)),
                                                                      ]),
                                                                ]))),
                                                            SizedBox(
                                                                height: 20.0),
                                                            Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Expanded(
                                                                    child: InkWell(
                                                                        child: Container(
                                                                            decoration: BoxDecoration(
                                                                              color: Color.fromRGBO(225, 185, 36, 1.0),
                                                                              borderRadius: BorderRadius.circular(5.0),
                                                                            ),
                                                                            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                                                                              Icon(
                                                                                Icons.arrow_right_rounded,
                                                                                size: 30.0,
                                                                                color: Colors.black,
                                                                              ),
                                                                              Text(
                                                                                "Trailer",
                                                                                textAlign: TextAlign.center,
                                                                                style: theme.buttontext,
                                                                              ),
                                                                            ])),
                                                                        onTap: () => videoPlayerDialog(context, _controller, movie)),
                                                                  ),
                                                                  SizedBox(
                                                                      width:
                                                                          10.0),
                                                                  Expanded(
                                                                    child:Transform.scale(
                                                                      scale:layoutDecide ? 0.3 : 1.0,
                                                                    child: InkWell(
                                                                        child: Container(
                                                                          padding: EdgeInsets.only(
                                                                              top: 6.0,
                                                                              bottom: 6.0),
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color: Color.fromRGBO(
                                                                                13,
                                                                                13,
                                                                                13,
                                                                                1.0),
                                                                            border:
                                                                                Border.all(width: 1.0, color: Color.fromRGBO(225, 185, 36, 1.0)),
                                                                            borderRadius:
                                                                                BorderRadius.circular(5.0),
                                                                          ),
                                                                          child:
                                                                              Text(
                                                                            rentedMovies.any((e) => int.tryParse(e) == movie.movieId)
                                                                                ? "Play"
                                                                                : "Rent",
// "Rent",
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style:
                                                                                theme.buttontextwhite,
                                                                          ),
                                                                        ),
                                                                        onTap: () => videoPlayerDialog(context, _controller, movie)),),
                                                                  ),
                                                                ]),
                                                            SizedBox(
                                                                height: 20.0),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              const Padding(padding: EdgeInsets.all(4)),
                            ],
                          ),
                        ))
                  ]));
        });
  }
}

// Reated Movies

class RelatedMovie extends StatefulWidget {
  final Stream<dynamic> data;
  final Stream<dynamic> movies;
  final DashboardBloc parentBloc;
  const RelatedMovie({Key key, this.data, this.movies, this.parentBloc});

  @override
  _RelatedMovieApp createState() => _RelatedMovieApp();
}

class _RelatedMovieApp extends State<RelatedMovie> {
  final _formKey = GlobalKey<FormState>();
  VideoPlayerController _controller;

  var activeCard;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {}

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var device = getDeviceType(mediaQuery);
    customTheme.Theme theme = customTheme.Theme.getTheme(device);
     bool layoutDecide = MediaQuery.of(context).size.width < 1024;
    Size size = MediaQuery.of(context).size;
    return StreamBuilder<dynamic>(
        stream: widget.movies,
        initialData: "",
        builder: (context, snapshot) {
          List relatedMovieList = [];
          if (snapshot.data != null && snapshot.data != '') {
            relatedMovieList = snapshot.data.relatedMovies;
          }
          return relatedMovieList != null && relatedMovieList.isNotEmpty
              ? Container(
                  padding: EdgeInsets.only(left: 30.0, right: 30.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('RELATED ',
                                style: theme.latesthead,
                                textAlign: TextAlign.left),
                            SizedBox(width: 10.0),
                            Text('MOVIES',
                                style: theme.latestheadyellow,
                                textAlign: TextAlign.left),
                          ],
                        ),
                        SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Container(
                              padding: EdgeInsets.only(
                                  top: 20.0,
                                  bottom: 20.0,
                                  right: 20.0,
                                  left: 20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  for (var movie in relatedMovieList)


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
                                                            EdgeInsets.all(4)),
                                                    InkWell(
                                                      child: Image.network(
                                                        movie.moviebannerurl,
                                                        fit: BoxFit.cover,
                                                        width: 350.0,
                                                        height: 200.0,
                                                      ),
                                                      onTap: () {
                                                        Route route =
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        MovieDetailsPage(
                                                                          details:
                                                                              movie,
                                                                        ));
                                                        Navigator.push(
                                                            context, route);
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              )  : 
                                    OnHover(builder: (isHovered) {
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
                                                              color: Color
                                                                  .fromRGBO(
                                                                      225,
                                                                      185,
                                                                      36,
                                                                      0.5),
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
                                                child: Row(
                                                  children: <Widget>[
                                                    const Padding(
                                                        padding:
                                                            EdgeInsets.all(4)),
                                                    InkWell(
                                                      child: Image.network(
                                                        movie.moviebannerurl,
                                                        fit: BoxFit.cover,
                                                        width: 350.0,
                                                        height: 200.0,
                                                      ),
                                                      onTap: () {
                                                        Route route =
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        MovieDetailsPage(
                                                                          details:
                                                                              movie,
                                                                        ));
                                                        Navigator.push(
                                                            context, route);
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              )));
                                    }),
                                  const Padding(padding: EdgeInsets.all(4)),
                                ],
                              ),
                            ))
                      ]))
              : Container();
        });
  }
}

class HistR extends StatefulWidget {
  final Stream<dynamic> data;
  final DashboardBloc parentBloc;
  final Stream<dynamic> rentedMovies;
  final int refresh;
  const HistR(
      {Key key, this.data, this.parentBloc, this.rentedMovies, this.refresh});

  @override
  _HistR createState() => _HistR();
}

class _HistR extends State<HistR> with TickerProviderStateMixin {
  PaymentBloc bloc;
  var activeCard;
  int cardSelected = 0;
  int refresh = 0;
//BehaviorSubject<int> rentalBoxStream = BehaviorSubject<int>();
  VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
//rentalBoxStream.close();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    bloc = Provider.of<PaymentBloc>(context);
    // bloc.getCardList(context);
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var device = getDeviceType(mediaQuery);
    customTheme.Theme theme = customTheme.Theme.getTheme(device);
    return Column(children: [
      Container(
          padding: EdgeInsets.only(left: 30.0, right: 30.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("MORE ",
                        style: theme.latesthead, textAlign: TextAlign.left),
                    SizedBox(width: 10.0),
                    Text('HISTORICAL-ROMANCE',
                        style: theme.latestheadyellow,
                        textAlign: TextAlign.left),
                  ],
                ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(bottom: 50.0, top: 40.0),
                    height: 250.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 20.0, right: 20.0),
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                    left: 20.0,
                                    right: 20.0,
                                  ),
                                  decoration: BoxDecoration(boxShadow: [
                                    new BoxShadow(
                                      color: Color.fromRGBO(225, 185, 36, 0.5),
                                      blurRadius: 16.5,
                                      spreadRadius: 0.2,
                                    ),
                                  ]),
                                  child: Row(
                                    children: <Widget>[
                                      const Padding(padding: EdgeInsets.all(4)),
                                      InkWell(
                                        child: Image.asset(
                                          'assets/images/actor2.jpg',
                                          fit: BoxFit.cover,
                                          width: theme.topmoviewidth,
                                          height: theme.topmovieheight,
                                        ),
                                        onTap: () {},
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )

/* Text */
                    ),
              ]))
    ]);
  }
}
