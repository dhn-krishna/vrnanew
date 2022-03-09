import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:vrna_app_mobile/src/blocs/search.bloc.dart';
import 'package:vrna_app_mobile/src/pages/dashboard/dashboard.page.dart';
import 'package:vrna_app_mobile/src/pages/search/search.page.dart';
import 'package:vrna_app_mobile/src/values/colors.dart' as colors;

class AppHeader {
  static Widget getAppBar(BuildContext context, SearchBloc searchBloc,
      GlobalKey<ScaffoldState> scaffoldKey,
      {enableLogoLink = true}) {
    bool layoutDecide = MediaQuery.of(context).size.width < 1024;
    return AppBar(
      toolbarHeight: 100.0,
      automaticallyImplyLeading: false,
      leading: InkWell(
        child: Image(
          image: AssetImage('assets/burger_menu.png'),
          fit: BoxFit.fitWidth,
          width: 30.0,
          height: 30.0,
        ),
        onTap: () => {scaffoldKey.currentState.openDrawer()},
      ),
      title: new Row(children: <Widget>[
        GestureDetector(
            onTap: () {
              if (enableLogoLink) {
                Route route =
                    MaterialPageRoute(builder: (context) => DashboardPage());
                Navigator.push(context, route);
              }
            },
            child: Container(
              width: 150.0,
              height: 75.0,
              decoration: BoxDecoration(
                image: new DecorationImage(
                  image: new ExactAssetImage('assets/logo.png'),
                  fit: BoxFit.fitWidth,
                ),
              ),
            )),
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
              Container(
                  width: layoutDecide ? 50.0 : 400,
                  child: 1 == 0
                      ? TextField(
                          style: TextStyle(
                              color: Color.fromRGBO(233, 233, 233, 1.0)),
                          decoration: InputDecoration(
                              hintText: 'Title, People, jouner',
                              hintStyle: TextStyle(color: Colors.white),
                              border: InputBorder.none))
                      : TypeAheadField(
                          hideOnLoading: true,
                          textFieldConfiguration: TextFieldConfiguration(
                            autofocus: false,
                            decoration: InputDecoration(
                                focusedBorder: InputBorder.none,
                                hintText: 'Title, People, Jouner',
                                hintStyle: TextStyle(color: Colors.white)),
                            style: TextStyle(
                                color: Color.fromRGBO(233, 233, 233, 1.0)),
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
                                  style: TextStyle(color: Colors.white)),
                            );
                          },
                          onSuggestionSelected: (query) {
                            Route route = MaterialPageRoute(
                                builder: (context) => SearchPage(query: query));
                            Navigator.push(context, route);
                          },
                        )),
              Icon(
                Icons.search_outlined,
                color: Colors.white,
                size: 30.0,
              ),
              SizedBox(width: 10.0)
            ]),
          ),
        ),
      ]),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
    );
  }
}
