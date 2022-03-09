import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:vrna_app_mobile/src/values/devicescreen.dart';
import '../../widgets/theme.dart' as customTheme;

class PrivacyPolicyWidget {
  Widget PrivacyPolicy(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var device = getDeviceType(mediaQuery);
    customTheme.Theme theme = customTheme.Theme.getTheme(device);
    Size size = MediaQuery.of(context).size;
    return Stack(children: [
      Container(
        margin: EdgeInsets.only(top: 100),
        child: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.only(left: 30.0, right: 30.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('VRNA Privacy Policy',
                    style: theme.termsheading, textAlign: TextAlign.left),
                SizedBox(height: 20.0),
                Text(
                    'This Privacy Policy entails the details of our collection, use and disclosure of information, including your personal information, within VRNA Mediaworks.',
                    style: theme.termscontent,
                    textAlign: TextAlign.left),
                SizedBox(height: 10.0),
                Text(
                    'This Policy specifically governs the usage of information collected by us from our users of the VRNA Mediaworks “Platform” and any associated mobile sites, applications, and/or any other services provided by us on the website, which can be accessed thereof. This Policy should be read in conjunction and together with the Terms of Use available on the Platform.',
                    style: theme.termscontent,
                    textAlign: TextAlign.left),
                SizedBox(height: 10.0),
                Text(
                    'Your viewing or browsing of our content or your use of our services offered on our Platform is construed to mean that you consent to our collection, storage, processing of your Personal Information or Sensitive Personal Information or Information in accordance with this Privacy Policy and you consent to the terms and conditions of this Privacy Policy. You agree to be bound by the terms of this Privacy Policy.',
                    style: theme.termscontent,
                    textAlign: TextAlign.left),
                SizedBox(height: 20.0),
                Text('1. Collection of Information',
                    style: theme.termsheadingsub, textAlign: TextAlign.left),
                SizedBox(height: 10.0),
                Text('We receive and store information about you, such as:',
                    style: theme.termscontent, textAlign: TextAlign.left),
                SizedBox(height: 10.0),
                Text(
                    'Provided By You: The following are collected, as you provide us with:',
                    style: theme.termscontent,
                    textAlign: TextAlign.left),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    theme.bullet,
                    SizedBox(width: 5.0),
                    Expanded(
                      child: Text(
                        "Your name, e-mail address, address, postal code, inclusive of payment methods, and, telephone number. Certain other information like your choice to provide further information pertaining to preferences, account settings, reviews, ratings, or any other information provided to us through our service, or elsewhere.",
                        style: theme.termscontent,
                        textAlign: TextAlign.left,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10.0),
                Text(
                  "As Collected Automatically: The following are collected about you, your use of our service, the devices used to access our service [internet enabled compatible devices]. This information includes the following:",
                  style: theme.termscontent,
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    theme.bullet,
                    SizedBox(width: 5.0),
                    Expanded(
                      child: Text(
                        "Your activity on the Platform, which would include your search history, your search inputs, services or products viewed over the Platform, visits and the time stamps;",
                        style: theme.termscontent,
                        textAlign: TextAlign.left,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    theme.bullet,
                    SizedBox(width: 5.0),
                    Expanded(
                      child: Text(
                        "Device IDs and other unique identifiers like IP address, browser type, version, network service provider details;",
                        style: theme.termscontent,
                        textAlign: TextAlign.left,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    theme.bullet,
                    SizedBox(width: 5.0),
                    Expanded(
                      child: Text(
                        "Device and software characteristics including types and configurations, connection information, statistics on page views, URLs with time stamp;",
                        style: theme.termscontent,
                        textAlign: TextAlign.left,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    theme.bullet,
                    SizedBox(width: 5.0),
                    Expanded(
                      child: Text(
                        "Your interactions with our customer support via various sup port channels like e-mails, messages; Service support and transaction history;",
                        style: theme.termscontent,
                        textAlign: TextAlign.left,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    theme.bullet,
                    SizedBox(width: 5.0),
                    Expanded(
                      child: Text(
                        "Information collected by cookies, and other technologies, also including advertisement data, etc.",
                        style: theme.termscontent,
                        textAlign: TextAlign.left,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20.0),
                Text('2. Use of Information Collected by Us',
                    style: theme.termsheadingsub, textAlign: TextAlign.left),
                SizedBox(height: 10.0),
                Text(
                  "In order to provide you with the services of the Platform and offer you enhanced use of the features of our Platform. We use your information to:",
                  style: theme.termscontent,
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    theme.bullet,
                    SizedBox(width: 5.0),
                    Expanded(
                      child: Text(
                        "Process your registration, and provide you with your login account details;",
                        style: theme.termscontent,
                        textAlign: TextAlign.left,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    theme.bullet,
                    SizedBox(width: 5.0),
                    Expanded(
                      child: Text(
                        "Process your orders and payments in respect of our services;",
                        style: theme.termscontent,
                        textAlign: TextAlign.left,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    theme.bullet,
                    SizedBox(width: 5.0),
                    Expanded(
                      child: Text(
                        "Provide you with regional content, customized and personalized viewing options, recommendations on videos, movies, etc. which you may like to watch;",
                        style: theme.termscontent,
                        textAlign: TextAlign.left,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    theme.bullet,
                    SizedBox(width: 5.0),
                    Expanded(
                      child: Text(
                        "Perform analytics and customer research, to improve our service, including the user experience and the interface;",
                        style: theme.termscontent,
                        textAlign: TextAlign.left,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    theme.bullet,
                    SizedBox(width: 5.0),
                    Expanded(
                      child: Text(
                        "To offer you certain types of services, free trials, and other applicable offers based on your eligibility.",
                        style: theme.termscontent,
                        textAlign: TextAlign.left,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    theme.bullet,
                    SizedBox(width: 5.0),
                    Expanded(
                      child: Text(
                        "To offer you relevant contextual advertisements wherever applicable.",
                        style: theme.termscontent,
                        textAlign: TextAlign.left,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20.0),
                Text('3. Sharing and Disclosure of Information',
                    style: theme.termsheadingsub, textAlign: TextAlign.left),
                SizedBox(height: 10.0),
                Text(
                  "While the Platform is the recipient of your Personal Information or Sensitive Personal Information, we may allow access of this information to various 3rd parties with whom VRNA Mediaworks., has direct legal and confidentiality binding and such data shall stay with them only for limited purpose and period for the processing and storage of information, provision of account to you, provision of customer support, content development and delivery, and other purposes as identified in the Use of Information Collected By Us section to this Policy.",
                  style: theme.termscontent,
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 40.0),
              ]),
        )),
      ),
      Positioned(
        top: 40.0,
        child: TopMenu(),
      )
    ]);
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
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          child: Row(children: [
            Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: InkWell(
                  onTap: () {
                    if (Navigator.canPop(context)) Navigator.pop(context);
                  },
                  child: Image.asset(
                    "assets/backarrow.png",
                    width: 40.0,
                  )),
            ),
            Expanded(
                child: Center(
              child: Text('Privacy Policy',
                  style: theme.termsappbarheading, textAlign: TextAlign.center),
            )),
          ]),
        ));
  }
}
