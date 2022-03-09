import 'package:flutter/material.dart';
// import 'package:vrna_app_mobile/src/blocs/auth.bloc.dart';
import 'package:vrna_app_mobile/src/widgets/loading.dart';
import 'package:vrna_app_mobile/src/pages/dashboard/dashboard.widget.dart';
import 'package:vrna_app_mobile/src/widgets/background.dart';
import 'package:vrna_app_mobile/src/values/colors.dart' as colors;
import 'package:vrna_app_mobile/src/pages/filter/filter.page.dart';
import 'package:vrna_app_mobile/src/pages/contactus/contactus.page.dart';
import 'package:provider/provider.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> with DashboardWidget {
  // AuthBloc bloc;

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   bloc = Provider.of<AuthBloc>(context);
  // }

  // @override
  // void dispose() {
  //   bloc.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Background(
        child: Loading(
            message: "Loading ...",
            // status: bloc.loading,
            child: Scaffold(
                appBar: new AppBar(
                  title: new Row(children: <Widget>[
                    Text('VRNA',
                        style:
                            TextStyle(fontSize: 16, color: colors.appYellow)),
                    Padding(
                      padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                    ),
                    Text('Movies',
                        style:
                            TextStyle(fontSize: 16, color: colors.appYellow)),
                    Padding(
                      padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                    ),
                    Text('TV Shows',
                        style:
                            TextStyle(fontSize: 16, color: colors.appYellow)),
                    Padding(
                      padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                    ),
                    InkWell(
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
                  ]),
                  backgroundColor: Colors.transparent,
                  elevation: 0.0,
                ),
                drawer: Drawer(
                    child: Container(
                  decoration: BoxDecoration(
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
                          'contact Us',
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
                        title: Text('Item 2'),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      RaisedButton(
                        child: const Text('Logout'),
                        onPressed: () {},
                      )
                    ],
                  ),
                )),
                body: Container(child: dashboard(context)))));
  }
}
