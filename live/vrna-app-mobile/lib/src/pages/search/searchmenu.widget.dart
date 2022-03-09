// import 'package:flutter/material.dart';
// import 'package:vrna_app_mobile/src/values/devicescreen.dart';
// import '../../widgets/theme.dart' as customTheme;

// class SearchMenu extends StatefulWidget {
//   @override
//   _searchmenuState createState() => _searchmenuState();
// }

// class _searchmenuState extends State<SearchMenu> {
//   @override
//   Widget build(BuildContext context) {
//     var mediaQuery = MediaQuery.of(context);
//     var device = getDeviceType(mediaQuery);
//     double widthSize = MediaQuery.of(context).size.width * 1.0;
//     bool layoutDecide = MediaQuery.of(context).size.width < 1024;
//     customTheme.Theme theme = customTheme.Theme.getTheme(device);
//     return Drawer(
//         child: Container(
//       width: widthSize,
//       decoration: BoxDecoration(
//         color: Color.fromRGBO(11, 23, 28, 1.0),
//         /*gradient: LinearGradient(
//                           begin: Alignment.topCenter,
//                           end: Alignment.bottomCenter,
//                           colors: [Color(0xFF070B0D), Color(0xFF19272F)])*/
//       ),
//       padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
//       child: ListView(
//         padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
//         children: <Widget>[
//           AnimatedContainer(
//               duration: Duration(milliseconds: 400),
//               height: 50.0,
//               color: Color.fromRGBO(18, 32, 39, 1.0),
//               /*decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(32),
                               
//                                 border: Border.all(
//                                   width: 2.0,
//                                   color: Colors.white,
//                                 ),
                               
                               
//                                 ),*/
//               child: Row(children: [
//                 Expanded(
//                   child: Container(
//                       padding: EdgeInsets.only(left: 16.0),
//                       child: TextField(
//                         style: TextStyle(
//                             color: Color.fromRGBO(233, 233, 233, 1.0)),
//                         decoration: InputDecoration(
//                             hintText: 'Search',
//                             hintStyle: TextStyle(
//                                 color: Color.fromRGBO(233, 233, 233, 1.0)),
//                             border: InputBorder.none),
//                       )),
//                 ),
//                 AnimatedContainer(
//                   child: InkWell(
//                     child: Padding(
//                       padding: EdgeInsets.only(right: 10.0),
//                       child: Icon(Icons.search,
//                           size: 22.0,
//                           color: Color.fromRGBO(233, 233, 233, 1.0)),
//                     ),
//                     onTap: () {},
//                   ),
//                   duration: Duration(milliseconds: 400),
//                 ),
//               ])),
//           Container(
//               alignment: Alignment.topLeft,
//               padding: EdgeInsets.only(
//                 left: 20.0,
//                 right: 20.0,
//                 top: 15.0,
//                 bottom: 15.0,
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Main Menu",
//                     style: theme.mainmenu,
//                   ),
//                   SizedBox(height: 15.0),
//                   Divider(
//                     color: Color.fromRGBO(24, 28, 39, 1.0),
//                     height: 2.0,
//                   ),
//                   SizedBox(height: 15.0),
//                   Text(
//                     "Home",
//                     style: theme.submenu,
//                   ),
//                   SizedBox(height: 15.0),
//                   Text(
//                     "Movies",
//                     style: theme.submenu,
//                   ),
//                   SizedBox(height: 15.0),
//                   Text(
//                     "TV Show",
//                     style: theme.submenu,
//                   ),
//                   SizedBox(height: 15.0),
//                   Text(
//                     "Theatores",
//                     style: theme.submenu,
//                   ),
//                   SizedBox(height: 15.0),
//                   Text(
//                     "Actors",
//                     style: theme.submenu,
//                   ),
//                   SizedBox(height: 32.0),

//                   Text(
//                     "Trending",
//                     style: theme.mainmenu,
//                   ),
//                   SizedBox(height: 10.0),
//                   Divider(
//                     color: Color.fromRGBO(24, 28, 39, 1.0),
//                     height: 2.0,
//                   ),

//                   SizedBox(height: 15.0),

