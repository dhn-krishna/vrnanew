import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:vrna_app_mobile/src/models/movie.model.dart';
import 'package:vrna_app_mobile/src/blocs/favorites.bloc.dart';
import 'package:vrna_app_mobile/src/pages/dashboard/dashboard.page.dart';
import 'package:vrna_app_mobile/src/pages/moviedetails/movie.details.page.dart';
import '../../widgets/theme.dart' as customTheme;
import 'package:vrna_app_mobile/src/values/devicescreen.dart';

import 'package:vrna_app_mobile/src/values/colors.dart' as colors;

class FavoritesWidget {
  Widget Favorites(BuildContext context, FavoritesBloc bloc) {
    var mediaQuery = MediaQuery.of(context);
    var device = getDeviceType(mediaQuery);
    customTheme.Theme theme = customTheme.Theme.getTheme(device);
    Size size = MediaQuery.of(context).size;
    bool layoutDecide = MediaQuery.of(context).size.width < 1024;
    return StreamBuilder<dynamic>(
        stream: bloc.data,
        initialData: "",
        builder: (context, snapshot) {
          List<Movie> movieList = [];
          if (snapshot.data != null && snapshot.data != '') {
            movieList = snapshot.data.data;
          }
          return movieList != null
              ? SingleChildScrollView(
                  child: Padding(
                  padding: EdgeInsets.all(0.0),
                  child: Column(
                    children: <Widget>[
                      // TopMenu(),
                      SizedBox(height: 20.0),

                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Favorites',
                              style: TextStyle(color: Colors.white),
                            ),
                          ]),
                      SizedBox(
                        height: 20,
                      ),
                      FavoritesData(movies: movieList),
                    ],
                  ),
                ))
              : Container(
                  child: Center(
                  child: Text(
                    'No movies available in this category',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ));
        });
  }
}

class FavoritesData extends StatefulWidget {
  final List<Movie> movies;

  const FavoritesData({Key key, this.movies}) : super(key: key);

  @override
  _FavoritesDataState createState() => _FavoritesDataState();
}

class _FavoritesDataState extends State<FavoritesData> {
  @override
  Widget build(BuildContext context) {
    var filter = "";
    return Container(
        width: MediaQuery.of(context).size.width * 0.90,
        padding: EdgeInsets.only(top: 30.0),
        alignment: Alignment.center,
        child: Wrap(
          alignment: WrapAlignment.start,
          children: [
            for (var movie in widget.movies)
              Container(
                margin: EdgeInsets.only(right: 10.0, left: 10.0, bottom: 30.0),
                child: InkWell(
                  child: Image.network(
                    movie.posterurl,
                    fit: BoxFit.fill,
                    width: 200.0,
                    height: 350.0,
                  ),
                  onTap: () {
                    Route route = MaterialPageRoute(
                        builder: (context) => MovieDetailsPage(
                              details: movie,
                            ));
                    Navigator.pushReplacement(context, route);
                  },
                ),
              ),
          ],
        ));
  }
}
