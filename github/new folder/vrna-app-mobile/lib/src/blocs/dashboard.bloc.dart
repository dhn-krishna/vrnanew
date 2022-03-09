import 'package:vrna_app_mobile/src/models/featuredActor.model.dart';
import 'package:vrna_app_mobile/src/models/moviecast.model.dart';
import 'package:vrna_app_mobile/src/models/payment/CardListResponse.dart';
import 'package:vrna_app_mobile/src/repositories/dashboard.repository.dart';
import 'package:vrna_app_mobile/src/models/dashboardresponse.model.dart';
import 'package:vrna_app_mobile/src/repositories/payment.repository.dart';
import 'package:vrna_app_mobile/src/widgets/toast.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';

class DashboardBloc {
  DashboardRepository _repository = new DashboardRepository();
  PaymentRepository _paymentRepository = new PaymentRepository();

  final _loading = BehaviorSubject<bool>();
  final _rentpopup = BehaviorSubject<bool>();
  final BehaviorSubject<DashboardResponseModel> _responsedata =
      BehaviorSubject<DashboardResponseModel>();
  final BehaviorSubject<FeaturedActorModel> _responseFeaturedActorData =
      BehaviorSubject<FeaturedActorModel>();
  final BehaviorSubject<LatestMovieResponseModel> _responseLatestMoviedata =
      BehaviorSubject<LatestMovieResponseModel>();
  final BehaviorSubject<TopMovieResponseModel> _responseTopMoviedata =
      BehaviorSubject<TopMovieResponseModel>();
  final BehaviorSubject<RentResponseModel> _responseRentMoviedata =
      BehaviorSubject<RentResponseModel>();
  final BehaviorSubject<RentalMovieResponseModel> _responseRentalMoviedata =
      BehaviorSubject<RentalMovieResponseModel>();
  final BehaviorSubject<RelatedMovieResponseModel> _responseRelatedMovieData =
      BehaviorSubject<RelatedMovieResponseModel>();
  final BehaviorSubject<RecomendedMovieResponseModel>
      _responseRecomendedMoviedata =
      BehaviorSubject<RecomendedMovieResponseModel>();
  final BehaviorSubject<PersonalizedMovieResponseModel>
      _responsePersonalizedMovieListData =
      BehaviorSubject<PersonalizedMovieResponseModel>();
  final BehaviorSubject<FeaturedMovieResponseModel> _responseFeaturedMovieData =
      BehaviorSubject<FeaturedMovieResponseModel>();
  final BehaviorSubject<MovieCastResponseModel> _responseMovieCastData =
      BehaviorSubject<MovieCastResponseModel>();

  final _cardnumber = BehaviorSubject<String>();
  final _month = BehaviorSubject<String>();
  final _year = BehaviorSubject<String>();
  final _cvv = BehaviorSubject<String>();

