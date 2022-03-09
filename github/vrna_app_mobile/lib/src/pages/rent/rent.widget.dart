import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:vrna_app_mobile/src/blocs/dashboard.bloc.dart';
import 'package:provider/provider.dart';
import 'package:vrna_app_mobile/src/widgets/edit_text.dart';
// import 'package:vrna_app_mobile/src/widgets/edit_text.dart';
// import 'package:vrna_app_mobile/src/widgets/text.dart';
// import 'package:vrna_app_mobile/src/widgets/logo.dart';
import 'package:vrna_app_mobile/src/pages/moviedetails/movie.trailors.dart';
import 'package:vrna_app_mobile/src/pages/moviedetails/movie.detail.video.dart';
import 'package:vrna_app_mobile/src/pages/rent/rent.page.dart';
import 'package:vrna_app_mobile/src/widgets/button.dart';
import 'package:vrna_app_mobile/src/values/colors.dart' as colors;
// import 'package:vrna_app_mobile/src/values/dimens.dart' as dimens;

class RentWidget {
  Widget Rent(BuildContext context, details, DashboardBloc bloc) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Padding(
      padding: EdgeInsets.all(0.0),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // MovieBanner(
          //     posterurl: details.posterurl,
          //     movieId: details.movieId,
          //     filepath: details.filepath),
          SizedBox(height: size.height * 0.03),
          EditText(
            placeholder: "Card number",
            value: bloc.cardnumber,
            onChange: (value) => bloc.setCardnumber(value),
            // prefixIcon: Icons.email_sharp,
            keyboardType: TextInputType.text,
          ),
          SizedBox(height: size.height * 0.02),
          EditText(
            placeholder: "Expiry month",
            value: bloc.month,
            onChange: (value) => bloc.setMonth(value),
            // prefixIcon: Icons.call,
            keyboardType: TextInputType.text,
          ),
          SizedBox(height: size.height * 0.02),
          EditText(
            placeholder: "Expiry year",
            value: bloc.year,
            onChange: (value) => bloc.setYear(value),
            // prefixIcon: Icons.lock,
            password: true,
            keyboardType: TextInputType.text,
          ),
          SizedBox(height: size.height * 0.02),
          EditText(
            placeholder: "cvv",
            value: bloc.cvv,
            onChange: (value) => bloc.setCvv(value),
            // prefixIcon: Icons.lock,
            password: true,
            keyboardType: TextInputType.text,
          ),
          SizedBox(height: size.height * 0.04),
          CustomButton(
              label: "Checkout",
              onPress: () => bloc.addRent(context, details),
              width: size.width * 0.9,
              height: size.height * 0.07),
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
  const MovieBanner({Key key, this.posterurl, this.movieId, this.filepath});

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
    return Stack(
      children: [
        Container(
          width: size.width * 1,
          height: size.height * 0.25,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(widget.posterurl), fit: BoxFit.cover)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                  icon: Icon(
                    Icons.play_circle_outline,
                    color: Colors.white,
                    size: 30.0,
                  ),
                  onPressed: () {
                    Route route = MaterialPageRoute(
                        builder: (context) =>
                            MovieVideo(movieUrl: widget.filepath));
                    Navigator.push(context, route);
                  }),
              CustomButton(
                label: "Rent",
                //onPress: () => bloc.rentPopup(true),
                onPress: () {
                  showAlertDialog(context, bloc);
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
  }
}

showAlertDialog(BuildContext context, DashboardBloc bloc) {
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

// showAlertDialog(BuildContext context) {
//   // set up the buttons
//   Widget remindButton = FlatButton(
//     child: Text("Remind me later"),
//     onPressed: () {},
//   );
//   Widget cancelButton = FlatButton(
//     child: Text("Cancel"),
//     onPressed: () {},
//   );
//   Widget launchButton = FlatButton(
//     child: Text("Launch missile"),
//     onPressed: () {},
//   );

//   // set up the AlertDialog
//   AlertDialog alert = AlertDialog(
//     title: Text("Notice"),
//     content: Text(
//         "Launching this missile will destroy the entire universe. Is this what you intended to do?"),
//     actions: [
//       remindButton,
//       cancelButton,
//       launchButton,
//     ],
//   );

//   // show the dialog
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return alert;
//     },
//   );
// }

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
              Text(moviename,
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
                        child: Text(resultGenre),
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
                    child: Text(description,
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

class MovieScene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
        // margin: EdgeInsets.symmetric(vertical: 10),
        width: size.width * 0.99,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text('MOVIE',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5.0),
                    child: Text('SCENE',
                        style: TextStyle(
                            color: colors.appYellow,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left),
                  ),
                ],
              ),
              const Padding(padding: EdgeInsets.all(2)),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    const Padding(padding: EdgeInsets.all(4)),
                    Container(
                      color: Colors.green, // Yellow
                      height: 100.0,
                      width: 150.0,
                    ),
                    const Padding(padding: EdgeInsets.all(4)),
                    Container(
                      color: Colors.yellow, // Yellow
                      height: 100.0,
                      width: 150.0,
                    ),
                    const Padding(padding: EdgeInsets.all(4)),
                    Container(
                      color: Colors.blue, // Yellow
                      height: 100.0,
                      width: 150.0,
                    ),
                    const Padding(padding: EdgeInsets.all(4)),
                    Container(
                      color: Colors.red, // Yellow
                      height: 100.0,
                      width: 150.0,
                    ),
                    const Padding(padding: EdgeInsets.all(4)),
                    Container(
                      color: Colors.pink, // Yellow
                      height: 100.0,
                      width: 150.0,
                    ),
                    const Padding(padding: EdgeInsets.all(4)),
                    Container(
                      color: Colors.orange, // Yellow
                      height: 100.0,
                      width: 150.0,
                    ),
                  ],
                ),
              )
            ]));
  }
}