//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Expanded(
//                         child: Text(
//                           "Top Movies",
//                           style: theme.submenu,
//                         ),
//                       ),
//                       Container(
//                         margin: EdgeInsets.only(left: 10.0),
//                         alignment: Alignment.center,
//                         padding: EdgeInsets.only(
//                           top: 5.0,
//                           right: 7.0,
//                           bottom: 5.0,
//                           left: 7.0,
//                         ),
//                         decoration: BoxDecoration(
//                           color: Colors.black,
//                           borderRadius: BorderRadius.circular(10.0),
//                         ),
//                         child: Text(
//                           "2142",
//                           style: theme.submenuwhite,
//                         ),
//                       )
//                     ],
//                   ),

//                   SizedBox(height: 15.0),

//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Expanded(
//                         child: Text(
//                           "Latest Movies",
//                           style: theme.submenu,
//                         ),
//                       ),
//                       Container(
//                         margin: EdgeInsets.only(left: 10.0),
//                         alignment: Alignment.center,
//                         padding: EdgeInsets.only(
//                           top: 5.0,
//                           right: 7.0,
//                           bottom: 5.0,
//                           left: 7.0,
//                         ),
//                         decoration: BoxDecoration(
//                           color: Colors.black,
//                           borderRadius: BorderRadius.circular(10.0),
//                         ),
//                         child: Text(
//                           "91",
//                           style: theme.submenuwhite,
//                         ),
//                       )
//                     ],
//                   ),

//                   SizedBox(height: 15.0),

//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Expanded(
//                         child: Text(
//                           "Featured Movies",
//                           style: theme.submenu,
//                         ),
//                       ),
//                       Container(
//                         margin: EdgeInsets.only(left: 10.0),
//                         alignment: Alignment.center,
//                         padding: EdgeInsets.only(
//                           top: 5.0,
//                           right: 7.0,
//                           bottom: 5.0,
//                           left: 7.0,
//                         ),
//                         decoration: BoxDecoration(
//                           color: Colors.black,
//                           borderRadius: BorderRadius.circular(10.0),
//                         ),
//                         child: Text(
//                           "128",
//                           style: theme.submenuwhite,
//                         ),
//                       )
//                     ],
//                   ),

//                   SizedBox(height: 15.0),

//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Expanded(
//                         child: Text(
//                           "Top TV Shows",
//                           style: theme.submenu,
//                         ),
//                       ),
//                       Container(
//                         margin: EdgeInsets.only(left: 10.0),
//                         alignment: Alignment.center,
//                         padding: EdgeInsets.only(
//                           top: 5.0,
//                           right: 7.0,
//                           bottom: 5.0,
//                           left: 7.0,
//                         ),
//                         decoration: BoxDecoration(
//                           color: Colors.black,
//                           borderRadius: BorderRadius.circular(10.0),
//                         ),
//                         child: Text(
//                           "46",
//                           style: theme.submenuwhite,
//                         ),
//                       )
//                     ],
//                   ),

//                   SizedBox(height: 15.0),

//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Expanded(
//                         child: Text(
//                           "Top Theatre Shows",
//                           style: theme.submenu,
//                         ),
//                       ),
//                       Container(
//                         margin: EdgeInsets.only(left: 10.0),
//                         alignment: Alignment.center,
//                         padding: EdgeInsets.only(
//                           top: 5.0,
//                           right: 7.0,
//                           bottom: 5.0,
//                           left: 7.0,
//                         ),
//                         decoration: BoxDecoration(
//                           color: Colors.black,
//                           borderRadius: BorderRadius.circular(10.0),
//                         ),
//                         child: Text(
//                           "10",
//                           style: theme.submenuwhite,
//                         ),
//                       )
//                     ],
//                   ),

//                   SizedBox(height: 32.0),

//                   Text(
//                     "My Interest",
//                     style: theme.mainmenu,
//                   ),
//                   SizedBox(height: 10.0),
//                   Divider(
//                     color: Color.fromRGBO(24, 28, 39, 1.0),
//                     height: 2.0,
//                   ),
//                   SizedBox(height: 15.0),

//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Expanded(
//                         child: Text(
//                           "Favorites",
//                           style: theme.submenu,
//                         ),
//                       ),
//                       Container(
//                         margin: EdgeInsets.only(left: 10.0),
//                         alignment: Alignment.center,
//                         padding: EdgeInsets.only(
//                           top: 5.0,
//                           right: 7.0,
//                           bottom: 5.0,
//                           left: 7.0,
//                         ),
//                         decoration: BoxDecoration(
//                           color: Color.fromRGBO(226, 186, 31, 1.0),
//                           borderRadius: BorderRadius.circular(10.0),
//                         ),
//                         child: Text(
//                           "1",
//                           style: theme.submenublack,
//                         ),
//                       )
//                     ],
//                   ),
//                   SizedBox(height: 32.0),

