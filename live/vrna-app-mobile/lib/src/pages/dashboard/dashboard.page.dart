import 'package:flutter/material.dart';
import 'package:vrna_app_mobile/src/blocs/dashboard.bloc.dart';
import 'package:vrna_app_mobile/src/blocs/search.bloc.dart';
import 'package:vrna_app_mobile/src/helpers/utils/commonutils.dart';
import 'package:vrna_app_mobile/src/pages/actordetails/actor.details.page.dart';
import 'package:vrna_app_mobile/src/pages/filter/filter.widget.dart';
import 'package:vrna_app_mobile/src/pages/filter/filterresult.page.dart';
import 'package:vrna_app_mobile/src/pages/login/login.page.dart';
import 'package:vrna_app_mobile/src/pages/privacypolicy/privacypolicy.page.dart';
import 'package:vrna_app_mobile/src/pages/search/search.page.dart';
import 'package:vrna_app_mobile/src/pages/termsconditions/termscondition.page.dart';
import 'package:vrna_app_mobile/src/values/devicescreen.dart';
import 'package:vrna_app_mobile/src/widgets/loading.dart';
import 'package:vrna_app_mobile/src/pages/dashboard/dashboard.widget.dart';
import 'package:vrna_app_mobile/src/widgets/background.dart';
import 'package:vrna_app_mobile/src/values/colors.dart' as colors;
import 'package:vrna_app_mobile/src/pages/profile/profile.page.dart';
import 'package:vrna_app_mobile/src/pages/contactus/contactus.page.dart';
import 'package:provider/provider.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../../widgets/theme.dart' as customTheme;

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> with DashboardWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  DashboardBloc bloc;
  SearchBloc searchBloc;

  @override
  void initState() {
    super.initState();
    bloc = DashboardBloc();
    searchBloc = SearchBloc();
    // bloc = Provider.of<DashboardBloc>(context);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // searchBloc = Provider.of<SearchBloc>(context);
    bloc.dashboardAllData(context);
    bloc.featuredActors(context);
  }

  @override
  void dispose() {
    super.dispose();
    bloc?.dispose();
    searchBloc?.dispose();
  }

  bool _folded = true;
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var device = getDeviceType(mediaQuery);
    double widthSize = MediaQuery.of(context).size.width * 1.0;
    bool layoutDecide = MediaQuery.of(context).size.width < 1024;
    customTheme.Theme theme = customTheme.Theme.getTheme(device);
    if (device == DeviceScreenType.Tv) {
      widthSize = mediaQuery.size.width * 0.4;
    } else if (device == DeviceScreenType.Desktop) {
      widthSize = mediaQuery.size.width * 0.3;
    } else if (device == DeviceScreenType.Tablet) {
      widthSize = mediaQuery.size.width * 0.6;
    } else if (device == DeviceScreenType.Mobile) {
      widthSize = mediaQuery.size.width * 0.9;
    }
    return Background(
        child: Loading(
            message: "Loading ...",
            status: bloc.loading,
            child: Scaffold(
              key: _scaffoldKey,
              appBar: new AppBar(
                toolbarHeight: 100.0,
                automaticallyImplyLeading: false,
                leading: InkWell(
                  child: Image(
                    image: AssetImage('assets/burger_menu.png'),
                    fit: BoxFit.fitWidth,
                    width: 30.0,
                    height: 30.0,
                  ),
                  onTap: () => {_scaffoldKey.currentState.openDrawer()},
                ),
                title: new Row(children: <Widget>[
                  InkWell(
                      child: Container(
                        width: 150.0,
                        height: 75.0,
                        decoration: BoxDecoration(
                          image: new DecorationImage(
                            image: new ExactAssetImage('assets/logo.png'),
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      onTap: () {
                       
                      }),
                  SizedBox(width: 30.0),
                  Expanded(child: Text('')),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 20.0,
                      right: 20.0,
                      bottom: 20.0,
                    ),
                    child: Container(
                      padding: EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
                          color: Colors.transparent,
                          border: Border.all(
                            width: 2.0,
                            color: Colors.white,
                          )),
                      child: Row(children: [
                        SizedBox(width: 10.0),
                        Icon(
                          Icons.search_outlined,
                          color: Colors.white,
                          size: 30.0,
                        ),
                        SizedBox(width: 5.0),
                        Container(
                            width: layoutDecide ? 50.0 : 400,
                            child: 1 == 0
                                ? TextField(
                                    style: TextStyle(
                                        color:
                                            Color.fromRGBO(233, 233, 233, 1.0)),
                                    decoration: InputDecoration(
                                        hintText: 'Search',
                                        hintStyle:
                                            TextStyle(color: Colors.white),
                                        border: InputBorder.none))
                                : TypeAheadField(
                                    hideOnLoading: true,
                                    textFieldConfiguration:
                                        TextFieldConfiguration(
                                      autofocus: false,
                                      decoration: InputDecoration(
                                          focusedBorder: InputBorder.none,
                                          hintText: 'Search',
                                          hintStyle:
                                              TextStyle(color: Colors.white)),
                                      style: TextStyle(
                                          color: Color.fromRGBO(
                                              233, 233, 233, 1.0)),
                                    ),
                                    suggestionsCallback: (pattern) async {
                                      return searchBloc.getSuggestions(pattern);
                                    },
                                    hideOnEmpty: true,
                                    hideOnError: true,
                                    noItemsFoundBuilder: (context) {
                                      return Container(child: Text(''));
                                    },
                                    itemBuilder: (context, suggestion) {
                                      // print(suggestion);
                                      return ListTile(
                                        tileColor: colors.accentColor,
                                        title: Text(suggestion,
                                            style:
                                                TextStyle(color: Colors.white)),
                                      );
                                    },
                                    onSuggestionSelected: (query) {
                                      Route route = MaterialPageRoute(
                                          builder: (context) =>
                                              SearchPage(query: query));
                                      Navigator.push(context, route);
                                    },
                                  )),
                        SizedBox(width: 10.0)
                      ]),
                    ),
                  ),
                ]),
                backgroundColor: Colors.transparent,
                elevation: 0.0,
              ),
              drawer: SearchMovie(),
              body: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment
                        .bottomCenter, // 10% of the width, so there are ten blinds.
                    colors: <Color>[
                      Color.fromRGBO(7, 11, 13, 1),
                      Color.fromRGBO(25, 39, 47, 1),
                      Color.fromRGBO(7, 10, 13, 1),
                    ], // red to yellow
                    tileMode: TileMode
                        .repeated, // repeats the gradient over the canvas
                  ),
                ),
                child: dashboard(context, bloc),
              ),
            )));
  }
}

