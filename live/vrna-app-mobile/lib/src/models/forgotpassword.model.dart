class ForgotPasswordResponseModel {
  int status = 400;
  String statusResult = "";
  String message = "";
  dynamic data;
  ForgotPasswordResponseModel(
      {this.status, this.statusResult, this.message, this.data});
}
