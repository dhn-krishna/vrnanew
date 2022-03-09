import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:vrna_app_mobile/src/widgets/accordion.dart';
import 'package:vrna_app_mobile/src/blocs/profile.bloc.dart';
import 'package:vrna_app_mobile/src/widgets/button.dart';
import 'package:vrna_app_mobile/src/widgets/edit_text.dart';
import 'package:vrna_app_mobile/src/widgets/text.dart';
import 'package:vrna_app_mobile/src/widgets/logo.dart';
import 'package:vrna_app_mobile/src/pages/profile/profile.page.dart';
import 'package:vrna_app_mobile/src/values/colors.dart' as colors;
import 'package:vrna_app_mobile/src/values/dimens.dart' as dimens;
import 'package:provider/provider.dart';

class ProfileWidget {
  Widget Profile(BuildContext context, ProfileBloc bloc) {
    Size size = MediaQuery.of(context).size;
    return Stack(children: [
      Container(
        margin: EdgeInsets.only(top: 100),
        child: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.all(0.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                PersonalInformation(),
                AddressDetails(),
                CardsDetails()
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
    Size size = MediaQuery.of(context).size;
    return Container(
        width: size.width * 0.99,
        //height: size.height * 0.25,
        child: Padding(
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Icon(
                    Icons.keyboard_backspace,
                    color: Colors.white,
                    size: 30.0,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Center(
                      child: Text('Profile',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center)),
                ),
              ]),
        ));
  }
}

class PersonalInformation extends StatefulWidget {
  @override
  _PersonalInformationState createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {
  ProfileBloc bloc;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    bloc = Provider.of<ProfileBloc>(context);
    bloc.getProfile(context);
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  bool _showContent = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      margin: EdgeInsets.all(10),
      color: Colors.transparent,
      child: Column(children: [
        ListTile(
          title: Text(
            'Personal Information',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          trailing: IconButton(
            icon: Icon(
                _showContent ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                color: Colors.white),
            onPressed: () {
              setState(() {
                _showContent = !_showContent;
              });
            },
          ),
        ),
        _showContent
            ? Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                child: Column(
                  children: <Widget>[
                    EditText(
                      placeholder: "First name",
                      value: bloc.firstName,
                      onChange: (value) => bloc.setFirstName(value),
                      // prefixIcon: Icons.email_sharp,
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(height: size.height * 0.02),
                    EditText(
                      placeholder: "Middle name",
                      value: bloc.middleName,
                      onChange: (value) => bloc.setMiddleName(value),
                      // prefixIcon: Icons.call,
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(height: size.height * 0.02),
                    EditText(
                      placeholder: "Last name",
                      value: bloc.lastName,
                      onChange: (value) => bloc.setLastName(value),
                      // prefixIcon: Icons.call,
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(height: size.height * 0.02),
                    EditText(
                      placeholder: "Gender",
                      value: bloc.gender,
                      onChange: (value) => bloc.setGender(value),
                      // prefixIcon: Icons.call,
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(height: size.height * 0.02),
                    EditText(
                      placeholder: "Date of Birth",
                      value: bloc.dob,
                      onChange: (value) => bloc.setDob(value),
                      // prefixIcon: Icons.call,
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(height: size.height * 0.02),
                    EditText(
                      placeholder: "Nationality",
                      value: bloc.nationality,
                      onChange: (value) => bloc.setNationality(value),
                      // prefixIcon: Icons.call,
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(height: size.height * 0.04),
                    CustomButton(
                        label: "Update",
                        onPress: () => bloc.updatePersonalInfo(context),
                        width: size.width * 0.9,
                        height: size.height * 0.07),
                  ],
                ))
            : Container()
      ]),
    );
  }
}

class AddressDetails extends StatefulWidget {
  @override
  _AddressDetailsState createState() => _AddressDetailsState();
}

class _AddressDetailsState extends State<AddressDetails> {
  bool _showContent = false;
  ProfileBloc bloc;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    bloc = Provider.of<ProfileBloc>(context);
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      color: Colors.transparent,
      margin: EdgeInsets.all(10),
      child: Column(children: [
        ListTile(
          title: Text(
            'Manage address',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          trailing: IconButton(
            icon: Icon(
                _showContent ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                color: Colors.white),
            onPressed: () {
              setState(() {
                _showContent = !_showContent;
              });
            },
          ),
        ),
        _showContent
            ? Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                child: Column(
                  children: <Widget>[
                    EditText(
                      placeholder: "Address line1",
                      value: bloc.addressLine1,
                      onChange: (value) => bloc.setAddressLine1(value),
                      // prefixIcon: Icons.email_sharp,
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(height: size.height * 0.02),
                    EditText(
                      placeholder: "Address line2",
                      value: bloc.addressLine2,
                      onChange: (value) => bloc.setAddressLine2(value),
                      // prefixIcon: Icons.email_sharp,
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(height: size.height * 0.02),
                    EditText(
                      placeholder: "Area",
                      value: bloc.area,
                      onChange: (value) => bloc.setArea(value),
                      // prefixIcon: Icons.email_sharp,
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(height: size.height * 0.02),
                    EditText(
                      placeholder: "State",
                      value: bloc.stateData,
                      onChange: (value) => bloc.setStateData(value),
                      // prefixIcon: Icons.email_sharp,
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(height: size.height * 0.02),
                    EditText(
                      placeholder: "Country",
                      value: bloc.country,
                      onChange: (value) => bloc.setCountry(value),
                      // prefixIcon: Icons.email_sharp,
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(height: size.height * 0.02),
                    EditText(
                      placeholder: "Postal code",
                      value: bloc.pinCode,
                      onChange: (value) => bloc.setPinCode(value),
                      // prefixIcon: Icons.email_sharp,
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(height: size.height * 0.04),
                    CustomButton(
                        label: "Update",
                        onPress: () => bloc.updateAddress(context),
                        width: size.width * 0.9,
                        height: size.height * 0.07),
                  ],
                ))
            : Container()
      ]),
    );
  }
}

class CardsDetails extends StatefulWidget {
  @override
  _CardsDetailsState createState() => _CardsDetailsState();
}

class _CardsDetailsState extends State<CardsDetails> {
  bool _showContent = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(children: [
        ListTile(
          title: Text('Saved Cards'),
          trailing: IconButton(
            icon: Icon(
                _showContent ? Icons.arrow_drop_up : Icons.arrow_drop_down),
            onPressed: () {
              setState(() {
                _showContent = !_showContent;
              });
            },
          ),
        ),
        _showContent
            ? Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                child: Column(
                  children: <Widget>[
                    EditText(
                      placeholder: "Email",
                      // value: bloc.email,
                      //onChange: (value) => bloc.setEmail(value),
                      prefixIcon: Icons.email_sharp,
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(height: size.height * 0.02),
                    EditText(
                      placeholder: "Phone",
                      //value: bloc.phone,
                      //onChange: (value) => bloc.setPhone(value),
                      prefixIcon: Icons.call,
                      keyboardType: TextInputType.text,
                    ),
                  ],
                ))
            : Container()
      ]),
    );
  }
}

class PersonalInformation1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          EditText(
            placeholder: "Email",
            // value: bloc.email,
            //onChange: (value) => bloc.setEmail(value),
            prefixIcon: Icons.email_sharp,
            keyboardType: TextInputType.text,
          ),
          SizedBox(height: size.height * 0.02),
          EditText(
            placeholder: "Phone",
            //value: bloc.phone,
            //onChange: (value) => bloc.setPhone(value),
            prefixIcon: Icons.call,
            keyboardType: TextInputType.text,
          ),
        ]);
  }
}
