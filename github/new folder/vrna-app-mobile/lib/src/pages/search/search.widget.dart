import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:vrna_app_mobile/src/pages/dashboard/dashboard.page.dart';
// import 'package:vrna_app_mobile/src/blocs/auth.bloc.dart';
import 'package:vrna_app_mobile/src/pages/moviedetails/movie.trailors.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:vrna_app_mobile/src/values/colors.dart' as colors;
import '../moviedetails/movie.banner.slider.dart';
import '../moviedetails/movie.details.page.dart';
import '../../widgets/theme.dart' as customTheme;
import 'package:vrna_app_mobile/src/values/colors.dart' as colors;
import 'package:vrna_app_mobile/src/values/devicescreen.dart';

class SearchPageWidget {
  Widget search(BuildContext context) {
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
        children: <Widget>[
          TopMenu(),
          SizedBox(height: 20.0),
          AnimatedContainer(
              duration: Duration(milliseconds: 400),
              width: MediaQuery.of(context).size.width * 0.90,
              height: 50.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                color: Color.fromRGBO(25, 37, 46, 1.0),
              ),
              child: Row(children: [
                Expanded(
                  child: Container(
                      padding: EdgeInsets.only(left: 16.0),
                      child: TextField(
                        style:
                            TextStyle(color: Color.fromRGBO(93, 106, 117, 1.0)),
                        decoration: InputDecoration(
                            focusColor: Colors.white,
                            hintText: 'Search',
                            hintStyle: TextStyle(
                                color: Color.fromRGBO(93, 106, 117, 1.0)),
                            border: InputBorder.none),
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
          SearchResult(),
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
              child: 
              InkWell(
                onTap:(){
                  Navigator.pop(context);
                      Route route =
                          MaterialPageRoute(builder: (context) => DashboardPage());
                      Navigator.push(context, route);
                },
                child:Icon(
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
                  onTap: () => {print("Clicked")},
                ),
              ),
            ]),
          ]),
        ));
  }
}

class SearchResult extends StatefulWidget {
  // const YellowBird({ Key? key }) : super(key: key);

  @override
  _SearchResultState createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.90,
        padding: EdgeInsets.only(top: 30.0),
        alignment: Alignment.center,
        child: Wrap(
          alignment: WrapAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(right: 10.0, left: 10.0, bottom: 30.0),
              child: InkWell(
                child: Image.network(
                  "assets/images/movie1.png",
                  fit: BoxFit.fill,
                  width: 200.0,
                  height: 350.0,
                ),
                onTap: () {},
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 10.0, left: 10.0, bottom: 30.0),
              child: InkWell(
                child: Image.network(
                  "assets/images/movie1.png",
                  fit: BoxFit.fill,
                  width: 200.0,
                  height: 350.0,
                ),
                onTap: () {},
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 10.0, left: 10.0, bottom: 30.0),
              child: InkWell(
                child: Image.network(
                  "assets/images/movie1.png",
                  fit: BoxFit.fill,
                  width: 200.0,
                  height: 350.0,
                ),
                onTap: () {},
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 10.0, left: 10.0, bottom: 30.0),
              child: InkWell(
                child: Image.network(
                  "assets/images/movie1.png",
                  fit: BoxFit.fill,
                  width: 200.0,
                  height: 350.0,
                ),
                onTap: () {},
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 10.0, left: 10.0, bottom: 30.0),
              child: InkWell(
                child: Image.network(
                  "assets/images/movie1.png",
                  fit: BoxFit.fill,
                  width: 200.0,
                  height: 350.0,
                ),
                onTap: () {},
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 10.0, left: 10.0, bottom: 30.0),
              child: InkWell(
                child: Image.network(
                  "assets/images/movie1.png",
                  fit: BoxFit.fill,
                  width: 200.0,
                  height: 350.0,
                ),
                onTap: () {},
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 10.0, left: 10.0, bottom: 30.0),
              child: InkWell(
                child: Image.network(
                  "assets/images/movie1.png",
                  fit: BoxFit.fill,
                  width: 200.0,
                  height: 350.0,
                ),
                onTap: () {},
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 10.0, left: 10.0, bottom: 30.0),
              child: InkWell(
                child: Image.network(
                  "assets/images/movie1.png",
                  fit: BoxFit.fill,
                  width: 200.0,
                  height: 350.0,
                ),
                onTap: () {},
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 10.0, left: 10.0, bottom: 30.0),
              child: InkWell(
                child: Image.network(
                  "assets/images/movie1.png",
                  fit: BoxFit.fill,
                  width: 200.0,
                  height: 350.0,
                ),
                onTap: () {},
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 10.0, left: 10.0, bottom: 30.0),
              child: InkWell(
                child: Image.network(
                  "assets/images/movie1.png",
                  fit: BoxFit.fill,
                  width: 200.0,
                  height: 350.0,
                ),
                onTap: () {},
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 10.0, left: 10.0, bottom: 30.0),
              child: InkWell(
                child: Image.network(
                  "assets/images/movie1.png",
                  fit: BoxFit.fill,
                  width: 200.0,
                  height: 350.0,
                ),
                onTap: () {},
              ),
            ),
          ],
        ));
  }
}
