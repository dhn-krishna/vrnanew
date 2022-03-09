class ApiBaseResponse {
  String status;
  String statusCode;
  String message;
  String data;

  ApiBaseResponse({this.status, this.statusCode, this.message, this.data});

  ApiBaseResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    data['data'] = this.data;
    return data;
  }
}