enum SingingCharacter { topmovie, lm, fav, trend, rec }

class SearchMovie extends StatefulWidget {
  @override
  _SearchMovieState createState() => _SearchMovieState();
}

class _SearchMovieState extends State<SearchMovie> {
  SingingCharacter _character = SingingCharacter.topmovie;
  bool checkvalue1 = false;
  bool checkvalue2 = false;
  bool checkvalue3 = false;
  bool checkvalue4 = false;
  bool checkvalue5 = false;
  bool checkvalue6 = false;
  bool checkvalue7 = false;

  void loadFilteredMovies(filter) {
    Route route = MaterialPageRoute(
        builder: (context) => FilterResultPage(
              filter: filter,
            ));
    Navigator.push(context, route);
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var device = getDeviceType(mediaQuery);
    double widthSize = MediaQuery.of(context).size.width * 1.0;
    bool layoutDecide = MediaQuery.of(context).size.width < 1024;
    customTheme.Theme theme = customTheme.Theme.getTheme(device);

    return Drawer(
        child: Container(
      width: widthSize,
      decoration: BoxDecoration(
        color: Color.fromRGBO(11, 23, 28, 1.0),
      ),
      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: ListView(
        padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(left: 10.0, right: 10.0),
            child: InkWell(
              child: Icon(
                Icons.close,
                size: 20.0,
                color: Colors.white,
              ),
              onTap: () => {Navigator.of(context).pop()},
            ),
          ),
          Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(
                left: 20.0,
                right: 20.0,
                top: 15.0,
                bottom: 15.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                      child: Container(
                        width: 150.0,
                        height: 75.0,
                        decoration: BoxDecoration(
                          image: new DecorationImage(
                            image: new ExactAssetImage('assets/logo.png'),
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      onTap: () {
                        Route route = MaterialPageRoute(
                            builder: (context) => DashboardPage());
                        Navigator.pushReplacement(context, route);
                      }),
                  SizedBox(height: 15.0),

                  Text(
                    "Main Menu",
                    style: theme.mainmenu,
                  ),
                  SizedBox(height: 15.0),
                  Divider(
                    color: Color.fromRGBO(24, 28, 39, 1.0),
                    height: 2.0,
                  ),
                  SizedBox(height: 15.0),
                  InkWell(
                      child: Text('Home',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: colors.appYellow,
                            height: 1.2,
                          )),
                      onTap: () {
                        Route route = MaterialPageRoute(
                            builder: (context) => DashboardPage());
                        Navigator.pushReplacement(context, route);
                      }),
                  SizedBox(height: 15.0),
                  InkWell(
                      child: Text('Profile',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Color.fromRGBO(146, 179, 195, 1.0),
                            height: 1.2,
                          )),
                      onTap: () {
                        Route route = MaterialPageRoute(
                            builder: (context) => ProfilePage());
                        Navigator.pushReplacement(context, route);
                      }),
                  SizedBox(height: 30.0),
                  Text(
                    "Favourites",
                    style: theme.mainmenu,
                  ),
                  SizedBox(height: 15.0),
                  Divider(
                    color: Color.fromRGBO(24, 28, 39, 1.0),
                    height: 2.0,
                  ),
                  SizedBox(height: 15.0),
                  InkWell(
                      child: Text('Latest',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Color.fromRGBO(146, 179, 195, 1.0),
                            height: 1.2,
                          )),
                      onTap: () => {loadFilteredMovies('latest')}),
                  SizedBox(height: 20.0),
                  InkWell(
                      child: Text('Trending',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Color.fromRGBO(146, 179, 195, 1.0),
                            height: 1.2,
                          )),
                      onTap: () => {loadFilteredMovies('trending')}),
                  SizedBox(height: 20.0),
                  InkWell(
                      child: Text('Featured',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Color.fromRGBO(146, 179, 195, 1.0),
                            height: 1.2,
                          )),
                      onTap: () => {loadFilteredMovies('featured')}),
                  SizedBox(height: 20.0),
                  InkWell(
                      child: Text('Rented',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Color.fromRGBO(146, 179, 195, 1.0),
                            height: 1.2,
                          )),
                      onTap: () => {loadFilteredMovies('rented')}),
                  SizedBox(height: 20.0),
                  InkWell(
                      child: Text('Watchlist',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Color.fromRGBO(146, 179, 195, 1.0),
                            height: 1.2,
                          )),
                      onTap: () => {loadFilteredMovies('watchlist')}),
                  SizedBox(height: 20.0),
                  InkWell(
                      child: Text('Top Movies',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Color.fromRGBO(146, 179, 195, 1.0),
                            height: 1.2,
                          )),
                      onTap: () => {loadFilteredMovies('top')}),
                  SizedBox(height: 20.0),
                  InkWell(
                      child: Text('Recommended',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Color.fromRGBO(146, 179, 195, 1.0),
                            height: 1.2,
                          )),
                      onTap: () => {loadFilteredMovies('recommended')}),
                  SizedBox(height: 20.0),
                  // InkWell(
                  //   child: Text('Contact Us',
                  //       style: TextStyle(
                  //         fontSize: 18.0,
                  //         color: Color.fromRGBO(146, 179, 195, 1.0),
                  //         height: 1.2,
                  //       )),
                  //   onTap: () {
                  //     Navigator.pop(context);
                  //     Route route = MaterialPageRoute(
                  //         builder: (context) => ContactUsPage());
                  //     Navigator.pushReplacement(context, route);
                  //   },
                  // ),
                  // SizedBox(height: 20.0),

                  // SizedBox(height: 30.0),
                  Text(
                    "Support",
                    style: theme.mainmenu,
                  ),
                  SizedBox(height: 15.0),
                  Divider(
                    color: Color.fromRGBO(24, 28, 39, 1.0),
                    height: 2.0,
                  ),
                  SizedBox(height: 15.0),
                  InkWell(
                    child: Text(
                      "Reach Us",
                      style: theme.submenu,
                    ),
                    onTap: () {
                      Route route = MaterialPageRoute(
                          builder: (context) => ContactUsPage());
                      Navigator.pushReplacement(context, route);
                    },
                  ),
                  SizedBox(height: 15.0),
                  InkWell(
                      onTap: () {
                        Route route = MaterialPageRoute(
                            builder: (context) => TermsConditionPage());
                        Navigator.push(context, route);
                      },
                      child: Text(
                        "Terms of Services",
                        style: theme.submenu,
                      )),
                  SizedBox(height: 15.0),
                  InkWell(
                      onTap: () {
                        Route route = MaterialPageRoute(
                            builder: (context) => PrivacyPolicyPage());
                        Navigator.push(context, route);
                      },
                      child: Text(
                        "Privacy Policy",
                        style: theme.submenu,
                      )),
                  SizedBox(height: 32.0),
                  SizedBox(
                    height: 25,
                  ),
                  Center(
                    child: InkWell(
                      child: Container(
                        alignment: Alignment.center,
                        width: 200.0,
                        child: Text("Logout",
                            textDirection: TextDirection.ltr,
                            textAlign: TextAlign.center,
                            style: theme.applyfilter),
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(226, 186, 31, 1.0)),
                      ),
                      onTap: () => {CommonUtils.logout(context)},
                    ),
                  ),
                ],
              )),
        ],
      ),
    ));
  }
}

