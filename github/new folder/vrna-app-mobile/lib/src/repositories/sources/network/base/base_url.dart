/*final auth = base + "/auth-service/user/validate";
final registration = base + "/auth-service/user/signup";
final registrationverify = base + "/support-service/support/email";
final dashboardbanner = base + "/intelligence-service/intelligence/banner";
final dashboardLatestMovie = base + "/intelligence-service/intelligence/latest";
final dashboardTopMovie = base + "/intelligence-service/intelligence/toprated";
final rentCard = base + "/payment-service/payment/addCustomerCard";
final rentProcess = base + "/payment-service/payment/processPayment";
final rentPayment = base + "/subscription-service/paidMovie/addPayment";
final rentalMovie = base + "/intelligence-service/intelligence/rented";
final recomendedMovie = base + "/intelligence-service/intelligence/recommend";
final filter = base + "/content-service/movie";
final getProfile = base + "/auth-service/user";
final updateProfile = base + "/auth-service/user/update";
final forgotPassword = base + "/auth-service/user/forgot";
final forgotPasswordGetMail = base + "/support-service/support/password";*/
// final base(prod) = "http://ec2-3-21-205-116.us-east-2.compute.amazonaws.com:8089";
// final base = "https://prod.vrnaplex.com";

final auth = base + "/orch-service/vrnaflow/login";
final registration = base + "/orch-service/vrnaflow/signup";
final registrationverify = base + "/support-service/support/email";
final dashboard = base + "/orch-service/vrnaflow/gohome";
final featuredActors = base + "/content-service/cast/featured";
final dashboardbanner = base + "/intelligence-service/intelligence/banner";
final dashboardLatestMovie = base + "/intelligence-service/intelligence/latest";
final dashboardTopMovie = base + "/intelligence-service/intelligence/toprated";
final cardList = base + "/payment-service/payment/cardinfo";
final addNewCard = base + "/payment-service/payment/addCustomerCard";
final deleteSavedCard = base + '/payment-service/payment/deleteCustomerCard';
final processPayment = base + "/orch-service/vrnaflow/processpayment";
final rentCard = base + "/payment-service/payment/addCustomerCard";
final rentProcess = base + "/payment-service/payment/processPayment";
final rentPayment = base + "/subscription-service/paidMovie/addPayment";
final rentalMovie = base + "/intelligence-service/intelligence/rented";
final recomendedMovie = base + "/intelligence-service/intelligence/recommend";
final relatedMovies = base + "/orch-service/vrnaflow/morelikethis";
final movieCast = base + "/orch-service/vrnaflow/moviecast";
final getMovieUrl = base + "/orch-service/vrnaflow/getmovieurl";
final filter = base + "/content-service/movie";
final getProfile = base + "/orch-service/vrnaflow/profile";
final updateProfile = base + "/auth-service/user/update";
final forgotPassword = base + "/orch-service/vrnaflow/forgotpassword";
final updatePassword = base + "/auth-service/user/updpass";
// final forgotPasswordGetMail = base + "/support-service/support/password";
final contactUs = base + "/support-service/support/query";
final actorDetails = base + "/content-service/cast/";
final moviesByActor = base + "/content-service/movie/castmovies";
final rateMovie =
    base + "/content-service/movie/rating";
final search =
    base + "/orch-service/vrnaflow/search";
final searchSuggestion = base +
    "/content-service/movie/suggest";
final filterMovies =
    base + "/orch-service/vrnaflow/menu";
final base = "http://ec2-3-21-205-116.us-east-2.compute.amazonaws.com:8089";
