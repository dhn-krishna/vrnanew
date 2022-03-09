class ContactUsResponseModel {
  int status = 400;
  String statusResult = "";
  String message = "";
  dynamic data;

  ContactUsResponseModel(
      { this.status, this.statusResult, this.message, this.data});
}