class SearchMenu extends StatefulWidget {
  @override
  _searchmenuState createState() => _searchmenuState();
}

class _searchmenuState extends State<SearchMenu> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var device = getDeviceType(mediaQuery);
    double widthSize = MediaQuery.of(context).size.width * 1.0;
    bool layoutDecide = MediaQuery.of(context).size.width < 1024;
    customTheme.Theme theme = customTheme.Theme.getTheme(device);
    return Drawer(
        child: Container(
      width: widthSize,
      decoration: BoxDecoration(
        color: Color.fromRGBO(11, 23, 28, 1.0),
      ),
      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: ListView(
        padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(left: 10.0, right: 10.0),
            child: InkWell(
              child: Icon(
                Icons.close,
                size: 20.0,
                color: Colors.white,
              ),
              onTap: () => {Navigator.of(context).pop()},
            ),
          ),
          SizedBox(height: 30.0),
          AnimatedContainer(
              duration: Duration(milliseconds: 400),
              height: 50.0,
              color: Color.fromRGBO(18, 32, 39, 1.0),
              child: Row(children: [
                Expanded(
                  child: Container(
                      padding: EdgeInsets.only(left: 16.0),
                      child: TextField(
                        style: TextStyle(
                            color: Color.fromRGBO(233, 233, 233, 1.0)),
                        decoration: InputDecoration(
                            hintText: 'Search',
                            hintStyle: TextStyle(
                                color: Color.fromRGBO(233, 233, 233, 1.0)),
                            border: InputBorder.none),
                      )),
                ),
                AnimatedContainer(
                  child: InkWell(
                    child: Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: Icon(Icons.search,
                          size: 22.0,
                          color: Color.fromRGBO(233, 233, 233, 1.0)),
                    ),
                    onTap: () {},
                  ),
                  duration: Duration(milliseconds: 400),
                ),
              ])),
          Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(
                left: 20.0,
                right: 20.0,
                top: 15.0,
                bottom: 15.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Main Menu",
                    style: theme.mainmenu,
                  ),
                  SizedBox(height: 15.0),
                  Divider(
                    color: Color.fromRGBO(24, 28, 39, 1.0),
                    height: 2.0,
                  ),
                  SizedBox(height: 15.0),
                  Text(
                    "Home",
                    style: theme.submenu,
                  ),
                  SizedBox(height: 15.0),
                  Text(
                    "Movies",
                    style: theme.submenu,
                  ),
                  SizedBox(height: 15.0),
                  Text(
                    "TV Show",
                    style: theme.submenu,
                  ),
                  SizedBox(height: 15.0),
                  Text(
                    "Theatores",
                    style: theme.submenu,
                  ),
                  SizedBox(height: 15.0),
                  Text(
                    "Actors",
                    style: theme.submenu,
                  ),
                  SizedBox(height: 32.0),

                  Text(
                    "Trending",
                    style: theme.mainmenu,
                  ),
                  SizedBox(height: 10.0),
                  Divider(
                    color: Color.fromRGBO(24, 28, 39, 1.0),
                    height: 2.0,
                  ),

                  SizedBox(height: 15.0),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          "Top Movies",
                          style: theme.submenu,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10.0),
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(
                          top: 5.0,
                          right: 7.0,
                          bottom: 5.0,
                          left: 7.0,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Text(
                          "2142",
                          style: theme.submenuwhite,
                        ),
                      )
                    ],
                  ),

                  SizedBox(height: 15.0),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          "Latest Movies",
                          style: theme.submenu,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10.0),
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(
                          top: 5.0,
                          right: 7.0,
                          bottom: 5.0,
                          left: 7.0,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Text(
                          "91",
                          style: theme.submenuwhite,
                        ),
                      )
                    ],
                  ),

                  SizedBox(height: 15.0),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          "Featured Movies",
                          style: theme.submenu,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10.0),
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(
                          top: 5.0,
                          right: 7.0,
                          bottom: 5.0,
                          left: 7.0,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Text(
                          "128",
                          style: theme.submenuwhite,
                        ),
                      )
                    ],
                  ),

                  SizedBox(height: 15.0),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          "Top TV Shows",
                          style: theme.submenu,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10.0),
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(
                          top: 5.0,
                          right: 7.0,
                          bottom: 5.0,
                          left: 7.0,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Text(
                          "46",
                          style: theme.submenuwhite,
                        ),
                      )
                    ],
                  ),

                  SizedBox(height: 15.0),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          "Top Theatre Shows",
                          style: theme.submenu,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10.0),
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(
                          top: 5.0,
                          right: 7.0,
                          bottom: 5.0,
                          left: 7.0,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Text(
                          "10",
                          style: theme.submenuwhite,
                        ),
                      )
                    ],
                  ),

                  SizedBox(height: 32.0),

                  Text(
                    "My Interest",
                    style: theme.mainmenu,
                  ),
                  SizedBox(height: 10.0),
                  Divider(
                    color: Color.fromRGBO(24, 28, 39, 1.0),
                    height: 2.0,
                  ),
                  SizedBox(height: 15.0),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          "Favorites",
                          style: theme.submenu,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10.0),
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(
                          top: 5.0,
                          right: 7.0,
                          bottom: 5.0,
                          left: 7.0,
                        ),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(226, 186, 31, 1.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Text(
                          "1",
                          style: theme.submenublack,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 32.0),

                  Text(
                    "Support",
                    style: theme.mainmenu,
                  ),
                  SizedBox(height: 15.0),
                  Divider(
                    color: Color.fromRGBO(24, 28, 39, 1.0),
                    height: 2.0,
                  ),
                  SizedBox(height: 15.0),
                  Text(
                    "Reach Us",
                    style: theme.submenu,
                  ),
                  SizedBox(height: 15.0),
                  Text(
                    "Terms of Services",
                    style: theme.submenu,
                  ),
                  SizedBox(height: 15.0),
                  Text(
                    "Privacy Policy",
                    style: theme.submenu,
                  ),
                  SizedBox(height: 32.0),

                  SizedBox(height: 32.0),
                  Text(
                    "Settings",
                    style: theme.mainmenu,
                  ),
                  SizedBox(height: 15.0),
                  Divider(
                    color: Color.fromRGBO(24, 28, 39, 1.0),
                    height: 2.0,
                  ),
                  SizedBox(height: 15.0),
                  Text(
                    "Language",
                    style: theme.submenu,
                  ),
                  SizedBox(height: 15.0),
                  Text(
                    "Preferences",
                    style: theme.submenu,
                  ),
                  SizedBox(height: 15.0),

                  ListTile(
                    title: Text(
                      'Contact Us',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Route route = MaterialPageRoute(
                          builder: (context) => ContactUsPage());
                      Navigator.push(context, route);
                    },
                  ),
                  ListTile(
                    title: Text(
                      'Profile',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Route route = MaterialPageRoute(
                          builder: (context) => ProfilePage());
                      Navigator.push(context, route);
                    },
                  ),
                  ListTile(
                    title: Text(
                      'Actor Details',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    onTap: () {
                      // Navigator.pop(context);
                      // Route route = MaterialPageRoute(
                      //     builder: (context) => ActorDetailsPage());
                      // Navigator.push(context, route);
                    },
                  ),
                  // ListTile(
                  //   title: Text(
                  //     'Search',
                  //     style: TextStyle(
                  //       color: Colors.grey,
                  //     ),
                  //   ),
                  //   onTap: () {
                  //     Navigator.pop(context);
                  //     Route route =
                  //         MaterialPageRoute(builder: (context) => SearchPage());
                  //     Navigator.push(context, route);
                  //   },
                  // ),
                  // ListTile(
                  //   title: Text('Item 2'),
                  //   onTap: () {
                  //     Navigator.pop(context);
                  //   },
                  // ),

                  Center(
                    child: InkWell(
                      child: Container(
                        alignment: Alignment.center,
                        width: 200.0,
                        child: Text("Logout",
                            textDirection: TextDirection.ltr,
                            textAlign: TextAlign.center,
                            style: theme.logout),
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            border: Border.all(
                          width: 2.0,
                          color: Color.fromRGBO(149, 182, 199, 1.0),
                        )),
                      ),
                      onTap: () => {
                        CommonUtils.logout(context)
                        /*
                          Route route = MaterialPageRoute(
                              builder: (context) => LoginPage());
                          Navigator.pushReplacement(context, route);                       
*/
                      },
                    ),
                  )
                ],
              )),

/*
                      RaisedButton(
                        child: const Text('Logout'),
                        color: colors.appYellow,
                        onPressed: () {
                          Route route = MaterialPageRoute(
                              builder: (context) => LoginPage());
                          Navigator.pushReplacement(context, route);
                        },
                      )*/
        ],
      ),
    ));
  }
}
