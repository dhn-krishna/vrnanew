import 'package:flutter/material.dart';
import 'package:vrna_app_mobile/src/blocs/contactus.bloc.dart';
import 'package:vrna_app_mobile/src/helpers/utils/commonutils.dart';
import 'package:vrna_app_mobile/src/pages/dashboard/dashboard.page.dart';
import 'package:vrna_app_mobile/src/pages/login/login.page.dart';
import 'package:vrna_app_mobile/src/pages/search/search.page.dart';
// import 'package:vrna_app_mobile/src/blocs/auth.bloc.dart';
import 'package:vrna_app_mobile/src/widgets/loading.dart';
import 'package:vrna_app_mobile/src/pages/contactus/contactus.widget.dart';
import 'package:vrna_app_mobile/src/widgets/background.dart';
import 'package:vrna_app_mobile/src/values/colors.dart' as colors;
import 'package:vrna_app_mobile/src/values/devicescreen.dart';
import 'package:provider/provider.dart';
import '../../widgets/theme.dart' as customTheme;
import 'package:vrna_app_mobile/src/pages/profile/profile.page.dart';

class ContactUsPage extends StatefulWidget {
  @override
  _ContactUsPageState createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> with ContactUsWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  ContactUsBloc bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    bloc = Provider.of<ContactUsBloc>(context);
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var device = getDeviceType(mediaQuery);
    bool _folded = true;
    double widthSize = mediaQuery.size.width * 1.0;    
    bool layoutDecide = MediaQuery.of(context).size.width < 1024;

    if (device == DeviceScreenType.Tv) {
      widthSize = mediaQuery.size.width;
    } else if (device == DeviceScreenType.Desktop) {
      widthSize = mediaQuery.size.width;
    } else if (device == DeviceScreenType.Tablet) {
      widthSize = mediaQuery.size.width * 0.6;
    } else if (device == DeviceScreenType.Mobile) {
      widthSize = mediaQuery.size.width * 0.9;
    }

    var theme = customTheme.Theme.getTheme(device);
    return Background(
        child: Loading(
            message: "Loading ...",
            // status: bloc.loading,
            child: Scaffold(
                key: _scaffoldKey,
                appBar: new AppBar(
                  toolbarHeight: 100.0,
                  automaticallyImplyLeading: false,
                  leading: Container(
                    width: 45.0,
                    height: 45.0,
                    child: InkWell(
                      child: Container(
                        width: 20.0,
                        height: 20.0,
                        decoration: BoxDecoration(
                          image: new DecorationImage(
                            image: new AssetImage('assets/burger_menu.png'),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      onTap: () => {_scaffoldKey.currentState.openDrawer()},
                    ),
                  ),
                  title: new Row(children: <Widget>[
                    GestureDetector(
                        onTap: () {
                          Route route = MaterialPageRoute(
                              builder: (context) => DashboardPage());
                          Navigator.push(context, route);
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
                    // Text('Movies',
                    //     style:
                    //         TextStyle(fontSize: 16, color: colors.appYellow)),

                    Expanded(child: Text('')),
                    Padding(
                        padding: EdgeInsets.only(
                          top: 20.0,
                          right: 20.0,
                          bottom: 20.0,
                        ),
                        child: AnimatedContainer(
                            duration: Duration(milliseconds: 400),
                            width: _folded ? 50 : layoutDecide ? 100.0: 200.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(32),
                                color: Colors.transparent,
                                border: Border.all(
                                  width: 2.0,
                                  color: Colors.white,
                                )),
                            child: Row(children: [
                              Expanded(
                                child: Container(
                                    padding: EdgeInsets.only(left: 16.0),
                                    child: _folded
                                        ? TextField(
                                            decoration: InputDecoration(
                                                hintText: 'Search',
                                                hintStyle: TextStyle(
                                                    color: Color.fromRGBO(
                                                        233, 233, 233, 1.0)),
                                                border: InputBorder.none),
                                          )
                                        : null),
                              ),
                              AnimatedContainer(
                                child: InkWell(
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 10.0),
                                    child: Icon(Icons.search,
                                        size: 22.0,
                                        color:
                                            Color.fromRGBO(233, 233, 233, 1.0)),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      _folded = !_folded;
                                    });
                                  },
                                ),
                                duration: Duration(milliseconds: 400),
                              ),
                            ]))),

                    /* InkWell(
                      child: Icon(
                        Icons.search_outlined,
                        color: Colors.white,
                        size: 30.0,
                      ),
                      onTap: () {
                        Route route = MaterialPageRoute(
                            builder: (context) => FilterPage());
                        Navigator.push(context, route);
                      },
                    ),

                    */
                  ]),
                  backgroundColor: Colors.transparent,
                  elevation: 0.0,
                ),
                drawer: Drawer(
                  child: Container(
                    width: widthSize,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Color(0xFF070B0D), Color(0xFF19272F)])),
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: ListView(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                      children: <Widget>[
                          ListTile(
                    title: Text(
                      'Contact Us',
                      style: TextStyle(
                        color: colors.appYellow,
                      ),
                    ),
                    onTap: () {
                      // Navigator.pop(context);
                      // Route route = MaterialPageRoute(
                      //     builder: (context) => ContactUsPage());
                      // Navigator.push(context, route);
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
                        // ListTile(
                        //   title: Text('Item 2'),
                        //   onTap: () {
                        //     Navigator.pop(context);
                        //   },
                        // ),
                        SizedBox(height: 15,),
                  Center(
                        child:InkWell(
                        child:Container(
                          alignment: Alignment.center,
                          width:200.0,
                          child:Text("Logout", textDirection: TextDirection.ltr, textAlign: TextAlign.center, style:theme.applyfilter),
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color:Color.fromRGBO(226, 186, 31, 1.0)
                          ),
                        ),
                        onTap: ()=>{ CommonUtils.logout(context)
                        },
                      ),
                      ),
                        // RaisedButton(
                        //   child: const Text('Logout'),
                        //   color: colors.appYellow,
                        //   onPressed: () {
                        //     CommonUtils.logout(context);
                        //     // Route route = MaterialPageRoute(
                        //     //     builder: (context) => LoginPage());
                        //     // Navigator.pushReplacement(context, route);
                        //   },
                        // )
                      ],
                    ),
                  ),
                ),
                body: Center(
                    child: Container(
                        width: widthSize, child: contactUs(context, bloc))))));
  }
}
