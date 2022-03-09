import 'package:flutter/material.dart';
import 'package:vrna_app_mobile/src/blocs/auth.bloc.dart';
import 'package:vrna_app_mobile/src/blocs/contactus.bloc.dart';
import 'package:vrna_app_mobile/src/pages/dashboard/dashboard.page.dart';
import 'package:vrna_app_mobile/src/values/theme.dart';
import 'package:vrna_app_mobile/src/widgets/button.dart';
import 'package:vrna_app_mobile/src/values/devicescreen.dart';
import 'package:vrna_app_mobile/src/widgets/edit_text.dart';
import 'package:vrna_app_mobile/src/widgets/logo.dart';
import 'package:vrna_app_mobile/src/values/dimens.dart' as dimens;
import '../../widgets/theme.dart' as customTheme;

class ContactUsWidget {
  Widget contactUs(BuildContext context, ContactUsBloc bloc) {        
    var mediaQuery = MediaQuery.of(context);
    
    bool layoutDecide = MediaQuery.of(context).size.width < 1024;
    var device = getDeviceType(mediaQuery);
    customTheme.Theme theme = customTheme.Theme.getTheme(device);
    Size size = MediaQuery.of(context).size;
    return ListView(
      scrollDirection:Axis.vertical,
      children: <Widget>[
         Padding(
      padding: EdgeInsets.all(dimens.margin),


child:Flex(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.start,
direction: layoutDecide ?
Axis.vertical : Axis.horizontal,

  children: <Widget>[   
    Container( 
      padding: EdgeInsets.only(right:50.0),
      width:layoutDecide ? mediaQuery.size.width : mediaQuery.size.width * 0.50,
      child:layoutDecide ? Text("") : Image.asset("assets/loginbg.png", height: MediaQuery.of(context).size.height-135.0, fit: BoxFit.cover,),
       
    ),
       Container(
      width:layoutDecide ? mediaQuery.size.width : mediaQuery.size.width * 0.44,
         
           
           
           child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: size.height * 0.07),
          Logo(),
          SizedBox(height: size.height * 0.07),
          EditText(
            placeholder: "Name *",
            value: bloc.username,
            onChange: (value) => bloc.setName(value),
            // prefixIcon: Icons.email_sharp,
            keyboardType: TextInputType.text,
          ),
          SizedBox(height: size.height * 0.02),
          EditText(
            placeholder: "Email *",
            value: bloc.email,
            onChange: (value) => bloc.setEmail(value),
            // prefixIcon: Icons.email_sharp,
            keyboardType: TextInputType.text,
          ),
          SizedBox(height: size.height * 0.02),
          EditText(
            placeholder: "Category *",
            value: bloc.category,
            onChange: (value) => bloc.setCategory(value),
            // prefixIcon: Icons.email_sharp,
            keyboardType: TextInputType.text,
          ),
          SizedBox(height: size.height * 0.02),
          EditText(
            placeholder: "Message *",
            value: bloc.message,
            onChange: (value) => bloc.setMessage(value),
            // prefixIcon: Icons.email_sharp,
            keyboardType: TextInputType.text,
          ),
          SizedBox(height: size.height * 0.04),
          InkWell(
            child: Container(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              width: MediaQuery.of(context).size.width,
              color: Color.fromRGBO(225, 185, 36, 1.0),
              child: Text(
                "SUBMIT".toUpperCase(),
                textAlign: TextAlign.center,
                style: theme.buttontext,
              ),
            ),
            onTap: () => {
              bloc.raiseSupportTicket(context)
            },
          ), 
          SizedBox(height: size.height * 0.02),
        ],
      ),
      
      
      
       
       
       
       
       )


],

),













    )
    ]
    
    
    
    );
  }
}

class TopMenu extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        width: size.width * 0.99,
        //height: size.height * 0.25,
        child: Padding(
          padding: EdgeInsets.only(left: 4.0, right: 10.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Padding(
              padding: EdgeInsets.only(left: 0.0),
              child: Icon(
                Icons.keyboard_backspace,
                color: Colors.white,
                size: 30.0,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Text('Contact Us',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0),
            ),
          ]),
        ));
  }
}
