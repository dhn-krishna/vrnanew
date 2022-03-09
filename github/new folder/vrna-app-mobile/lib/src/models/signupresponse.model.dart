class SignupResponseModel {
  int status = 400;
  String statusResult = "";
  String message = "";
  dynamic data;

  SignupResponseModel(
      { this.status, this.statusResult, this.message, this.data});
  // static List<ResponseModel> fromJsonList(List<dynamic> json) => json.map((i) => fromJson(i)).toList();

  // static ResponseModel fromJson(Map<String, dynamic> json) {
  //   return ResponseModel(
  //     status: json["statusCode"] as int,
  //     statusResult: json["status"] as String,
  //     message:json["message"] as String,
  //     data:json[]
  //   );
  // }
}
