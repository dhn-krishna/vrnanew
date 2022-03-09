import 'dart:ui';
import 'package:flutter/material.dart' hide Card;
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:vrna_app_mobile/src/helpers/utils/commonutils.dart';
import 'package:vrna_app_mobile/src/models/payment/Card.dart';
import 'package:vrna_app_mobile/src/models/payment/CardListResponse.dart';
import 'package:vrna_app_mobile/src/values/devicescreen.dart';
import 'package:vrna_app_mobile/src/widgets/background.dart';
import 'package:vrna_app_mobile/src/widgets/loading.dart';
import '../../widgets/theme.dart' as customTheme;

class RentWidget {
  void showRentDialog(context, dashboardBloc, paymentBloc, movie) {
    var mediaQuery = MediaQuery.of(context);
    var device = getDeviceType(mediaQuery);
    customTheme.Theme theme = customTheme.Theme.getTheme(device);
    var currentDate = DateTime.now();
    var expiryYear = '${currentDate.year}';
    var expiryMonth = CommonUtils.months[(currentDate.month - 1)];
    var cvvTextController = TextEditingController();
    var cardNumberTextControler = TextEditingController();
    List cardListResponse;
    var cardSelected = 0;
    var activeCard;

    bool layoutDecide = MediaQuery.of(context).size.width < 1024;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (context, StateSetter setState) {
            return FutureBuilder<CardListResponse>(
                future: dashboardBloc.getCardListPayLoad(context),
                builder: (context, paymentSnapshot) {
                  cardListResponse = [];
                  if (paymentSnapshot.data != null) {
                    cardListResponse = paymentSnapshot.data.cards;
                    if (cardListResponse != null && cardListResponse.isNotEmpty)
                      activeCard = cardListResponse[0];
                  }
                  return AlertDialog(
                    backgroundColor: Color.fromRGBO(53, 70, 78, 1.0),
                    contentPadding: EdgeInsets.all(20.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    content: Stack(
                      overflow: Overflow.visible,
                      children: <Widget>[
                        Loading(
                            message: 'Transaction in progress...',
                            backgroundTransparent: false,
                            status: paymentBloc.loading,
                            child: Container(
                                width: MediaQuery.of(context).size.width * 0.6,
                                height:
                                    MediaQuery.of(context).size.height * 0.9,
                                child: ListView(
                                  scrollDirection: Axis.vertical,
                                  children: [
                                    Container(
                                      height: layoutDecide ? 700 : 320.0,
                                      padding: EdgeInsets.only(
                                        left: 15.0,
                                        top: 15.0,
                                        right: 15.0,
                                        bottom: 15.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Color.fromRGBO(34, 47, 53, 1.0),
                                      ),
                                      child: Flex(
                                          direction: layoutDecide
                                              ? Axis.vertical
                                              : Axis.horizontal,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                                color: Colors.green,
                                                child: Image.network(
                                                  movie.posterurl,
                                                  fit: BoxFit.fill,
                                                  height: 300.0,
                                                  width: layoutDecide
                                                      ? MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.85
                                                      : MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.15,
                                                )),
                                            SizedBox(width: 15.0),
                                            Container(
                                                width: layoutDecide
                                                    ? MediaQuery.of(context)
                                                        .size
                                                        .width
                                                    : MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                        3,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(height: 20.0),
                                                    Text(movie.moviename ?? '',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            fontSize: 30.0,
                                                            fontFamily:
                                                                'SF UI Display',
                                                            color:
                                                                Color.fromRGBO(
                                                                    225,
                                                                    185,
                                                                    36,
                                                                    0.8),
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                    Container(
                                                        height: 50.0,
                                                        child: Stack(
                                                          alignment:
                                                              AlignmentDirectional
                                                                  .topStart,
                                                          children: [
                                                            RatingBarIndicator(
                                                              textDirection:
                                                                  TextDirection
                                                                      .ltr,
                                                              direction: Axis
                                                                  .horizontal,
                                                              itemPadding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              itemSize: 30.0,
                                                              rating: 5,
                                                              itemBuilder:
                                                                  (context,
                                                                          index) =>
                                                                      Icon(
                                                                Icons.star,
                                                                color: Color
                                                                    .fromRGBO(
                                                                        255,
                                                                        185,
                                                                        36,
                                                                        1.0),
                                                                size: 0.50,
                                                              ),
                                                            ),
                                                          ],
                                                        )),
                                                    SizedBox(height: 25.0),
                                                    Container(
                                                        child: Expanded(
                                                      child: Text(
                                                          movie?.description ??
                                                              '',
                                                          style: theme.bycont),
                                                    )),
                                                  ],
                                                ))
                                          ]),
                                    ),
                                    SizedBox(height: 15.0),
                                    Container(
                                      child: SingleChildScrollView(
                                        child: Column(children: [
                                          Theme(
                                            data: Theme.of(context).copyWith(
                                              unselectedWidgetColor: Colors.red,
                                              disabledColor: Colors.blue,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                SizedBox(height: 30.0),
                                                Row(children: [
                                                  Text("Your Card Details",
                                                      style: theme.moviefare),
                                                ]),
                                                for (var i = 0;
                                                    i < cardListResponse.length;
                                                    i++)
                                                  ListTile(
                                                      title: Text(
                                                          "**** **** **** ${cardListResponse[i].cardNo}",
                                                          style: TextStyle(
                                                            color:
                                                                Color.fromRGBO(
                                                                    255,
                                                                    255,
                                                                    219,
                                                                    1.0),
                                                          )),
                                                      leading: Radio<int>(
                                                        activeColor:
                                                            Colors.white,
                                                        value: i,
                                                        groupValue:
                                                            cardSelected,
                                                        onChanged: (v) => {
                                                          setState(() {
                                                            activeCard =
                                                                cardListResponse[
                                                                    v];
                                                            cardSelected =
                                                                v ?? 0;
                                                          })
                                                        },
                                                      )),
                                                ListTile(
                                                    title: Text(
                                                        "New Credit/Debit/ATM Card",
                                                        style: TextStyle(
                                                          color: Color.fromRGBO(
                                                              255,
                                                              255,
                                                              219,
                                                              1.0),
                                                        )),
                                                    leading: Radio<int>(
                                                      toggleable: true,
                                                      activeColor: Colors.white,
                                                      value: cardListResponse
                                                          .length,
                                                      groupValue: cardSelected,
                                                      onChanged: (v) => {
                                                        setState(() {
                                                          cardSelected = v ?? 0;
                                                        })
                                                      },
                                                    )),
                                                SizedBox(height: 20.0),
                                                if (cardSelected ==
                                                    cardListResponse.length)
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      TextFormField(
                                                        controller:
                                                            cardNumberTextControler,
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                        ),
                                                        decoration:
                                                            const InputDecoration(
                                                          hintText:
                                                              'Only Card Number',
                                                          labelText:
                                                              'Card Number',
                                                          labelStyle: TextStyle(
                                                            color: Colors.white,
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color
                                                                  .fromRGBO(
                                                                      225,
                                                                      185,
                                                                      36,
                                                                      0.8),
                                                            ),
                                                          ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color
                                                                  .fromRGBO(
                                                                      225,
                                                                      185,
                                                                      36,
                                                                      0.8),
                                                              width: 2.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(height: 30.0),
                                                      Row(
                                                          textDirection:
                                                              TextDirection.ltr,
                                                          children: [
                                                            Flexible(
                                                                child:
                                                                    Container(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left:
                                                                          10.0,
                                                                      right:
                                                                          10.0),
                                                              decoration:
                                                                  BoxDecoration(
                                                                border: Border.all(
                                                                    width: 2.0,
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            225,
                                                                            185,
                                                                            36,
                                                                            0.8)),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5.0),
                                                              ),
                                                              child:
                                                                  DropdownButtonHideUnderline(
                                                                child:
                                                                    DropdownButton<
                                                                        String>(
                                                                  isDense:
                                                                      false,
                                                                  isExpanded:
                                                                      true,
                                                                  dropdownColor:
                                                                      Colors
                                                                          .black,
                                                                  focusColor:
                                                                      Colors
                                                                          .black,
                                                                  //value: _chosenValue,
                                                                  //elevation: 5,
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black),
                                                                  iconEnabledColor:
                                                                      Colors
                                                                          .orange,
                                                                  items: CommonUtils
                                                                      .monthsDic
                                                                      .map((k,
                                                                          v) {
                                                                        return new MapEntry(
                                                                            v,
                                                                            DropdownMenuItem(
                                                                              value: v,
                                                                              child: Text(
                                                                                k,
                                                                                style: TextStyle(color: Colors.white),
                                                                              ),
                                                                            ));
                                                                      })
                                                                      .values
                                                                      .toList(),
                                                                  hint: Text(
                                                                    "Expiry Month",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            14,
                                                                        fontWeight:
                                                                            FontWeight.w500),
                                                                  ),
                                                                  onChanged:
                                                                      (String
                                                                          value) {
                                                                    setState(
                                                                        () {
                                                                      expiryMonth =
                                                                          value ??
                                                                              '';
                                                                    });
                                                                  },
                                                                  value:
                                                                      expiryMonth,
                                                                ),
                                                              ),
                                                            )),
                                                            SizedBox(
                                                                width: 10.0),
                                                            Flexible(
                                                                child:
                                                                    Container(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left:
                                                                          10.0,
                                                                      right:
                                                                          10.0),
                                                              decoration:
                                                                  BoxDecoration(
                                                                border: Border.all(
                                                                    width: 2.0,
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            225,
                                                                            185,
                                                                            36,
                                                                            0.8)),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5.0),
                                                              ),
                                                              child:
                                                                  DropdownButtonHideUnderline(
                                                                child:
                                                                    DropdownButton<
                                                                        String>(
                                                                  isDense:
                                                                      false,
                                                                  isExpanded:
                                                                      true,
                                                                  focusColor:
                                                                      Colors
                                                                          .black,
                                                                  dropdownColor:
                                                                      Colors
                                                                          .black,
                                                                  //value: _chosenValue,
                                                                  //elevation: 5,
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black),
                                                                  iconEnabledColor:
                                                                      Colors
                                                                          .orange,
                                                                  items: <
                                                                      String>[
                                                                    '2021',
                                                                    '2022',
                                                                    '2023',
                                                                    '2024',
                                                                    '2025',
                                                                    '2026',
                                                                    '2027',
                                                                  ].map<
                                                                      DropdownMenuItem<
                                                                          String>>((String
                                                                      value) {
                                                                    return DropdownMenuItem<
                                                                        String>(
                                                                      value:
                                                                          value,
                                                                      child:
                                                                          Text(
                                                                        value,
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                12.0,
                                                                            color:
                                                                                Colors.white),
                                                                      ),
                                                                    );
                                                                  }).toList(),
                                                                  hint: Text(
                                                                    "Expiry Year",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            14,
                                                                        fontWeight:
                                                                            FontWeight.w500),
                                                                  ),
                                                                  onChanged:
                                                                      (String
                                                                          value) {
                                                                    setState(
                                                                        () {
                                                                      expiryYear =
                                                                          value ??
                                                                              '';
                                                                    });
                                                                  },
                                                                  value:
                                                                      expiryYear,
                                                                ),
                                                              ),
                                                            )),
                                                            SizedBox(
                                                                width: 10.0),
                                                            Flexible(
                                                              child:
                                                                  TextFormField(
                                                                controller:
                                                                    cvvTextController,
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                                decoration:
                                                                    const InputDecoration(
                                                                  hintText:
                                                                      'cvv',
                                                                  labelText:
                                                                      'CVV',
                                                                  labelStyle:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                  ),
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: Color.fromRGBO(
                                                                          225,
                                                                          185,
                                                                          36,
                                                                          0.8),
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ]),
                                                    ],
                                                  )
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 30.0),
                                        ]),
                                      ),
                                    )
                                    // })
                                    ,
                                    SizedBox(height: 20.0),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: InkWell(
                                              child: Container(
                                                height: 40.0,
                                                alignment: Alignment.center,
                                                padding: EdgeInsets.only(
                                                    top: 6.0, bottom: 6.0),
                                                decoration: BoxDecoration(
                                                  color: Color.fromRGBO(
                                                      255, 87, 34, 1.0),
                                                  border: Border.all(
                                                      width: 1.0,
                                                      color: Color.fromRGBO(
                                                          255, 87, 34, 1.0)),
                                                ),
                                                child: Text(
                                                  "Cancel",
                                                  textAlign: TextAlign.center,
                                                  style: theme.buttontextwt,
                                                ),
                                              ),
                                              onTap: () =>
                                                  {Navigator.pop(context)},
                                            ),
                                          ),
                                          SizedBox(width: 10.0),
                                          Expanded(
                                            child: InkWell(
                                              child: Container(
                                                  height: 40.0,
                                                  decoration: BoxDecoration(
                                                    color: Color.fromRGBO(
                                                        225, 185, 36, 1.0),
                                                  ),
                                                  child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          "Checkout",
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: theme
                                                              .buttontextwt,
                                                        ),
                                                      ])),
                                              onTap: () {
                                                if (cardSelected ==
                                                    cardListResponse.length) {
                                                  Card card = new Card(
                                                      cardNo:
                                                          cardNumberTextControler
                                                              .text,
                                                      expiryMonth: expiryMonth,
                                                      expiryYear: expiryYear,
                                                      secretPin:
                                                          cvvTextController
                                                              .text);
                                                  paymentBloc
                                                      .addNewCard(context, card)
                                                      .then((val) {
                                                    if (val == 1) {
                                                      paymentBloc
                                                          .processPayment(
                                                              context,
                                                              card,
                                                              movie)
                                                          .then((val) {
                                                        if (val == 1) {
                                                          dashboardBloc
                                                              .dashboardAllData(
                                                                  context);
                                                          int count = 0;
                                                          Navigator.of(context)
                                                              .popUntil((_) =>
                                                                  count++ >= 2);
                                                        }
                                                      });
                                                    }
                                                  });
                                                } else {
                                                  activeCard = activeCard ??
                                                      cardListResponse[
                                                          cardSelected];
                                                  paymentBloc
                                                      .processPayment(context,
                                                          activeCard, movie)
                                                      .then((val) {
                                                    if (val == 1) {
                                                      dashboardBloc
                                                          .dashboardAllData(
                                                              context);
                                                      int count = 0;
                                                      Navigator.of(context)
                                                          .popUntil((_) =>
                                                              count++ >= 2);
                                                    }
                                                  });
                                                }
                                              },
                                            ),
                                          ),
                                        ])
                                  ],
                                ))),
                        Positioned(
                          right: -20.0,
                          top: -20.0,
                          child: InkResponse(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: CircleAvatar(
                              radius: 16,
                              backgroundColor: Color.fromRGBO(23, 99, 124, 1.0),
                              child: CircleAvatar(
                                backgroundColor:
                                    Color.fromRGBO(13, 13, 13, 1.0),
                                child: Icon(Icons.close,
                                    size: 14.0,
                                    color: Color.fromRGBO(
                                      34,
                                      184,
                                      233,
                                      1.0,
                                    )),
                                radius: 14,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                });
          });
        });
  }
}
