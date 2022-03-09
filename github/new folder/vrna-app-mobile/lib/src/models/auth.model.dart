class AuthModel {
  final int statusCode;
  final String status;
  final String message;

  AuthModel({this.statusCode, this.status, this.message});

  // static List<AuthModel> fromJsonList(List<dynamic> json) =>
  //     json.map((i) => fromJson(i)).toList();

  static AuthModel fromJson(Map<String, dynamic> json) {
    return AuthModel(
        statusCode: json["statusCode"] as int,
        status: json["status"] as String,
        message: json['message'] as String);
  }
}
