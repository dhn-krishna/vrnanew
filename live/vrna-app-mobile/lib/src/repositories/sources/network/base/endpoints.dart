import 'base_url.dart' as BASE_URL;

class _Base {
  final base = BASE_URL.base;
}

class _Login {
  final auth = BASE_URL.auth;
  final forgotPassword = BASE_URL.forgotPassword;
  final updatePassword = BASE_URL.updatePassword;
}

class _Signup {
  final registration = BASE_URL.registration;
  final registrationverify = BASE_URL.registrationverify;
}

class _Dashboard {
  final dashboard = BASE_URL.dashboard;
  final dashboardbanner = BASE_URL.dashboardbanner;
  final dashboardLatestMovie = BASE_URL.dashboardLatestMovie;
  final dashboardTopMovie = BASE_URL.dashboardTopMovie;
  final rentCard = BASE_URL.rentCard;
  final rentProcess = BASE_URL.rentProcess;
  final rentPayment = BASE_URL.rentPayment;
  final rentalMovie = BASE_URL.rentalMovie;
  final recomendedMovie = BASE_URL.recomendedMovie;
  final relatedMovies = BASE_URL.relatedMovies;
  final featuredActors = BASE_URL.featuredActors;
}

class _MovieDetails {
  final movieCast = BASE_URL.movieCast;
  final moviePlay = BASE_URL.getMovieUrl;
  final rateMovie = BASE_URL.rateMovie;
  final addFav = BASE_URL.addFav;
  final getFav = BASE_URL.getFav;
}

class _Payment {
  final cardList = BASE_URL.cardList;
  final addNewCard = BASE_URL.addNewCard;
  final processPayment = BASE_URL.processPayment;
  final deleteSavedCard = BASE_URL.deleteSavedCard;
}

class _Filter {
  final filterdata = BASE_URL.filter;
  final filterMovies = BASE_URL.filterMovies;
}

class _Search {
  final search = BASE_URL.search;
  final searchSuggestion = BASE_URL.searchSuggestion;
}

class _Profile {
  final getProfile = BASE_URL.getProfile;
  final updateProfile = BASE_URL.updateProfile;
}

class _MyList {
  final list = BASE_URL.base + "/api/list";
}

class _ContactUs {
  final raiseSupportTicket = BASE_URL.contactUs;
}

class _castDetails {
  final actorDetails = BASE_URL.actorDetails;
  final moviesByCast = BASE_URL.moviesByActor;
}

final base = _Base();
final login = _Login();
final signup = _Signup();
final dashboard = _Dashboard();
final filter = _Filter();
final profile = _Profile();
final myList = _MyList();
final payment = _Payment();
final contactUs = _ContactUs();
final movieDetails = _MovieDetails();
final castDetails = _castDetails();
final search = _Search();
