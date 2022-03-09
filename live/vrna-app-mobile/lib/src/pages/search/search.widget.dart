import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:vrna_app_mobile/src/blocs/search.bloc.dart';
import 'package:vrna_app_mobile/src/helpers/storage/storage.helper.dart';
import 'package:vrna_app_mobile/src/models/movie.model.dart';
import 'package:vrna_app_mobile/src/pages/dashboard/dashboard.page.dart';
import 'package:vrna_app_mobile/src/pages/moviedetails/movie.details.page.dart';
import 'package:vrna_app_mobile/src/pages/search/search.page.dart';
import 'package:vrna_app_mobile/src/values/colors.dart' as colors;
import '../../widgets/theme.dart' as customTheme;
import 'package:vrna_app_mobile/src/values/devicescreen.dart';

class SearchPageWidget {
  TextEditingController controller = TextEditingController();
  String searchText = '';
  Widget search(BuildContext context, SearchBloc bloc, {String query = ""}) {
    if (query != null && query.isNotEmpty) {
      controller.text = query;
      StorageHelper.set('searchKey', query);
    }
    var mediaQuery = MediaQuery.of(context);
    var device = getDeviceType(mediaQuery);
    customTheme.Theme theme = customTheme.Theme.getTheme(device);
    Size size = MediaQuery.of(context).size;
    bool layoutDecide = MediaQuery.of(context).size.width < 1024;
    return SingleChildScrollView(
        child: Padding(
      padding: EdgeInsets.all(0.0),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          //TopMenu(),
          SizedBox(height: 20.0),
          AnimatedContainer(
              duration: Duration(milliseconds: 400),
              width: MediaQuery.of(context).size.width * 0.85,
              height: 50.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                color: Color.fromRGBO(25, 37, 46, 1.0),
              ),
              child: Row(children: [
                Expanded(
                  child: Container(
                      padding: EdgeInsets.only(left: 30.0, right: 30.0),
                      child: TypeAheadField(
                        hideOnLoading: true,
                        // getImmediateSuggestions: false,
                        textFieldConfiguration: TextFieldConfiguration(
                          autofocus: false,
                          controller: controller,
                          decoration:
                              InputDecoration(focusedBorder: InputBorder.none),
                          style: TextStyle(
                              color: Color.fromRGBO(233, 233, 233, 1.0)),
                        ),
                        suggestionsCallback: (pattern) async {
                          bloc.setSearchText(pattern);
                          if (query == null || query.isEmpty) {
                            // bloc.searchMovieResponse.
                            return bloc.getSuggestions(pattern);
                          } else {
                            query = '';
                            return [];
                          }
                        },
                        hideOnEmpty: true,
                        hideOnError: true,
                        noItemsFoundBuilder: (context) {
                          return Container();
                        },
                        itemBuilder: (context, suggestion) {
                          return ListTile(
                            tileColor: colors.accentColor,
                            title: Text(suggestion,
                                style: TextStyle(color: Colors.white)),
                          );
                        },
                        onSuggestionSelected: (query) {
                          StorageHelper.set('searchKey', query);
                          bloc.search(query);
                        },
                      )),
                ),
                AnimatedContainer(
                  child: InkWell(
                    child: Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: Icon(Icons.search,
                          size: 22.0, color: Color.fromRGBO(93, 106, 117, 1.0)),
                    ),
                    onTap: () {},
                  ),
                  duration: Duration(milliseconds: 400),
                ),
              ])),
          Container(             
            child:SearchResult(
            data: bloc.searchMovieResponse,
          ),)
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
        //height: size.height * 0.25,
        child: Padding(
          padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    Route route = MaterialPageRoute(
                        builder: (context) => DashboardPage());
                    Navigator.push(context, route);
                  },
                  child: Icon(
                    Icons.keyboard_backspace,
                    color: Colors.white,
                    size: 30.0,
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Text('Search',
                  style: theme.tabbartxt, textAlign: TextAlign.left),
            ),
            Row(children: [
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: InkWell(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 30.0,
                        height: 4.0,
                        color: Colors.white,
                        margin: EdgeInsets.only(bottom: 4.0),
                      ),
                      Container(
                        width: 20.0,
                        height: 4.0,
                        color: Colors.white,
                        margin: EdgeInsets.only(bottom: 4.0),
                      ),
                      Container(
                        width: 10.0,
                        height: 4.0,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  onTap: () => {},
                ),
              ),
            ]),
          ]),
        ));
  }
}

class SearchResult extends StatefulWidget {
  final data;

  const SearchResult({Key key, this.data}) : super(key: key);
  @override
  _SearchResultState createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Movie> movieList = [];
    int movieCount = 0;
    return StreamBuilder<dynamic>(
        stream: widget.data,
        initialData: "",
        builder: (context, snapshot) {
          movieList = [];
          if (snapshot.data != null && snapshot.data != '') {
            movieList = snapshot.data.movies;
          }
          return movieList != null
              ? Container(
                  width: MediaQuery.of(context).size.width * 0.90,
                  padding: EdgeInsets.only(top: 30.0),
                  alignment: Alignment.center,
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    children: [                      
                      // snapshot.connectionState.index > 0 ?                     
                       Row(
                        mainAxisAlignment:MainAxisAlignment.center,
                        children: [
                        Text(
                          'Total Search Results:',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          ' ${movieList?.length ?? 0} Movie(s)',
                          style: TextStyle(color: colors.appYellow),
                        )
                      ]),
                      SizedBox(height: 30,),
                      for (var movie in movieList)
                        Container(
                          margin: EdgeInsets.only(
                              right: 10.0, left: 10.0, bottom: 30.0),
                          child: InkWell(
                            child: Image.network(
                              movie.posterurl,
                              fit: BoxFit.fill,
                              width: 200.0,
                              height: 350.0,
                            ),
                            onTap: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          MovieDetailsPage(details: movie)));
                            },
                          ),
                        ),
                    ],
                  ))
              : Container();
        });
  }
}
