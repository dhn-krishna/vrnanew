import 'base_url.dart' as BASE_URL;

class _Login {
  final auth = BASE_URL.auth;
  final forgotPasswordGetMail = BASE_URL.forgotPasswordGetMail;
  final forgotPassword = BASE_URL.forgotPassword;
}

class _Signup {
  final registration = BASE_URL.registration;
  final registrationverify = BASE_URL.registrationverify;
}

class _Dashboard {
  final dashboardbanner = BASE_URL.dashboardbanner;
  final dashboardLatestMovie = BASE_URL.dashboardLatestMovie;
  final dashboardTopMovie = BASE_URL.dashboardTopMovie;
  final rentCard = BASE_URL.rentCard;
  final rentProcess = BASE_URL.rentProcess;
  final rentPayment = BASE_URL.rentPayment;
  final rentalMovie = BASE_URL.rentalMovie;
  final recomendedMovie = BASE_URL.recomendedMovie;
}

class _Filter {
  final filterdata = BASE_URL.filter;
}

class _Profile {
  final getProfile = BASE_URL.getProfile;
  final updateProfile = BASE_URL.updateProfile;
}

class _MyList {
  final list = BASE_URL.base + "/api/list";
}

final login = _Login();
final signup = _Signup();
final dashboard = _Dashboard();
final filter = _Filter();
final profile = _Profile();
final myList = _MyList();
