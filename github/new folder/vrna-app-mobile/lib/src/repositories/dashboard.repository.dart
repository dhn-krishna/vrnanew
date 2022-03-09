import 'package:vrna_app_mobile/src/helpers/connection.helper.dart';
import 'package:vrna_app_mobile/src/models/dashboardresponse.model.dart';
import 'package:vrna_app_mobile/src/models/featuredActor.model.dart';
import 'package:vrna_app_mobile/src/models/moviecast.model.dart';
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

  Future<FeaturedActorModel> featuredActors(context) async {
    FeaturedActorModel featuredActorModel = FeaturedActorModel();
    final hasConnection = await ConnectionHelper.hasConnection();
    if (hasConnection) {
      featuredActorModel = await this.api.featuredActors(context);
    } else {
      featuredActorModel.message = "Device offline";
    }
    return featuredActorModel;
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

  Future<RelatedMovieResponseModel> relatedMovies(context, movieId) async {
    RelatedMovieResponseModel relatedMovieResponseModel = RelatedMovieResponseModel();
    final hasConnection = await ConnectionHelper.hasConnection();
    if (hasConnection) {
      relatedMovieResponseModel = await this.api.relatedMovies(context, movieId);
    } else {
      relatedMovieResponseModel.message = "Device offline";
    }
    return relatedMovieResponseModel;
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

  Future<RecomendedMovieResponseModel> recommendedMovies(context) async {
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

  Future<DashboardResponseModel> allData(context) async {
    DashboardResponseModel response = DashboardResponseModel();

    final hasConnection = await ConnectionHelper.hasConnection();

    if (hasConnection) {
      response = await this.api.dashboard(context);
    } else {
      response.message = "Device offline";
    }

    return response;
  }

  Future<MovieCastResponseModel> movieCast(context, movieId) async {
    MovieCastResponseModel movieCastResponseModel = MovieCastResponseModel();
    final hasConnection = await ConnectionHelper.hasConnection();
    if (hasConnection) {
      movieCastResponseModel = await this.api.movieCast(context, movieId);
    } else {
      movieCastResponseModel.message = "Device offline";
    }
    return movieCastResponseModel;
  }
}
