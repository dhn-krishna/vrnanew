import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:vrna_app_mobile/src/values/devicescreen.dart';
// import 'package:vrna_app_mobile/src/blocs/auth.bloc.dart';
import 'package:vrna_app_mobile/src/widgets/button.dart';
import 'package:vrna_app_mobile/src/widgets/edit_text.dart';
import 'package:vrna_app_mobile/src/widgets/text.dart';
import 'package:vrna_app_mobile/src/widgets/themeTV.dart';
import 'package:vrna_app_mobile/src/widgets/logo.dart';
import 'package:vrna_app_mobile/src/pages/termsconditions/termscondition.page.dart';
import 'package:vrna_app_mobile/src/values/colors.dart' as colors;
import 'package:vrna_app_mobile/src/values/dimens.dart' as dimens;
import 'package:vrna_app_mobile/src/widgets/themeTV.dart';
import '../../widgets/theme.dart' as customTheme;

class TermsConditionWidget {
  Widget TermsCondition(BuildContext context) {
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
                SizedBox(height: size.height * 0.01),
                Text('VRNA Terms of Use',
                    style: theme.termsheading, textAlign: TextAlign.left),
                SizedBox(height: 20.0),
                Text(
                    'VRNA Mediaworks., (“SEL”, “we”, “our”, “us”) provides you with a subscription service which allows you to watch a range of diversified video and other content and services as provided, which are streamed over the internet on web enabled devices. Please read these Terms of Use along with our Privacy Policy, and all other rules and policies related to our service including any rules of usage provisions provided for any specific product or service offered by us.',
                    style: theme.termscontent,
                    textAlign: TextAlign.left),
                SizedBox(height: 10.0),
                Text(
                    'These Terms of Use govern your use of our service. As used in this Terms of Use, “Service” is the personalized service provided by us for recommending, reviewing, discovering and watching, using interfaces, including all the service features and functionalities, including the content as provided with our service.',
                    style: theme.termscontent,
                    textAlign: TextAlign.left),
                SizedBox(height: 20.0),
                Text('1. Geography',
                    style: theme.termsheadingsub, textAlign: TextAlign.left),
                SizedBox(height: 10.0),
                Text(
                    'The services offered to you will be based on your geographic location, and you may not employ any technology to obscure or disguise your location. The content offered to you may also vary from time to time and as per your location. This will be primarily basis the geography that you have subscribed our services for, and established your account in.',
                    style: theme.termscontent,
                    textAlign: TextAlign.left),
                SizedBox(height: 20.0),
                Text('2. Compatible Devices',
                    style: theme.termsheadingsub, textAlign: TextAlign.left),
                SizedBox(height: 10.0),
                Text(
                    'Our services can be available across various devices, platforms which have been approved by us from time to time. Subject to compatibility, you may be able to access the services through handheld devices, and other IP based connected devices or any other compatible system.[All web browsers, mobile browsers, android, IOS, Roku, FireTV, Apple TV, all other smart phones, smart TV devices and any other smart device that may come up in the future.] Note that we may change or update the requirements for compatibility from time to time. The compatibility of such device will then depend on the software or systems provided and maintained by such manufacturer, or other parties. In such extreme scenarios, a device which might be compatible with our services might cease to be compatible at a later point of time.',
                    style: theme.termscontent,
                    textAlign: TextAlign.left),
                SizedBox(height: 20.0),
                Text('3. Service',
                    style: theme.termsheadingsub, textAlign: TextAlign.left),
                SizedBox(height: 10.0),
                Text(
                    '3.1 In order to avail our services and become a member, you must be 18 years of age, or the age of majority in your territory or country. Our services may be used by a minor only under the strict supervision, guidance and control of an adult.',
                    style: theme.termscontent,
                    textAlign: TextAlign.left),
                SizedBox(height: 10.0),
                Text(
                    '3.2 Viewing of content on our platform is only for your personal and non-commercial use and should not be shared with individuals otherwise. During your use of our services we grant you a limited, non-exclusive, non-transferable right to access our service and view our content. Except for what has been specifically provided for herein, no right, title, or interest shall be transferred to you. You also agree not to use the service for public performances.',
                    style: theme.termscontent,
                    textAlign: TextAlign.left),
                SizedBox(height: 10.0),
                Text(
                    '3.3 Our services, including our content library are regularly updated. You will have access to such content depending on the subscription plan that you have signed up for. In addition, you will from time to time have access to limited content even without subscribing to our services basis your geographic location. You can manage your subscription from the View Plans tab available in the “Me” section.',
                    style: theme.termscontent,
                    textAlign: TextAlign.left),
                SizedBox(height: 10.0),
                Text(
                    '3.4 You agree to use all our services, in accordance with the applicable laws, rules and regulations,or other restrictions applicable on use of the service or content therein. You further agree not to reproduce, distribute, modify, display, perform, archive, publish, license, create derivative works from, offer for sale, or use (except as expressly authorized under these Terms of Use) any content and information contained on or obtained through our service. You also agree not to: circumvent,remove, degrade, deactivate or thwart any of the contents of our service; use any robot, spider, scraper or other means to access our service. You also agree not to decompile, reverse engineer,and disassemble any software or other products or processes accessible through our service. You further agree not to insert any code or product or manipulate the content of our service in any way; or use any data mining, data gathering or extraction method. Additionally, you agree not to upload, post, e-mail or otherwise send or transmit any material designed to interrupt, destroy or limit the functionality of our service. We may terminate or restrict your use of our service if you violate these Terms of Use or engage in any illegal or fraudulent use of our service.',
                    style: theme.termscontent,
                    textAlign: TextAlign.left),
                SizedBox(height: 10.0),
                Text(
                    '3.5 The playback resolution or quality of the content of our service will depend on a number of factors, including the type of compatible device that you are using to access the service from, and your bandwidth, which may vary during your course of viewing. If we detect that the content you are streaming from our platform is being interrupted or otherwise does not play as intended due to bandwidth issues, we may decrease the resolution and file size of the streamed content in an effort to provide you with uninterrupted viewing experience.',
                    style: theme.termscontent,
                    textAlign: TextAlign.left),
                SizedBox(height: 10.0),
                Text(
                    '3.6 Any use of the information you provide to us is subject to your understanding and acceptance of our Privacy Policy.',
                    style: theme.termscontent,
                    textAlign: TextAlign.left),
                SizedBox(height: 10.0),
                Text(
                    '3.7 To find more information about our service and its features or if you need assistance with your account, please read the Frequently Asked Questions (FAQ) section and for further assistance kindly Contact Us on the details available on this website/application.',
                    style: theme.termscontent,
                    textAlign: TextAlign.left),
                SizedBox(height: 10.0),
                Text(
                    '3.8 We will send you information pertaining to your account (e.g. payment authorizations, payment method, subscription plans, and notices) in electronic form only, for example via e-mails to your registered e-mail address as per our records.',
                    style: theme.termscontent,
                    textAlign: TextAlign.left),
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
  // static const IconData share_outlined =
  //     IconData(0xe412, fontFamily: 'MaterialIcons');

  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var device = getDeviceType(mediaQuery);
    customTheme.Theme theme = customTheme.Theme.getTheme(device);
    Size size = MediaQuery.of(context).size;
    return Container(
        width: size.width * 1.0,
        //height: size.height * 0.25,
        child: Padding(
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Image.asset(
                      "assets/backarrow.png",
                      width: 40.0,
                    )),
                Expanded(
                    child: Center(
                  child: Text('Termsof Use',
                      style: theme.termsappbarheading,
                      textAlign: TextAlign.center),
                )),
              ]),
        ));
  }
}
