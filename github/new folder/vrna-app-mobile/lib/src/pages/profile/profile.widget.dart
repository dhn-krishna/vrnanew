import 'package:flutter/material.dart' hide Card;
import 'package:flutter/rendering.dart';
import 'package:vrna_app_mobile/src/models/payment/Card.dart';
import 'package:vrna_app_mobile/src/values/devicescreen.dart';
import 'package:vrna_app_mobile/src/blocs/profile.bloc.dart';
import 'package:vrna_app_mobile/src/widgets/edit_text.dart';
import 'package:provider/provider.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:vrna_app_mobile/src/values/colors.dart' as colors;
import '../../widgets/theme.dart' as customTheme;

class ProfileWidget {
  Widget Profile(BuildContext context, ProfileBloc bloc) {
    var mediaQuery = MediaQuery.of(context);
    var device = getDeviceType(mediaQuery);
    customTheme.Theme theme = customTheme.Theme.getTheme(device);
    Size size = MediaQuery.of(context).size;
    // StreamBu
    return Stack(children: [
      Container(
        child: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.all(0.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                /* Image(
                  image: AssetImage("assets/profile.png"),
                  width: 100.0,
                  height: 100.0,
                ),*/

                SizedBox(height: 10.0),
                StreamBuilder<dynamic>(
                    stream: bloc.firstName,
                    initialData: "",
                    builder: (context, snapshot) {
                      return RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            text: 'Hi:',
                            style: TextStyle(
                                color: Color.fromRGBO(206, 206, 206, 0.8),
                                fontSize: 33.0,
                                height: 1.4,
                                fontFamily: 'SF UI Display',
                                letterSpacing: 1.0,
                                fontWeight: FontWeight.normal),
                            children: <TextSpan>[
                              TextSpan(
                                text: snapshot.data != null &&
                                        snapshot.data != 'null'
                                    ? snapshot.data
                                    : '',
                                style: TextStyle(
                                    color: Color.fromRGBO(225, 185, 36, 0.8),
                                    fontSize: 33.0,
                                    height: 1.4,
                                    fontFamily: 'SF UI Display',
                                    letterSpacing: 1.0,
                                    fontWeight: FontWeight.normal),
                              ),
                            ]),
                      );
                    }),
                SizedBox(height: 10.0),
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
        child: Padding(
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          child: Row(children: []),
        ));
  }
}

class PersonalInformation extends StatefulWidget {
  @override
  _PersonalInformationState createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {
  ProfileBloc bloc;

  String gender;
  String nationality;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    bloc = Provider.of<ProfileBloc>(context);
    // bloc.getProfile(context);
    bloc.gender.listen((value) {
      this.setState(() {
        gender = value;
      });
    });
    bloc.nationality.listen((value) {
      print('Nationality : $value');
      this.setState(() {
        nationality = value;
      });
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  bool _showContent = false;
  final GlobalKey<ExpansionTileCardState> cardA = new GlobalKey();

  final GlobalKey<ExpansionTileCardState> savedCardsCard = new GlobalKey();

  get items => null;
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var device = getDeviceType(mediaQuery);
    customTheme.Theme theme = customTheme.Theme.getTheme(device);
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
      child: ExpansionTile( 
        key: cardA,
        leading: Icon(
          Icons.account_box,
          color: Color.fromRGBO(199, 199, 199, 1.0),
          size: 30.0,
        ),
        title: Text(
          'Personal Information',
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'SF UI Display',
              fontWeight: FontWeight.bold),
        ),
        children: <Widget>[
          Container(
              padding: EdgeInsets.only(left: 30.0, right: 30.0, bottom: 50.0),
              child: Column(
                children: <Widget>[
                  EditText(
                    placeholder: "First name",
                    value: bloc.firstName,
                    onChange: (value) => bloc.setFirstName(value),
                    onSubmit: () => {},
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
                  Container(
                    child: DropdownButton<String>(
                      value: gender != null && gender != 'null'
                          ? gender.toLowerCase()
                          : 'male',
                      isExpanded: true,
                      style: TextStyle(color: colors.primaryColor),
                      items: <String>['Male', 'Female', 'Other']
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value.toLowerCase(),
                          child: new Text(value),
                        );
                      }).toList(),
                      onChanged: (v) {
                        this.setState(() {
                          gender = v;
                        });
                        bloc.setGender(v);
                      },
                    ),
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
                    placeholder: "Mobile Number",
                    value: bloc.mobile,
                    onChange: (value) => {
                      // _selectDate(context),
                      bloc.setMobile(value)
                    },
                    // prefixIcon: Icons.call,
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(height: size.height * 0.02),
                  Container(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: nationality != null && nationality != 'null'
                          ? nationality.toLowerCase()
                          : 'indian',
                      style: TextStyle(color: colors.primaryColor),
                      items: <String>[
                        'Indian',
                        'American',
                        'Irish',
                        'British',
                        'Algeria'
                      ].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value.toLowerCase(),
                          child: new Text(value),
                        );
                      }).toList(),
                      onChanged: (v) {
                        setState(() {
                          nationality = v;
                        });
                        bloc.setNationality(v);
                      },
                    ),
                  ),
                  SizedBox(height: size.height * 0.04),
                  InkWell(
                    child: Container(
                      padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                      width: MediaQuery.of(context).size.width,
                      color: Color.fromRGBO(225, 185, 36, 1.0),
                      child: Text(
                        "Update".toUpperCase(),
                        textAlign: TextAlign.center,
                        style: theme.buttontext,
                      ),
                    ),
                    onTap: () => {bloc.updateProfile(context)},
                  ),
                ],
              ))
        ],
      ),
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
  String country;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    bloc = Provider.of<ProfileBloc>(context);
    bloc.country.listen((value) {
      this.setState(() {
        country = value;
      });
    });
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  final GlobalKey<ExpansionTileCardState> cardA = new GlobalKey();

  get items => null;
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var device = getDeviceType(mediaQuery);
    customTheme.Theme theme = customTheme.Theme.getTheme(device);
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
      child: ExpansionTile( 
        key: cardA,
        leading: Icon(
          Icons.location_pin,
          color: Color.fromRGBO(199, 199, 199, 1.0),
          size: 30.0,
        ),
        title: Text(
          'Manage Address',
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'SF UI Display',
              fontWeight: FontWeight.bold),
        ),
        children: <Widget>[
          Container(
              padding: EdgeInsets.only(left: 30.0, right: 30.0, bottom: 50.0),
              child: Column(
                children: <Widget>[
                  EditText(
                    placeholder: "Address Line1",
                    value: bloc.addressLine1,
                    onChange: (value) => bloc.setAddressLine1(value),
                    // prefixIcon: Icons.email_sharp,
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(height: size.height * 0.02),
                  EditText(
                    placeholder: "Address Line2",
                    value: bloc.addressLine2,
                    onChange: (value) => bloc.setAddressLine2(value),
                    onSubmit: () {},
                    // prefixIcon: Icons.call,
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(height: size.height * 0.02),
                  EditText(
                    placeholder: "Area",
                    value: bloc.area,
                    onChange: (value) => bloc.setArea(value),
                    // prefixIcon: Icons.call,
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(height: size.height * 0.02),
                  EditText(
                    placeholder: "State",
                    value: bloc.stateData,
                    onChange: (value) => bloc.setStateData(value),
                    // prefixIcon: Icons.call,
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(height: size.height * 0.02),
                  Container(
                    child: DropdownButton<String>(
                      value: country != null && country != 'null'
                          ? country.toLowerCase()
                          : 'india',
                      isExpanded: true,
                      style: TextStyle(color: colors.primaryColor),
                      items: <String>['India', 'America', 'Algeria']
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value.toLowerCase(),
                          child: new Text(value),
                        );
                      }).toList(),
                      onChanged: (v) {
                        setState(() {
                          country = v;
                        });
                        bloc.setCountry(v);
                      },
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  EditText(
                    placeholder: "Postal Code",
                    value: bloc.pinCode,
                    onChange: (value) => {
                      // _selectDate(context),
                      bloc.setPinCode(value)
                    },
                    // prefixIcon: Icons.call,
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(height: size.height * 0.04),
                  InkWell(
                    child: Container(
                      padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                      width: MediaQuery.of(context).size.width,
                      color: Color.fromRGBO(225, 185, 36, 1.0),
                      child: Text(
                        "Update".toUpperCase(),
                        textAlign: TextAlign.center,
                        style: theme.buttontext,
                      ),
                    ),
                    onTap: () => {bloc.updateProfile(context)},
                  ),
                ],
              ))
        ],
      ),
    );

    /*Card(
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
    );*/
  }
}

