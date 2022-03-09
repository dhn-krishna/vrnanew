class SearchSuggestionResponse {
  String status;
  String statusCode;
  String message;
  List<String> data;

  SearchSuggestionResponse(
      {this.status,
      this.statusCode,
      this.message,
      this.data});

  SearchSuggestionResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'].cast<String>();
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