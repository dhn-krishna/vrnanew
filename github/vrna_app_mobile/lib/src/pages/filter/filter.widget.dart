import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:vrna_app_mobile/src/blocs/filter.bloc.dart';
import 'package:vrna_app_mobile/src/widgets/button.dart';
import 'package:vrna_app_mobile/src/pages/moviedetails/movie.details.page.dart';
import 'package:vrna_app_mobile/src/widgets/edit_text.dart';
import 'package:vrna_app_mobile/src/widgets/text.dart';
import 'package:vrna_app_mobile/src/widgets/logo.dart';
import 'package:provider/provider.dart';
// import 'package:vrna_app_mobile/src/pages/moviedetails/movie.trailors.dart';
import 'package:vrna_app_mobile/src/values/colors.dart' as colors;
import 'package:vrna_app_mobile/src/values/dimens.dart' as dimens;

class FilterWidget {
  Widget Filter(BuildContext context, FilterBloc bloc) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Padding(
      padding: EdgeInsets.all(0.0),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: size.height * 0.03),
          TopMenu(),
          SizedBox(height: size.height * 0.03),
          SearchResult(),
          SizedBox(height: size.height * 0.03),
          SearchResultData(data: bloc.responseFilterData)
        ],
      ),
    ));
  }
}

class TopMenu extends StatelessWidget {
  @override
  // static const IconData share_outlined =
  //     IconData(0xe412, fontFamily: 'MaterialIcons');

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        width: size.width * 0.99,
        //height: size.height * 0.25,
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
            Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Text('Search',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left),
            ),
            Row(children: [
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Icon(
                  Icons.filter_list,
                  color: Colors.white,
                  size: 30.0,
                ),
              )
            ]),
          ]),
        ));
  }
}

class ActorBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Container(
          width: size.width * 1,
          height: size.height * 0.25,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.3, 1],
                colors: [Color(0xff5f2c82), Color(0xff49a09d)]),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text('KEANUREEVES',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text('Actor',
                    style: TextStyle(
                        color: Colors.yellow, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class SearchResult extends StatefulWidget {
  @override
  _SearchResultApp createState() => _SearchResultApp();
}

class _SearchResultApp extends State<SearchResult> {
  FilterBloc bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    bloc = Provider.of<FilterBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        width: size.width * 0.99,
        child: Column(children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: EditText(
                placeholder: "Search",
                keyboardType: TextInputType.text,
                value: bloc.searchText,
                onChange: (value) => bloc.setSearchText(value),
                onSubmit: () => bloc.searchItem(context),
                border: true),
          ),
        ]));
  }
}

class SearchResultData extends StatefulWidget {
  final Stream<dynamic> data;
  const SearchResultData({Key key, this.data});

  @override
  _SearchResultDataApp createState() => _SearchResultDataApp();
}

class _SearchResultDataApp extends State<SearchResultData> {
  FilterBloc bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    bloc = Provider.of<FilterBloc>(context);
    //bloc.responseFilterData;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return StreamBuilder<dynamic>(
        stream: widget.data,
        initialData: "",
        builder: (context, snapshot) {
          List filterList = [];
          if (snapshot.data != null && snapshot.data != '') {
            filterList = snapshot.data.dataFilter;
          }
          return Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              width: size.width * 0.99,
              child: Column(children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text('Total Search Results',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5.0),
                      child: Text(filterList.length.toString() + ' Movies',
                          style: TextStyle(
                              color: colors.appYellow,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left),
                    ),
                  ],
                ),
                Wrap(
                  // direction: Axis.vertical,
                  // alignment: WrapAlignment.center,
                  spacing: 20.0,
                  // runAlignment:WrapAlignment.center,
                  runSpacing: 10.0,
                  // crossAxisAlignment: WrapCrossAlignment.start,
                  // textDirection: TextDirection.ltr,
                  // verticalDirection: VerticalDirection.up,
                  children: <Widget>[
                    for (var result in filterList)
                      Container(
                          color: Colors.blue,
                          width: 100,
                          height: 100,
                          child: InkWell(
                            child: Image.network(result.moviebannerurl,
                                fit: BoxFit.cover, width: 100.0, height: 150.0),
                            onTap: () {
                              Route route = MaterialPageRoute(
                                  builder: (context) =>
                                      MovieDetailsPage(details: result));
                              Navigator.push(context, route);
                            },
                          )),
                    // Container(
                    //     color: Colors.red,
                    //     width: 100,
                    //     height: 100,
                    //     child: Center(
                    //         child: Text(
                    //       "W2",
                    //       textScaleFactor: 2.5,
                    //     ))),
                    // Container(
                    //     color: Colors.teal,
                    //     width: 100,
                    //     height: 100,
                    //     child: Center(
                    //         child: Text(
                    //       "W3",
                    //       textScaleFactor: 2.5,
                    //     ))),
                    // Container(
                    //     color: Colors.indigo,
                    //     width: 100,
                    //     height: 100,
                    //     child: Center(
                    //         child: Text(
                    //       "W4",
                    //       textScaleFactor: 2.5,
                    //     ))),
                    // Container(
                    //     color: Colors.orange,
                    //     width: 100,
                    //     height: 100,
                    //     child: Center(
                    //         child: Text(
                    //       "W5",
                    //       textScaleFactor: 2.5,
                    //     ))),
                  ],
                )
              ]));
        });
  }
}