class RelatedMovies extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
        // margin: EdgeInsets.symmetric(vertical: 10),
        width: size.width * 0.99,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text('RELATED',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5.0),
                    child: Text('MOVIES',
                        style: TextStyle(
                            color: colors.appYellow,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left),
                  ),
                ],
              ),
              const Padding(padding: EdgeInsets.all(2)),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    const Padding(padding: EdgeInsets.all(4)),
                    Container(
                      color: Colors.green, // Yellow
                      height: 100.0,
                      width: 150.0,
                    ),
                    const Padding(padding: EdgeInsets.all(4)),
                    Container(
                      color: Colors.yellow, // Yellow
                      height: 100.0,
                      width: 150.0,
                    ),
                    const Padding(padding: EdgeInsets.all(4)),
                    Container(
                      color: Colors.blue, // Yellow
                      height: 100.0,
                      width: 150.0,
                    ),
                    const Padding(padding: EdgeInsets.all(4)),
                    Container(
                      color: Colors.red, // Yellow
                      height: 100.0,
                      width: 150.0,
                    ),
                    const Padding(padding: EdgeInsets.all(4)),
                    Container(
                      color: Colors.pink, // Yellow
                      height: 100.0,
                      width: 150.0,
                    ),
                    const Padding(padding: EdgeInsets.all(4)),
                    Container(
                      color: Colors.orange, // Yellow
                      height: 100.0,
                      width: 150.0,
                    ),
                  ],
                ),
              )
            ]));
  }
}

class More extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        width: size.width * 0.99,
        child: Column(children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text('MORE',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5.0),
                child: Text('HISTORICAL-ROMANCE',
                    style: TextStyle(
                        color: colors.appYellow, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left),
              ),
            ],
          ),
          const Padding(padding: EdgeInsets.all(2)),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                const Padding(padding: EdgeInsets.all(4)),
                Container(
                  color: Colors.green, // Yellow
                  height: 150.0,
                  width: 100.0,
                ),
                const Padding(padding: EdgeInsets.all(4)),
                Container(
                  color: Colors.yellow, // Yellow
                  height: 150.0,
                  width: 100.0,
                ),
                const Padding(padding: EdgeInsets.all(4)),
                Container(
                  color: Colors.blue, // Yellow
                  height: 150.0,
                  width: 100.0,
                ),
                const Padding(padding: EdgeInsets.all(4)),
                Container(
                  color: Colors.red, // Yellow
                  height: 150.0,
                  width: 100.0,
                ),
                const Padding(padding: EdgeInsets.all(4)),
                Container(
                  color: Colors.pink, // Yellow
                  height: 150.0,
                  width: 100.0,
                ),
                const Padding(padding: EdgeInsets.all(4)),
                Container(
                  color: Colors.orange, // Yellow
                  height: 150.0,
                  width: 100.0,
                ),
              ],
            ),
          )
        ]));
  }
}

class MovieActors extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        width: size.width * 0.99,
        child: Column(children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text('MOVIE',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5.0),
                child: Text('ACTORS',
                    style: TextStyle(
                        color: colors.appYellow, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left),
              ),
            ],
          ),
          const Padding(padding: EdgeInsets.all(2)),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                const Padding(padding: EdgeInsets.all(4)),
                Image.asset('assets/images/movieactor1.jpg',
                    fit: BoxFit.cover, width: 100.0, height: 100.0),
                const Padding(padding: EdgeInsets.all(4)),
                Image.asset('assets/images/movieactor2.jpg',
                    fit: BoxFit.cover, width: 100.0, height: 100.0),
                const Padding(padding: EdgeInsets.all(4)),
                Image.asset('assets/images/movieactor3.jpg',
                    fit: BoxFit.cover, width: 100.0, height: 100.0),
                const Padding(padding: EdgeInsets.all(4)),
                Image.asset('assets/images/movieactor4.jpg',
                    fit: BoxFit.cover, width: 100.0, height: 100.0),
                const Padding(padding: EdgeInsets.all(4)),
                Image.asset('assets/images/movieactor2.jpg',
                    fit: BoxFit.cover, width: 100.0, height: 100.0),
                const Padding(padding: EdgeInsets.all(4)),
                Image.asset('assets/images/movieactor4.jpg',
                    fit: BoxFit.cover, width: 100.0, height: 100.0),
              ],
            ),
          )
        ]));
  }
}
