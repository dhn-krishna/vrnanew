import 'package:vrna_app_mobile/src/models/featuredActor.model.dart';
import 'package:vrna_app_mobile/src/models/payment/CardListResponse.dart';
import 'package:vrna_app_mobile/src/repositories/dashboard.repository.dart';
import 'package:vrna_app_mobile/src/models/dashboardresponse.model.dart';
import 'package:vrna_app_mobile/src/repositories/payment.repository.dart';
import 'package:vrna_app_mobile/src/widgets/toast.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';

class PaymentBloc {
  PaymentRepository _repository = new PaymentRepository();
  DashboardRepository _dashboardRepository = new DashboardRepository();

  final String defaultErrorMessage = 'Something went wrong';

  final _loading = BehaviorSubject<bool>();
  final _rentpopup = BehaviorSubject<bool>();
  final BehaviorSubject<CardListResponse> _responseCardListData =
      BehaviorSubject<CardListResponse>();

  final _cardnumber = BehaviorSubject<String>();
  final _month = BehaviorSubject<String>();
  final _year = BehaviorSubject<String>();
  final _cvv = BehaviorSubject<String>();

  Stream<bool> get loading => _loading.stream;
  void _setLoading(bool value) => _loading.sink.add(value);

  Stream<String> get cardnumber => _cardnumber.stream;
  void setCardnumber(String value) => _cardnumber.sink.add(value);

  Stream<String> get month => _month.stream;
  void setMonth(String value) => _month.sink.add(value);

  Stream<String> get year => _year.stream;
  void setYear(String value) => _year.sink.add(value);

  Stream<String> get cvv => _cvv.stream;
  void setCvv(String value) => _cvv.sink.add(value);

  Stream<bool> get getrentPopup => _rentpopup.stream;
  void rentPopup(bool value) => _rentpopup.sink.add(value);

  void refresh(context) async {
    _setLoading(true);
    var response = (await _responseCardListData.last);
    _responseCardListData.sink.add(new CardListResponse(
        cards: response.cards,
        message: "",
        status: response.status,
        statusCode: response.statusCode));
    _setLoading(false);
  }

  void getCardList(context) async {
    _setLoading(true);
    final ret = await _repository.cardList(context);
    _setLoading(false);
    if (ret.statusCode == "200") {
      if (ret.status == 'Success' || ret.status == 'SUCCESS') {
        _responseCardListData.sink.add(ret);
      } else {}
    } else {
      CustomToast.show(ret.message ?? defaultErrorMessage);
    }
  }

  Future<CardListResponse> getCardListPayLoad(context) async {
    _setLoading(true);
    final ret = await _repository.cardList(context);
    _setLoading(false);
    if (ret.statusCode == "200") {
      if (ret.status == 'Success' || ret.status == 'SUCCESS') {
        return ret;
      } else {}
    } else {
      CustomToast.show(ret.message ?? defaultErrorMessage);
    }
    return ret;
  }

  Future<int> addNewCard(context, cardDetails) async {
    _setLoading(true);
    final ret = await _repository.addNewCard(context, cardDetails);
    _setLoading(false);
    if (ret.statusCode == "200") {
      if (ret.status == 'Success' || ret.status == 'SUCCESS') {
        CustomToast.show('Card has been added successfully');
        // getCardList(context);
        return 1;
      } else {}
    } else {
      CustomToast.show(ret.message ?? defaultErrorMessage);
    }
    return 0;
  }

  Future<int> processPayment(context, cardDetails, movie) async {
    _setLoading(true);
    final ret = await _repository.processPayment(context, cardDetails, movie);
    _setLoading(false);
    if (ret.statusCode == "200") {
      if (ret.status == 'Success' || ret.status == 'SUCCESS') {
        CustomToast.show('Payment has been processed successfully..');
        return 1;
      } else {}
    } else {
      CustomToast.show(ret.message ?? defaultErrorMessage);
    }
    return 0;
  }

  BehaviorSubject<CardListResponse> get cardListData => _responseCardListData;

  void dispose() {
    _loading.close();
    _responseCardListData.close();
    _rentpopup.close();
    _cardnumber.close();
    _month.close();
    _year.close();
    _cvv.close();
  }
}