class CardsDetails extends StatefulWidget {
  @override
  _CardsDetailsState createState() => _CardsDetailsState();
}

class _CardsDetailsState extends State<CardsDetails> {
  bool _showContent = false;
  ProfileBloc bloc;
  final GlobalKey<ExpansionTileCardState> savedCardsCard = new GlobalKey();
  get items => null;
  DateTime selectedDate = DateTime.now();
  void didChangeDependencies() {
    super.didChangeDependencies();
    bloc = Provider.of<ProfileBloc>(context);
  }

  var newCard = {
    'cardNo': '',
    'expMonth': 'January',
    'expYear': '2021',
    'cvv': ''
  };

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var device = getDeviceType(mediaQuery);
    bool mobwidth = MediaQuery.of(context).size.width < 768;
    customTheme.Theme theme = customTheme.Theme.getTheme(device);
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
      child: ExpansionTile( 
        key: savedCardsCard,
        leading: Icon(
          Icons.credit_card,
          color: Color.fromRGBO(199, 199, 199, 1.0),
          size: 30.0,
        ),
        title: Text(
          'Saved Cards',
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'SF UI Display',
              fontWeight: FontWeight.bold),
        ),
        children: <Widget>[
          Container(
              padding: EdgeInsets.only(left: 30.0, right: 30.0, bottom: 50.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: ExpansionTile( 
                      leading: Icon(
                        Icons.credit_card,
                        color: Color.fromRGBO(199, 199, 199, 1.0),
                        size: 20.0,
                      ),
                      title: Text(
                        'Add New Card',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'SF UI Display',
                            fontWeight: FontWeight.bold),
                      ),
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.only(
                                left: 30.0, right: 30.0, bottom: 50.0),
                            child: Column(
                              children: <Widget>[
                                EditText(
                                  placeholder: "Card Number",
                                  value: bloc.newCardNo ?? '',
                                  onChange: (value) {
                                    bloc.setNewCardNo(value);
                                  },
                                  keyboardType: TextInputType.text,
                                ),
                                SizedBox(height: size.height * 0.02),
                                Container(
                                  child: DropdownButton<String>(
                                    value: newCard['expMonth'] ?? 'January',
                                    isExpanded: true,
                                    style:
                                        TextStyle(color: colors.primaryColor),
                                    items: <String>[
                                      "January",
                                      "February",
                                      "March",
                                      "April",
                                      "May",
                                      "June",
                                      "July",
                                      "August",
                                      "September",
                                      "October",
                                      "November",
                                      "December"
                                    ].map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: new Text(value),
                                      );
                                    }).toList(),
                                    onChanged: (v) {
                                      setState(() {
                                        newCard['expMonth'] = v;
                                      });
                                      bloc.setNewCardExpMonth(v);
                                    },
                                  ),
                                ),
                                SizedBox(height: size.height * 0.02),
                                Container(
                                  child: DropdownButton<String>(
                                    value: newCard['expYear'] ?? '2023',
                                    isExpanded: true,
                                    style:
                                        TextStyle(color: colors.primaryColor),
                                    items: <String>[
                                      '2021',
                                      '2022',
                                      '2023',
                                      '2024',
                                      '2025'
                                    ].map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value.toLowerCase(),
                                        child: new Text(value),
                                      );
                                    }).toList(),
                                    onChanged: (v) {
                                      bloc.setNewCardExpYear(v);
                                      setState(() {
                                        newCard['expYear'] = v;
                                      });
                                    },
                                  ),
                                ),
                                SizedBox(height: size.height * 0.02),
                                EditText(
                                  placeholder: "CVV",
                                  value: bloc.newCardCVV,
                                  // prefixIcon: Icons.call,
                                  keyboardType: TextInputType.text,
                                  onChange: (v) {
                                    bloc.setNewCardCVV(v);
                                  },
                                ),
                                SizedBox(height: size.height * 0.04),
                                Flex(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  direction: mobwidth
                                      ? Axis.vertical
                                      : Axis.horizontal,
                                  children: [
                                    InkWell(
                                      child: Container(
                                        margin: EdgeInsets.only(bottom: 20.0),
                                        width: 150.0,
                                        padding: EdgeInsets.only(
                                            top: 15.0, bottom: 15.0),
                                        color:
                                            Color.fromRGBO(225, 185, 36, 1.0),
                                        child: Text(
                                          "Cancel".toUpperCase(),
                                          textAlign: TextAlign.center,
                                          style: theme.buttontext,
                                        ),
                                      ),
                                      onTap: () => {},
                                    ),
                                    SizedBox(width: 20.0),
                                    InkWell(
                                      child: Container(
                                        width: 150.0,
                                        margin: EdgeInsets.only(bottom: 20.0),
                                        padding: EdgeInsets.only(
                                            top: 15.0, bottom: 15.0),
                                        color:
                                            Color.fromRGBO(225, 185, 36, 1.0),
                                        child: Text(
                                          "Save".toUpperCase(),
                                          textAlign: TextAlign.center,
                                          style: theme.buttontext,
                                        ),
                                      ),
                                      onTap: () => {
                                        print(
                                            "Card: ${bloc.newCardNo} ${bloc.newCardCVV} ${bloc.newCardExpMonth} ${bloc.newCardExpYear}"),
                                        bloc.addNewCard(context),
                                      },
                                    ),
                                  ],
                                )
                              ],
                            ))
                      ],
                    ),
                  ),
                  StreamBuilder<dynamic>(
                      stream: bloc.cardList,
                      initialData: "",
                      builder: (context, snapshot) {
                        List savedCards = [];
                        if (snapshot.data != null) {
                          savedCards = snapshot.data;
                        }
                        return Column(children: [
                          for (Card card in savedCards)
                            // SizedBox(height: 20.0),
                            Stack(
                              children: <Widget>[
                                Container(
                                    child: TextField(
                                  textAlign: TextAlign.left,
                                  decoration: InputDecoration(
                                    hintText: card.cardNo,
                                    hintStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.0,
                                      fontFamily: 'SF UI Display',
                                    ),
                                    contentPadding: EdgeInsets.only(
                                        left: 60.0,
                                        top: 20.0,
                                        right: 20.0,
                                        bottom: 20.0),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 2.0),
                                    ),
                                  ),
                                )),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: 0.0, top: 2.0),
                                      alignment: Alignment.topLeft,
                                      width: 38,
                                      child: Image(
                                        image: AssetImage("assets/card.png"),
                                        width: 38.0,
                                        height: 38.0,
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: 10.0, top: 2.0),
                                      alignment: Alignment.topRight,
                                      width: 38,
                                      child: InkWell(
                                          onTap: () {
                                            bloc.deleteSavedCard(context, card);
                                          },
                                          child: Icon(
                                            Icons.delete,
                                            color: Colors.orange,
                                            size: 30.0,
                                          )),
                                    ),
                                  ],
                                )
                              ],
                            ),
                        ]);
                      }),
                ],
              ))
        ],
      ),
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
