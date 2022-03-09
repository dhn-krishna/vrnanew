import 'package:vrna_app_mobile/src/repositories/dashboard.repository.dart';
import 'package:vrna_app_mobile/src/models/dashboardresponse.model.dart';
import 'package:vrna_app_mobile/src/widgets/toast.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';

class DashboardBloc {
  DashboardRepository _repository = new DashboardRepository();

  final _loading = BehaviorSubject<bool>();
  final _rentpopup = BehaviorSubject<bool>();
  final BehaviorSubject<DashboardResponseModel> _responsedata =
      BehaviorSubject<DashboardResponseModel>();
  final BehaviorSubject<LatestMovieResponseModel> _responseLatestMoviedata =
      BehaviorSubject<LatestMovieResponseModel>();
  final BehaviorSubject<TopMovieResponseModel> _responseTopMoviedata =
      BehaviorSubject<TopMovieResponseModel>();
  final BehaviorSubject<RentResponseModel> _responseRentMoviedata =
      BehaviorSubject<RentResponseModel>();
  final BehaviorSubject<RentalMovieResponseModel> _responseRentalMoviedata =
      BehaviorSubject<RentalMovieResponseModel>();
  final BehaviorSubject<RecomendedMovieResponseModel>
      _responseRecomendedMoviedata =
      BehaviorSubject<RecomendedMovieResponseModel>();

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

  void addRent(context, details) async {
    _setLoading(true);
    final ret = await _repository.addrent(
        context,
        _cardnumber.value.toString(),
        _cvv.value.toString(),
        _month.value.toString(),
        _year.value.toString(),
        details.ppmCost.toString(),
        details.movieId);
    print(ret);

    _setLoading(false);

    if (ret.status == "200") {
      if (ret.statusResult == 'Success' || ret.statusResult == 'SUCCESS') {
        CustomToast.show(ret.message.toString());
        Navigator.of(context).pop();
        // _responseRentMoviedata.sink.add(ret);
        // CustomToast.show(ret.message.toString());
      } else {
        print(ret.toString());
        CustomToast.show(ret.message.toString());
      }
    } else {
      CustomToast.show(ret.message);
    }
  }

  void dashboardBanner(context) async {
    _setLoading(true);
    final ret = await _repository.dashboardbanner(context);
    print(ret);

    _setLoading(false);

    if (ret.status == "200") {
      if (ret.statusResult == 'Success' || ret.statusResult == 'SUCCESS') {
        _responsedata.sink.add(ret);
        // CustomToast.show(ret.message.toString());
      } else {
        print(ret.toString());
        CustomToast.show(ret.message.toString());
      }
    } else {
      CustomToast.show(ret.message);
    }
  }

  void dashboardLatestMovie(context) async {
    _setLoading(true);
    final ret = await _repository.latestmovie(context);
    print(ret);

    _setLoading(false);

    if (ret.status == "200") {
      if (ret.statusResult == 'Success' || ret.statusResult == 'SUCCESS') {
        _responseLatestMoviedata.sink.add(ret);
        // CustomToast.show(ret.message.toString());
      } else {
        print(ret.toString());
        CustomToast.show(ret.message.toString());
      }
    } else {
      CustomToast.show(ret.message);
    }
  }

  void dashboardTopMovie(context) async {
    _setLoading(true);
    final ret = await _repository.topmovie(context);
    print(ret);

    _setLoading(false);

    if (ret.status == "200") {
      if (ret.statusResult == 'Success' || ret.statusResult == 'SUCCESS') {
        _responseTopMoviedata.sink.add(ret);
        // CustomToast.show(ret.message.toString());
      } else {
        print(ret.toString());
        CustomToast.show(ret.message.toString());
      }
    } else {
      CustomToast.show(ret.message);
    }
  }

  void rentalMovie(context) async {
    _setLoading(true);
    final ret = await _repository.rentalMovies(context);
    print(ret);

    _setLoading(false);

    if (ret.status == "200") {
      if (ret.statusResult == 'Success' || ret.statusResult == 'SUCCESS') {
        _responseRentalMoviedata.sink.add(ret);
        // CustomToast.show(ret.message.toString());
      } else {
        print(ret.toString());
        CustomToast.show(ret.message.toString());
      }
    } else {
      CustomToast.show(ret.message);
    }
  }

  void recomendedMovies(context) async {
    _setLoading(true);
    final ret = await _repository.recomendedMovies(context);
    print(ret);

    _setLoading(false);

    if (ret.status == "200") {
      if (ret.statusResult == 'Success' || ret.statusResult == 'SUCCESS') {
        _responseRecomendedMoviedata.sink.add(ret);
        // CustomToast.show(ret.message.toString());
      } else {
        print(ret.toString());
        CustomToast.show(ret.message.toString());
      }
    } else {
      CustomToast.show(ret.message);
    }
  }

  BehaviorSubject<DashboardResponseModel> get responsedata =>
      _responsedata.stream;
  BehaviorSubject<LatestMovieResponseModel> get latestMovieData =>
      _responseLatestMoviedata.stream;
  BehaviorSubject<TopMovieResponseModel> get topMovieData =>
      _responseTopMoviedata.stream;
  BehaviorSubject<RentalMovieResponseModel> get rentalMovieData =>
      _responseRentalMoviedata.stream;
  BehaviorSubject<RecomendedMovieResponseModel> get recomendedMovieData =>
      _responseRecomendedMoviedata.stream;

  void dispose() {
    _loading.close();
    _responsedata.close();
    _responseLatestMoviedata.close();
    _responseTopMoviedata.close();
    _rentpopup.close();
    _responseRentMoviedata.close();
    _cardnumber.close();
    _month.close();
    _year.close();
    _cvv.close();
  }
}