  final String defaultErrorMessage = 'Something went wrong';

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
      CustomToast.show(ret.message ?? '');
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
      CustomToast.show(ret.message ?? defaultErrorMessage);
    }
  }

  void dashboardLatestMovie(context) async {
    _setLoading(true);
    final ret = await _repository.latestmovie(context);
    print(ret);

    _setLoading(false);

    if (ret.status == "200") {
      if (ret.statusResult == 'Success' || ret.statusResult == 'SUCCESS') {
        // _responseLatestMoviedata.sink.add(ret);
        // CustomToast.show(ret.message.toString());
      } else {
        print(ret.toString());
        CustomToast.show(ret.message.toString());
      }
    } else {
      CustomToast.show(ret.message ?? defaultErrorMessage);
    }
  }

  void dashboardAllData(context) async {
    _setLoading(true);
    final ret = await _repository.allData(context);
    print(ret.banners);
    _setLoading(false);
    if (ret.status == "200") {
      if (ret.statusResult == 'Success' || ret.statusResult == 'SUCCESS') {
        _responseLatestMoviedata.sink.add(ret.latestMoviesResponseModel);
        _responsedata.sink.add(ret);
        _responseTopMoviedata.sink.add(ret.topMoviesResponseModel);
        _responseRentalMoviedata.sink.add(ret.rentalMoviesResponseModel);
        _responseRecomendedMoviedata.sink
            .add(ret.recommendedMoviesResponseModel);
        _responsePersonalizedMovieListData.sink
            .add(ret.personalizedMovieResponseModel);
        _responseFeaturedMovieData.sink.add(ret.featuredMovieResponseModel);
        // CustomToast.show(ret.message.toString());
      } else {
        CustomToast.show(ret.message.toString());
      }
    } else {
      CustomToast.show(ret.message ?? defaultErrorMessage);
    }
  }

  void featuredActors(context) async {
    _setLoading(true);
    final ret = await _repository.featuredActors(context);
    // ret.actors.forEach((element) {print(element.toJson());});
    _setLoading(false);
    if (ret.status == "200") {
      if (ret.statusResult == 'Success' || ret.statusResult == 'SUCCESS') {
        _responseFeaturedActorData.sink.add(ret);
      } else {
        CustomToast.show(ret.message.toString());
      }
    } else {
      CustomToast.show(ret.message ?? defaultErrorMessage);
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
      CustomToast.show(ret.message ?? defaultErrorMessage);
    }
  }

  void relatedMovies(context, movieId) async {
    _setLoading(true);
    final ret = await _repository.relatedMovies(context, movieId);
    _setLoading(false);
    if (ret.status == "200") {
      if (ret.statusResult == 'Success' || ret.statusResult == 'SUCCESS') {
        _responseRelatedMovieData.sink.add(ret);
      } else {
        print(ret.toString());
        CustomToast.show(ret.message.toString());
      }
    } else {
      CustomToast.show(ret.message ?? defaultErrorMessage);
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
      } else {
        print(ret.toString());
        CustomToast.show(ret.message.toString());
      }
    } else {
      CustomToast.show(ret.message ?? defaultErrorMessage);
    }
  }

  void recommendedMovies(context) async {
    _setLoading(true);
    final ret = await _repository.recommendedMovies(context);
    _setLoading(false);
    if (ret.status == "200") {
      if (ret.statusResult == 'Success' || ret.statusResult == 'SUCCESS') {
        _responseRecomendedMoviedata.sink.add(ret);
        // CustomToast.show(ret.message ?? defaultErrorMessage.toString());
      } else {
        print(ret.toString());
        CustomToast.show(ret.message ?? defaultErrorMessage.toString());
      }
    } else {
      CustomToast.show(ret.message ?? defaultErrorMessage);
    }
  }

  void getCardList(context) async {
    _setLoading(true);
    final ret = await _paymentRepository.cardList(context);
    _setLoading(false);
    if (ret.status == "200") {
      if (ret.status == 'Success' || ret.status == 'SUCCESS') {
        _responseCardListData.sink.add(ret);
      } else {}
    } else {
      CustomToast.show(ret.message ?? defaultErrorMessage);
    }
  }

  Future<CardListResponse> getCardListPayLoad(context) async {
    _setLoading(true);
    final ret = await _paymentRepository.cardList(context);
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

  void addNewCard(context, cardDetails) async {
    _setLoading(true);
    final ret = await _paymentRepository.addNewCard(context, cardDetails);
    _setLoading(false);
    if (ret.status == "200") {
      if (ret.status == 'Success' || ret.status == 'SUCCESS') {
        CustomToast.show('Card has been added successfully');
        getCardList(context);
      } else {}
    } else {
      CustomToast.show(ret.message ?? defaultErrorMessage);
    }
  }

  void movieCast(context, movieId) async {
    _setLoading(true);
    final ret = await _repository.movieCast(context, movieId);
    _setLoading(false);
    print("@bloc 1 $ret");
    if (ret.status == "200") {
      if (ret.statusResult == 'Success' || ret.statusResult == 'SUCCESS') {
        _responseMovieCastData.sink.add(ret);
        print("@bloc 2 $ret");
      } else {
        print(ret.toString());
        CustomToast.show(ret.message.toString());
      }
    } else {
      CustomToast.show(ret.message ?? defaultErrorMessage);
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
  BehaviorSubject<FeaturedActorModel> get featuredActorModel =>
      _responseFeaturedActorData.stream;
  BehaviorSubject<PersonalizedMovieResponseModel>
      get personalizedMovieListData =>
          _responsePersonalizedMovieListData.stream;
  BehaviorSubject<FeaturedMovieResponseModel> get featuredMovieResponseModel =>
      _responseFeaturedMovieData.stream;
  final BehaviorSubject<CardListResponse> _responseCardListData =
      BehaviorSubject<CardListResponse>();
  BehaviorSubject<CardListResponse> get cardListData =>
      _responseCardListData.stream;
  BehaviorSubject<RelatedMovieResponseModel> get relatedMovieList =>
      _responseRelatedMovieData.stream;
  BehaviorSubject<MovieCastResponseModel> get movieCastData =>
      _responseMovieCastData.stream;

  void dispose() {
    _loading.close();
    _responsedata.close();
    _responseLatestMoviedata.close();
    _responseTopMoviedata.close();
    _rentpopup.close();
    _responseRentMoviedata.close();
    _responseRentalMoviedata.close();
    _responseRecomendedMoviedata.close();
    _responseCardListData.close();
    _responsePersonalizedMovieListData.close();
    _responseFeaturedMovieData.close();
    _responseFeaturedActorData.close();
    _responseRelatedMovieData.close();
    _responseMovieCastData.close();
    _cardnumber.close();
    _month.close();
    _year.close();
    _cvv.close();
  }
}
