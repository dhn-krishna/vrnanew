import 'package:flutter/material.dart';
import 'package:vrna_app_mobile/src/blocs/search.bloc.dart';
import 'package:vrna_app_mobile/src/helpers/storage/storage.helper.dart';
import 'package:vrna_app_mobile/src/helpers/utils/commonutils.dart';
import 'package:vrna_app_mobile/src/pages/contactus/contactus.page.dart';
import 'package:vrna_app_mobile/src/pages/dashboard/dashboard.page.dart';
import 'package:vrna_app_mobile/src/pages/profile/profile.page.dart';
import 'package:vrna_app_mobile/src/values/devicescreen.dart';
import 'package:vrna_app_mobile/src/widgets/loading.dart';
import 'package:vrna_app_mobile/src/pages/search/search.widget.dart';
import 'package:vrna_app_mobile/src/widgets/background.dart';
import 'package:provider/provider.dart';

import '../../widgets/theme.dart' as customTheme;

enum SingingCharacter { topmovie, lm, fav, trend, rec }

class SearchPage extends StatefulWidget {
  final query;
  const SearchPage({Key key, this.query}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> with SearchPageWidget {
  SearchBloc bloc;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  var query;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // bloc = Provider.of<SearchBloc>(context);
    bloc = SearchBloc();
    if (query != null && bloc != null) {
      bloc.search(query);
    }
  }

  @override
  void initState() {
    super.initState();
    query = widget.query;
  }

  @override
  void dispose() {
    super.dispose();
    bloc?.dispose();
  }

  bool _folded = true;
  SingingCharacter _character = SingingCharacter.topmovie;
  String timeRange = "";
  String genre = "";
  String category = "";
  String rating = "";

  bool timeRangeAll = false;
  bool newMovies = false;
  bool oneToFourYears = false;
  bool elevenToTwentyYears = false;
  bool fiveToTenYears = false;

  bool tvShows = false;
  bool movies = false;
  bool theatres = false;
  bool music = false;
  bool categoryAll = false;

  bool genreAll = false;
  bool comedy = false;
  bool drama = false;
  bool action = false;
  bool romance = false;
  bool adventure = false;
  bool family = false;
  bool horror = false;

  bool rating1 = false;
  bool rating2 = false;
  bool rating3 = false;
  bool rating4 = false;
  bool rating5 = false;
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var device = getDeviceType(mediaQuery);
    double widthSize = MediaQuery.of(context).size.width * 1.0;
    bool layoutDecide = MediaQuery.of(context).size.width < 1024;
    customTheme.Theme theme = customTheme.Theme.getTheme(device);
    Size size = MediaQuery.of(context).size;

    return Background(
        child: Loading(
            message: "Loading ...",
            // status: bloc.loading,
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
                          Route route = MaterialPageRoute(
                              builder: (context) => DashboardPage());
                          Navigator.pushReplacement(context, route);
                        }),
                    SizedBox(width: 30.0),
                    Expanded(child: Text('')),
                  ]),
                  backgroundColor: Colors.transparent,
                  elevation: 0.0,
                ),
                drawer: Drawer(
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
                      Center(
                        child: Text(
                          "Filters",
                          style: theme.mainmenu,
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
                              SizedBox(height: 30.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.import_export,
                                    size: 20.0,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    "Filter",
                                    style: theme.mainmenu,
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text(
                                  "Genre",
                                  style: theme.submenuhideshow,
                                ),
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.only(
                                        left: 15.0, right: 10.0),
                                    child: Theme(
                                      data: Theme.of(context).copyWith(
                                          unselectedWidgetColor: Color.fromRGBO(
                                              149, 182, 199, 1.0),
                                          disabledColor: Colors.blue),
                                      child: Column(children: <Widget>[
                                        Row(
                                          children: [
                                            Checkbox(
                                              checkColor: Colors.black,
                                              activeColor: Colors.white,
                                              value: this.genreAll,
                                              onChanged: (bool value) {
                                                setState(() {
                                                  this.genreAll = value;
                                                  this.comedy = value;
                                                  this.action = value;
                                                  this.adventure = value;
                                                  this.family = value;
                                                  this.horror = value;
                                                  this.drama = value;
                                                  if (value) {
                                                    this.genre =
                                                        'comedy,Action,adventure,family,drama,horror';
                                                  } else {
                                                    this.genre = '';
                                                  }
                                                });
                                              },
                                            ),
                                            Text('All',
                                                style: TextStyle(
                                                  fontSize: 18.0,
                                                  color: Color.fromRGBO(
                                                      146, 179, 195, 1.0),
                                                  height: 1.2,
                                                )),
                                          ],
                                        ),
                                        SizedBox(height: 10.0),
                                        Row(
                                          children: [
                                            Checkbox(
                                              checkColor: Colors.black,
                                              activeColor: Colors.white,
                                              value: this.comedy,
                                              onChanged: (bool value) {
                                                setState(() {
                                                  if (value) {
                                                    this.genre +=
                                                        this.genre.isEmpty
                                                            ? 'comedy'
                                                            : ',comedy';
                                                  } else {
                                                    this.genre = this
                                                            .genre
                                                            .contains(',comedy')
                                                        ? this.genre.replaceAll(
                                                            ',comedy', '')
                                                        : this.genre.replaceAll(
                                                            'comedy', '');
                                                  }
                                                  this.genreAll = false;
                                                  this.comedy = value;
                                                });
                                              },
                                            ),
                                            Text('Comedy',
                                                style: TextStyle(
                                                  fontSize: 18.0,
                                                  color: Color.fromRGBO(
                                                      146, 179, 195, 1.0),
                                                  height: 1.2,
                                                )),
                                          ],
                                        ),
                                        SizedBox(height: 10.0),
                                        Row(
                                          children: [
                                            Checkbox(
                                              checkColor: Colors.black,
                                              activeColor: Colors.white,
                                              value: this.action,
                                              onChanged: (bool value) {
                                                setState(() {
                                                  if (value) {
                                                    this.genre +=
                                                        this.genre.isEmpty
                                                            ? 'action'
                                                            : ',action';
                                                  } else {
                                                    this.genre = this
                                                            .genre
                                                            .contains(',action')
                                                        ? this.genre.replaceAll(
                                                            ',action', '')
                                                        : this.genre.replaceAll(
                                                            'action', '');
                                                  }
                                                  this.genreAll = false;
                                                  this.action = value;
                                                });
                                              },
                                            ),
                                            Text('Action',
                                                style: TextStyle(
                                                  fontSize: 18.0,
                                                  color: Color.fromRGBO(
                                                      146, 179, 195, 1.0),
                                                  height: 1.2,
                                                )),
                                          ],
                                        ),
                                        SizedBox(height: 10.0),
                                        Row(
                                          children: [
                                            Checkbox(
                                              checkColor: Colors.black,
                                              activeColor: Colors.white,
                                              value: this.adventure,
                                              onChanged: (bool value) {
                                                setState(() {
                                                  if (value) {
                                                    this.genre +=
                                                        this.genre.isEmpty
                                                            ? 'adventure'
                                                            : ',adventure';
                                                  } else {
                                                    this.genre = this
                                                            .genre
                                                            .contains(
                                                                ',adventure')
                                                        ? this.genre.replaceAll(
                                                            ',adventure', '')
                                                        : this.genre.replaceAll(
                                                            'adventure', '');
                                                  }
                                                  this.genreAll = false;
                                                  this.adventure = value;
                                                });
                                              },
                                            ),
                                            Text('Adventure',
                                                style: TextStyle(
                                                  fontSize: 18.0,
                                                  color: Color.fromRGBO(
                                                      146, 179, 195, 1.0),
                                                  height: 1.2,
                                                )),
                                          ],
                                        ),
                                        SizedBox(height: 10.0),
                                        Row(
                                          children: [
                                            Checkbox(
                                              checkColor: Colors.black,
                                              activeColor: Colors.white,
                                              value: this.family,
                                              onChanged: (bool value) {
                                                setState(() {
                                                  if (value) {
                                                    this.genre +=
                                                        this.genre.isEmpty
                                                            ? 'family'
                                                            : ',family';
                                                  } else {
                                                    this.genre = this
                                                            .genre
                                                            .contains(',family')
                                                        ? this.genre.replaceAll(
                                                            ',family', '')
                                                        : this.genre.replaceAll(
                                                            'family', '');
                                                  }
                                                  this.genreAll = false;
                                                  this.family = value;
                                                });
                                              },
                                            ),
                                            Text('Family',
                                                style: TextStyle(
                                                  fontSize: 18.0,
                                                  color: Color.fromRGBO(
                                                      146, 179, 195, 1.0),
                                                  height: 1.2,
                                                )),
                                          ],
                                        ),
                                        SizedBox(height: 10.0),
                                        Row(
                                          children: [
                                            Checkbox(
                                              checkColor: Colors.black,
                                              activeColor: Colors.white,
                                              value: this.drama,
                                              onChanged: (bool value) {
                                                setState(() {
                                                  if (value) {
                                                    this.genre +=
                                                        this.genre.isEmpty
                                                            ? 'drama'
                                                            : ',drama';
                                                  } else {
                                                    this.genre = this
                                                            .genre
                                                            .contains(',drama')
                                                        ? this.genre.replaceAll(
                                                            ',drama', '')
                                                        : this.genre.replaceAll(
                                                            'drama', '');
                                                  }
                                                  this.genreAll = false;
                                                  this.drama = value;
                                                });
                                              },
                                            ),
                                            Text('Drama',
                                                style: TextStyle(
                                                  fontSize: 18.0,
                                                  color: Color.fromRGBO(
                                                      146, 179, 195, 1.0),
                                                  height: 1.2,
                                                )),
                                          ],
                                        ),
                                        SizedBox(height: 10.0),
                                        Row(
                                          children: [
                                            Checkbox(
                                              checkColor: Colors.black,
                                              activeColor: Colors.white,
                                              value: this.horror,
                                              onChanged: (bool value) {
                                                setState(() {
                                                  if (value) {
                                                    this.genre +=
                                                        this.genre.isEmpty
                                                            ? 'horror'
                                                            : ',horror';
                                                  } else {
                                                    this.genre = this
                                                            .genre
                                                            .contains(',horror')
                                                        ? this.genre.replaceAll(
                                                            ',horror', '')
                                                        : this.genre.replaceAll(
                                                            'horror', '');
                                                  }
                                                  this.genreAll = false;
                                                  this.horror = value;
                                                });
                                              },
                                            ),
                                            Text('Horror',
                                                style: TextStyle(
                                                  fontSize: 18.0,
                                                  color: Color.fromRGBO(
                                                      146, 179, 195, 1.0),
                                                  height: 1.2,
                                                )),
                                          ],
                                        ),
                                      ]),
                                    ),
                                  )
                                ],
                              ),
                              ExpansionTile(
                                title: Text(
                                  "Categories ",
                                  style: theme.submenuhideshow,
                                ),
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.only(
                                        left: 15.0, right: 10.0),
                                    child: Theme(
                                      data: Theme.of(context).copyWith(
                                          unselectedWidgetColor: Color.fromRGBO(
                                              149, 182, 199, 1.0),
                                          disabledColor: Colors.blue),
                                      child: Column(children: <Widget>[
                                        Row(
                                          children: [
                                            Checkbox(
                                              checkColor: Colors.black,
                                              activeColor: Colors.white,
                                              value: this.categoryAll,
                                              onChanged: (bool value) {
                                                setState(() {
                                                  this.categoryAll = value;
                                                  this.tvShows = value;
                                                  this.movies = value;
                                                  this.theatres = value;
                                                  this.music = value;
                                                  if (value) {
                                                    this.category =
                                                        'tvshows,movies,theatres,music';
                                                  } else {
                                                    this.category = '';
                                                  }
                                                  this.categoryAll = value;
                                                });
                                              },
                                            ),
                                            Text('All',
                                                style: TextStyle(
                                                  fontSize: 18.0,
                                                  color: Color.fromRGBO(
                                                      146, 179, 195, 1.0),
                                                  height: 1.2,
                                                )),
                                          ],
                                        ),
                                        SizedBox(height: 10.0),
                                        Row(
                                          children: [
                                            Checkbox(
                                              checkColor: Colors.black,
                                              activeColor: Colors.white,
                                              value: this.tvShows,
                                              onChanged: (bool value) {
                                                setState(() {
                                                  if (value) {
                                                    this.category +=
                                                        this.category.isEmpty
                                                            ? 'tvshows'
                                                            : ',tvshows';
                                                  } else {
                                                    this.category = this
                                                            .category
                                                            .contains(
                                                                ',tvshows')
                                                        ? this
                                                            .category
                                                            .replaceAll(
                                                                ',tvshows', '')
                                                        : this
                                                            .category
                                                            .replaceAll(
                                                                'tvshows', '');
                                                  }
                                                  this.categoryAll = false;
                                                  this.tvShows = value;
                                                });
                                              },
                                            ),
                                            Text('TV Shows',
                                                style: TextStyle(
                                                  fontSize: 18.0,
                                                  color: Color.fromRGBO(
                                                      146, 179, 195, 1.0),
                                                  height: 1.2,
                                                )),
                                          ],
                                        ),
                                        SizedBox(height: 10.0),
                                        Row(
                                          children: [
                                            Checkbox(
                                              checkColor: Colors.black,
                                              activeColor: Colors.white,
                                              value: this.movies,
                                              onChanged: (bool value) {
                                                setState(() {
                                                  if (value) {
                                                    this.category +=
                                                        this.category.isEmpty
                                                            ? 'movies'
                                                            : ',movies';
                                                  } else {
                                                    this.category = this
                                                            .category
                                                            .contains(',movies')
                                                        ? this
                                                            .category
                                                            .replaceAll(
                                                                ',movies', '')
                                                        : this
                                                            .category
                                                            .replaceAll(
                                                                'movies', '');
                                                  }
                                                  this.categoryAll = false;
                                                  this.movies = value;
                                                });
                                              },
                                            ),
                                            Text('Movies',
                                                style: TextStyle(
                                                  fontSize: 18.0,
                                                  color: Color.fromRGBO(
                                                      146, 179, 195, 1.0),
                                                  height: 1.2,
                                                )),
                                          ],
                                        ),
                                        SizedBox(height: 10.0),
                                        Row(
                                          children: [
                                            Checkbox(
                                              checkColor: Colors.black,
                                              activeColor: Colors.white,
                                              value: this.theatres,
                                              onChanged: (bool value) {
                                                setState(() {
                                                  if (value) {
                                                    this.category +=
                                                        this.category.isEmpty
                                                            ? 'theatres'
                                                            : ',theatres';
                                                  } else {
                                                    this.category = this
                                                            .category
                                                            .contains(
                                                                ',theatres')
                                                        ? this
                                                            .category
                                                            .replaceAll(
                                                                ',theatres', '')
                                                        : this
                                                            .category
                                                            .replaceAll(
                                                                'theatres', '');
                                                  }
                                                  this.categoryAll = false;
                                                  this.theatres = value;
                                                });
                                              },
                                            ),
                                            Text('Theatres',
                                                style: TextStyle(
                                                  fontSize: 18.0,
                                                  color: Color.fromRGBO(
                                                      146, 179, 195, 1.0),
                                                  height: 1.2,
                                                )),
                                          ],
                                        ),
                                        SizedBox(height: 10.0),
                                        Row(
                                          children: [
                                            Checkbox(
                                              checkColor: Colors.black,
                                              activeColor: Colors.white,
                                              value: this.music,
                                              onChanged: (bool value) {
                                                setState(() {
                                                  if (value) {
                                                    this.category +=
                                                        this.category.isEmpty
                                                            ? 'music'
                                                            : ',music';
                                                  } else {
                                                    this.category = this
                                                            .category
                                                            .contains(',music')
                                                        ? this
                                                            .category
                                                            .replaceAll(
                                                                ',music', '')
                                                        : this
                                                            .category
                                                            .replaceAll(
                                                                'music', '');
                                                  }
                                                  this.categoryAll = false;
                                                  this.music = value;
                                                });
                                              },
                                            ),
                                            Text('Music',
                                                style: TextStyle(
                                                  fontSize: 18.0,
                                                  color: Color.fromRGBO(
                                                      146, 179, 195, 1.0),
                                                  height: 1.2,
                                                )),
                                          ],
                                        ),
                                        SizedBox(height: 10.0),
                                      ]),
                                    ),
                                  )
                                ],
                              ),
                              ExpansionTile(
                                title: Text(
                                  "Time Period ",
                                  style: theme.submenuhideshow,
                                ),
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.only(
                                        left: 15.0, right: 10.0),
                                    child: Theme(
                                      data: Theme.of(context).copyWith(
                                          unselectedWidgetColor: Color.fromRGBO(
                                              149, 182, 199, 1.0),
                                          disabledColor: Colors.blue),
                                      child: Column(children: <Widget>[
                                        Row(
                                          children: [
                                            Checkbox(
                                              checkColor: Colors.black,
                                              activeColor: Colors.white,
                                              value: this.timeRangeAll,
                                              onChanged: (bool value) {
                                                setState(() {
                                                  this.timeRangeAll = value;
                                                  this.newMovies = value;
                                                  this.oneToFourYears = value;
                                                  this.fiveToTenYears = value;
                                                  this.elevenToTwentyYears =
                                                      value;
                                                  if (value) {
                                                    this.timeRange = '0,1,5,11';
                                                  } else {
                                                    this.timeRange = '';
                                                  }
                                                });
                                              },
                                            ),
                                            Text('All',
                                                style: TextStyle(
                                                  fontSize: 18.0,
                                                  color: Color.fromRGBO(
                                                      146, 179, 195, 1.0),
                                                  height: 1.2,
                                                )),
                                          ],
                                        ),
                                        SizedBox(height: 10.0),
                                        Row(
                                          children: [
                                            Checkbox(
                                              checkColor: Colors.black,
                                              activeColor: Colors.white,
                                              value: this.newMovies,
                                              onChanged: (bool value) {
                                                setState(() {
                                                  if (value) {
                                                    this.timeRange +=
                                                        this.timeRange.isEmpty
                                                            ? '0'
                                                            : ',0';
                                                  } else {
                                                    this.timeRange = this
                                                            .timeRange
                                                            .contains(',0')
                                                        ? this
                                                            .timeRange
                                                            .replaceAll(
                                                                ',0', '')
                                                        : this
                                                            .timeRange
                                                            .replaceAll(
                                                                '0', '');
                                                  }
                                                  this.timeRangeAll = false;
                                                  this.newMovies = value;
                                                });
                                              },
                                            ),
                                            Text('New',
                                                style: TextStyle(
                                                  fontSize: 18.0,
                                                  color: Color.fromRGBO(
                                                      146, 179, 195, 1.0),
                                                  height: 1.2,
                                                )),
                                          ],
                                        ),
                                        SizedBox(height: 10.0),
                                        Row(
                                          children: [
                                            Checkbox(
                                              checkColor: Colors.black,
                                              activeColor: Colors.white,
                                              value: this.oneToFourYears,
                                              onChanged: (bool value) {
                                                setState(() {
                                                  if (value) {
                                                    this.timeRange +=
                                                        this.timeRange.isEmpty
                                                            ? '1'
                                                            : ',1';
                                                  } else {
                                                    this.timeRange = this
                                                            .timeRange
                                                            .contains(',1')
                                                        ? this
                                                            .timeRange
                                                            .replaceAll(
                                                                ',1', '')
                                                        : this
                                                            .timeRange
                                                            .replaceAll(
                                                                '1', '');
                                                  }
                                                  this.timeRangeAll = false;
                                                  this.oneToFourYears = value;
                                                });
                                              },
                                            ),
                                            Text('1-4 years old',
                                                style: TextStyle(
                                                  fontSize: 18.0,
                                                  color: Color.fromRGBO(
                                                      146, 179, 195, 1.0),
                                                  height: 1.2,
                                                )),
                                          ],
                                        ),
                                        SizedBox(height: 10.0),
                                        Row(
                                          children: [
                                            Checkbox(
                                              checkColor: Colors.black,
                                              activeColor: Colors.white,
                                              value: this.fiveToTenYears,
                                              onChanged: (bool value) {
                                                setState(() {
                                                  if (value) {
                                                    this.timeRange +=
                                                        this.timeRange.isEmpty
                                                            ? '2'
                                                            : ',2';
                                                  } else {
                                                    this.timeRange = this
                                                            .timeRange
                                                            .contains(',2')
                                                        ? this
                                                            .timeRange
                                                            .replaceAll(
                                                                ',2', '')
                                                        : this
                                                            .timeRange
                                                            .replaceAll(
                                                                '2', '');
                                                  }
                                                  this.timeRangeAll = false;
                                                  this.fiveToTenYears = value;
                                                });
                                              },
                                            ),
                                            Text('4-10 years old',
                                                style: TextStyle(
                                                  fontSize: 18.0,
                                                  color: Color.fromRGBO(
                                                      146, 179, 195, 1.0),
                                                  height: 1.2,
                                                )),
                                          ],
                                        ),
                                        SizedBox(height: 10.0),
                                        Row(
                                          children: [
                                            Checkbox(
                                              checkColor: Colors.black,
                                              activeColor: Colors.white,
                                              value: this.elevenToTwentyYears,
                                              onChanged: (bool value) {
                                                setState(() {
                                                  if (value) {
                                                    this.timeRange +=
                                                        this.timeRange.isEmpty
                                                            ? '3'
                                                            : ',3';
                                                  } else {
                                                    this.timeRange = this
                                                            .timeRange
                                                            .contains(',3')
                                                        ? this
                                                            .timeRange
                                                            .replaceAll(
                                                                ',3', '')
                                                        : this
                                                            .timeRange
                                                            .replaceAll(
                                                                '3', '');
                                                  }
                                                  this.timeRangeAll = false;
                                                  this.elevenToTwentyYears =
                                                      value;
                                                });
                                              },
                                            ),
                                            Text('10-15 years old',
                                                style: TextStyle(
                                                  fontSize: 18.0,
                                                  color: Color.fromRGBO(
                                                      146, 179, 195, 1.0),
                                                  height: 1.2,
                                                )),
                                          ],
                                        ),
                                        SizedBox(height: 10.0),
                                        Row(
                                          children: [
                                            Checkbox(
                                              checkColor: Colors.black,
                                              activeColor: Colors.white,
                                              value: this.elevenToTwentyYears,
                                              onChanged: (bool value) {
                                                setState(() {
                                                  if (value) {
                                                    this.timeRange +=
                                                        this.timeRange.isEmpty
                                                            ? '4'
                                                            : ',4';
                                                  } else {
                                                    this.timeRange = this
                                                            .timeRange
                                                            .contains(',4')
                                                        ? this
                                                            .timeRange
                                                            .replaceAll(
                                                                ',4', '')
                                                        : this
                                                            .timeRange
                                                            .replaceAll(
                                                                '4', '');
                                                  }
                                                  this.timeRangeAll = false;
                                                  this.elevenToTwentyYears =
                                                      value;
                                                });
                                              },
                                            ),
                                            Text('> 15 years old',
                                                style: TextStyle(
                                                  fontSize: 18.0,
                                                  color: Color.fromRGBO(
                                                      146, 179, 195, 1.0),
                                                  height: 1.2,
                                                )),
                                          ],
                                        ),
                                        SizedBox(height: 10.0),
                                      ]),
                                    ),
                                  )
                                ],
                              ),
                              ExpansionTile(
                                title: Text(
                                  "Rating ",
                                  style: theme.submenuhideshow,
                                ),
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.only(
                                        left: 15.0, right: 10.0),
                                    child: Theme(
                                      data: Theme.of(context).copyWith(
                                          unselectedWidgetColor: Color.fromRGBO(
                                              149, 182, 199, 1.0),
                                          disabledColor: Colors.blue),
                                      child: Column(children: <Widget>[
                                        Row(
                                          children: [
                                            Checkbox(
                                              checkColor: Colors.black,
                                              activeColor: Colors.white,
                                              value: this.rating1,
                                              onChanged: (bool value) {
                                                setState(() {
                                                  if (value) {
                                                    this.rating +=
                                                        this.rating.isEmpty
                                                            ? '1'
                                                            : ',1';
                                                  } else {
                                                    this.rating = this
                                                            .rating
                                                            .contains(',1')
                                                        ? this
                                                            .rating
                                                            .replaceAll(
                                                                ',1', '')
                                                        : this
                                                            .rating
                                                            .replaceAll(
                                                                '1', '');
                                                  }
                                                  this.rating1 = value;
                                                });
                                              },
                                            ),
                                            Text('1',
                                                style: TextStyle(
                                                  fontSize: 18.0,
                                                  color: Color.fromRGBO(
                                                      146, 179, 195, 1.0),
                                                  height: 1.2,
                                                )),
                                          ],
                                        ),
                                        SizedBox(height: 10.0),
                                        Row(
                                          children: [
                                            Checkbox(
                                              checkColor: Colors.black,
                                              activeColor: Colors.white,
                                              value: this.rating2,
                                              onChanged: (bool value) {
                                                setState(() {
                                                  if (value) {
                                                    this.rating +=
                                                        this.rating.isEmpty
                                                            ? '2'
                                                            : ',2';
                                                  } else {
                                                    this.rating = this
                                                            .rating
                                                            .contains(',2')
                                                        ? this
                                                            .rating
                                                            .replaceAll(
                                                                ',2', '')
                                                        : this
                                                            .rating
                                                            .replaceAll(
                                                                '2', '');
                                                  }
                                                  this.rating2 = value;
                                                });
                                              },
                                            ),
                                            Text('2',
                                                style: TextStyle(
                                                  fontSize: 18.0,
                                                  color: Color.fromRGBO(
                                                      146, 179, 195, 1.0),
                                                  height: 1.2,
                                                )),
                                          ],
                                        ),
                                        SizedBox(height: 10.0),
                                        Row(
                                          children: [
                                            Checkbox(
                                              checkColor: Colors.black,
                                              activeColor: Colors.white,
                                              value: this.rating3,
                                              onChanged: (bool value) {
                                                setState(() {
                                                  if (value) {
                                                    this.rating +=
                                                        this.rating.isEmpty
                                                            ? '3'
                                                            : ',3';
                                                  } else {
                                                    this.rating = this
                                                            .rating
                                                            .contains(',3')
                                                        ? this
                                                            .rating
                                                            .replaceAll(
                                                                ',3', '')
                                                        : this
                                                            .rating
                                                            .replaceAll(
                                                                '3', '');
                                                  }
                                                  this.rating3 = value;
                                                });
                                              },
                                            ),
                                            Text('3',
                                                style: TextStyle(
                                                  fontSize: 18.0,
                                                  color: Color.fromRGBO(
                                                      146, 179, 195, 1.0),
                                                  height: 1.2,
                                                )),
                                          ],
                                        ),
                                        SizedBox(height: 10.0),
                                        Row(
                                          children: [
                                            Checkbox(
                                              checkColor: Colors.black,
                                              activeColor: Colors.white,
                                              value: this.rating4,
                                              onChanged: (bool value) {
                                                setState(() {
                                                  if (value) {
                                                    this.rating +=
                                                        this.rating.isEmpty
                                                            ? '4'
                                                            : ',4';
                                                  } else {
                                                    this.rating = this
                                                            .rating
                                                            .contains(',4')
                                                        ? this
                                                            .rating
                                                            .replaceAll(
                                                                ',4', '')
                                                        : this
                                                            .rating
                                                            .replaceAll(
                                                                '4', '');
                                                  }
                                                  this.rating4 = value;
                                                });
                                              },
                                            ),
                                            Text('4',
                                                style: TextStyle(
                                                  fontSize: 18.0,
                                                  color: Color.fromRGBO(
                                                      146, 179, 195, 1.0),
                                                  height: 1.2,
                                                )),
                                          ],
                                        ),
                                        SizedBox(height: 10.0),
                                        Row(
                                          children: [
                                            Checkbox(
                                              checkColor: Colors.black,
                                              activeColor: Colors.white,
                                              value: this.rating5,
                                              onChanged: (bool value) {
                                                setState(() {
                                                  if (value) {
                                                    this.rating +=
                                                        this.rating.isEmpty
                                                            ? '5'
                                                            : ',5';
                                                  } else {
                                                    this.rating = this
                                                            .rating
                                                            .contains(',5')
                                                        ? this
                                                            .rating
                                                            .replaceAll(
                                                                ',5', '')
                                                        : this
                                                            .rating
                                                            .replaceAll(
                                                                '5', '');
                                                  }
                                                  this.rating5 = value;
                                                });
                                              },
                                            ),
                                            Text('5',
                                                style: TextStyle(
                                                  fontSize: 18.0,
                                                  color: Color.fromRGBO(
                                                      146, 179, 195, 1.0),
                                                  height: 1.2,
                                                )),
                                          ],
                                        ),
                                        SizedBox(height: 10.0),
                                      ]),
                                    ),
                                  )
                                ],
                              ),
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
                              // ListTile(
                              //   title: Text(
                              //     'Actor Details',
                              //     style: TextStyle(
                              //       color: Colors.grey,
                              //     ),
                              //   ),
                              //   onTap: () {
                              //     Navigator.pop(context);
                              //     Route route = MaterialPageRoute(
                              //         builder: (context) => ActorDetailsPage());
                              //     Navigator.push(context, route);
                              //   },
                              // ),
                              SizedBox(
                                height: 30,
                              ),
                              Center(
                                child: InkWell(
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 200.0,
                                    child: Text("Apply Filter",
                                        textDirection: TextDirection.ltr,
                                        textAlign: TextAlign.center,
                                        style: theme.applyfilter),
                                    padding: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromRGBO(226, 186, 31, 1.0)),
                                  ),
                                  onTap: () async {
                                    var filter = '';
                                    if (genre.isNotEmpty) {
                                      filter = '&genre=$genre';
                                    }
                                    if (category.isNotEmpty) {
                                      filter += '&catagory=$category';
                                    }
                                    if (timeRange.isNotEmpty) {
                                      filter += '&timeRange=$timeRange';
                                    }
                                    if (rating.isNotEmpty) {
                                      filter += '&rating=$rating';
                                    }
                                    // print('Applied filters : $filter');
                                    var searchText =
                                        await StorageHelper.get('searchKey');
                                    bloc.search(
                                      searchText,
                                      rating: rating,
                                      genre: genre,
                                      category: category,
                                      timeRange: timeRange,
                                    );
                                    Navigator.pop(context);
                                  },
                                ),
                              )
                            ],
                          )),
                    ],
                  ),
                )),
                body: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(left: 30.0, right: 30.0),
                    child: search(context, bloc, query: query)))));
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
                      'Search',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Route route =
                          MaterialPageRoute(builder: (context) => SearchPage());
                      Navigator.push(context, route);
                    },
                  ),
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
                      onTap: () => {CommonUtils.logout(context)},
                    ),
                  )
                ],
              )),
        ],
      ),
    ));
  }
}