//                   Text(
//                     "Support",
//                     style: theme.mainmenu,
//                   ),
//                   SizedBox(height: 15.0),
//                   Divider(
//                     color: Color.fromRGBO(24, 28, 39, 1.0),
//                     height: 2.0,
//                   ),
//                   SizedBox(height: 15.0),
//                   Text(
//                     "Reach Us",
//                     style: theme.submenu,
//                   ),
//                   SizedBox(height: 15.0),
//                   Text(
//                     "Terms of Services",
//                     style: theme.submenu,
//                   ),
//                   SizedBox(height: 15.0),
//                   Text(
//                     "Privacy Policy",
//                     style: theme.submenu,
//                   ),
//                   SizedBox(height: 32.0),

//                   SizedBox(height: 32.0),
//                   Text(
//                     "Settings",
//                     style: theme.mainmenu,
//                   ),
//                   SizedBox(height: 15.0),
//                   Divider(
//                     color: Color.fromRGBO(24, 28, 39, 1.0),
//                     height: 2.0,
//                   ),
//                   SizedBox(height: 15.0),
//                   Text(
//                     "Language",
//                     style: theme.submenu,
//                   ),
//                   SizedBox(height: 15.0),
//                   Text(
//                     "Preferences",
//                     style: theme.submenu,
//                   ),
//                   SizedBox(height: 15.0),

//                   ListTile(
//                     title: Text(
//                       'Contact Us',
//                       style: TextStyle(
//                         color: Colors.grey,
//                       ),
//                     ),
//                     onTap: () {
//                       Navigator.pop(context);
//                       Route route = MaterialPageRoute(
//                           builder: (context) => ContactUsPage());
//                       Navigator.push(context, route);
//                     },
//                   ),
//                   ListTile(
//                     title: Text(
//                       'Profile',
//                       style: TextStyle(
//                         color: Colors.grey,
//                       ),
//                     ),
//                     onTap: () {
//                       Navigator.pop(context);
//                       Route route = MaterialPageRoute(
//                           builder: (context) => ProfilePage());
//                       Navigator.push(context, route);
//                     },
//                   ),
//                   ListTile(
//                     title: Text(
//                       'Actor Details',
//                       style: TextStyle(
//                         color: Colors.grey,
//                       ),
//                     ),
//                     onTap: () {
//                       Navigator.pop(context);
//                       Route route = MaterialPageRoute(
//                           builder: (context) => ActorDetailsPage());
//                       Navigator.push(context, route);
//                     },
//                   ),
//                   ListTile(
//                     title: Text(
//                       'Search',
//                       style: TextStyle(
//                         color: Colors.grey,
//                       ),
//                     ),
//                     onTap: () {
//                       Navigator.pop(context);
//                       Route route =
//                           MaterialPageRoute(builder: (context) => SearchPage());
//                       Navigator.push(context, route);
//                     },
//                   ),
//                   // ListTile(
//                   //   title: Text('Item 2'),
//                   //   onTap: () {
//                   //     Navigator.pop(context);
//                   //   },
//                   // ),

//                   Center(
//                     child: InkWell(
//                       child: Container(
//                         alignment: Alignment.center,
//                         width: 200.0,
//                         child: Text("Logout",
//                             textDirection: TextDirection.ltr,
//                             textAlign: TextAlign.center,
//                             style: theme.logout),
//                         padding: EdgeInsets.all(10.0),
//                         decoration: BoxDecoration(
//                             border: Border.all(
//                           width: 2.0,
//                           color: Color.fromRGBO(149, 182, 199, 1.0),
//                         )),
//                       ),
//                       onTap: () => {
//                         print("Logout Clicked")
//                         /*
//                           Route route = MaterialPageRoute(
//                               builder: (context) => LoginPage());
//                           Navigator.pushReplacement(context, route);                      
// */
//                       },
//                     ),
//                   )
//                 ],
//               )),

// /*
//                       RaisedButton(
//                         child: const Text('Logout'),
//                         color: colors.appYellow,
//                         onPressed: () {
//                           Route route = MaterialPageRoute(
//                               builder: (context) => LoginPage());
//                           Navigator.pushReplacement(context, route);
//                         },
//                       )*/
//         ],
//       ),
//     ));
//   }
// }
