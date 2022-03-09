import 'package:vrna_app_mobile/src/helpers/connection.helper.dart';
import 'package:vrna_app_mobile/src/models/dashboardresponse.model.dart';
import 'package:vrna_app_mobile/src/repositories/sources/network/dashboard/dashboard.service.dart';
import 'package:vrna_app_mobile/src/repositories/sources/network/dashboard/latestmovies.service.dart';
import 'package:vrna_app_mobile/src/repositories/sources/network/dashboard/topmovies.service.dart';
import 'package:vrna_app_mobile/src/repositories/sources/network/dashboard/rent.service.dart';
import 'package:vrna_app_mobile/src/repositories/sources/network/dashboard/recomended.service.dart';

class DashboardRepository {
  DashboardService api = DashboardService();
  LatestMoviesService latestMovieApi = LatestMoviesService();
  TopMoviesService topMovieApi = TopMoviesService();
  RentService rentApi = RentService();
  RecomendedService recomendedApi = RecomendedService();

  Future<DashboardResponseModel> dashboardbanner(context) async {
    DashboardResponseModel response = DashboardResponseModel();

    final hasConnection = await ConnectionHelper.hasConnection();

    if (hasConnection) {
      response = await this.api.dashboardbanner(context);
    } else {
      response.message = "Device offline";
    }

    return response;
  }

  Future<LatestMovieResponseModel> latestmovie(context) async {
    LatestMovieResponseModel latestMovieResponse = LatestMovieResponseModel();

    final hasConnection = await ConnectionHelper.hasConnection();

    if (hasConnection) {
      latestMovieResponse = await this.latestMovieApi.latestmovie(context);
    } else {
      latestMovieResponse.message = "Device offline";
    }

    return latestMovieResponse;
  }

  Future<TopMovieResponseModel> topmovie(context) async {
    TopMovieResponseModel topMovieResponse = TopMovieResponseModel();

    final hasConnection = await ConnectionHelper.hasConnection();

    if (hasConnection) {
      topMovieResponse = await this.topMovieApi.topmovie(context);
    } else {
      topMovieResponse.message = "Device offline";
    }
    return topMovieResponse;
  }

  Future<RentResponseModel> addrent(context, String cardnumber, String cvv,
      String month, String year, String amount, int movieId) async {
    RentResponseModel rentResponse = RentResponseModel();

    final hasConnection = await ConnectionHelper.hasConnection();

    if (hasConnection) {
      rentResponse = await this
          .rentApi
          .rentmovie(context, cardnumber, cvv, month, year, amount, movieId);
    } else {
      rentResponse.message = "Device offline";
    }
    return rentResponse;
  }

  Future<RentalMovieResponseModel> rentalMovies(context) async {
    RentalMovieResponseModel rentalMoviesResponse = RentalMovieResponseModel();

    final hasConnection = await ConnectionHelper.hasConnection();

    if (hasConnection) {
      rentalMoviesResponse = await this.rentApi.rentalMovies(context);
    } else {
      rentalMoviesResponse.message = "Device offline";
    }
    return rentalMoviesResponse;
  }

  Future<RecomendedMovieResponseModel> recomendedMovies(context) async {
    RecomendedMovieResponseModel rentalMoviesResponse =
        RecomendedMovieResponseModel();

    final hasConnection = await ConnectionHelper.hasConnection();

    if (hasConnection) {
      rentalMoviesResponse = await this.recomendedApi.recomendedMovies(context);
    } else {
      rentalMoviesResponse.message = "Device offline";
    }
    return rentalMoviesResponse;
  }
}
