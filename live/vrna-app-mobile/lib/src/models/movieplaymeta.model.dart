class MoviePlayMeta {
  String status;
  String statusCode;
  var message;
  String cloudFrontPolicy;
  String cloudFrontSignature;
  String cloudFrontKeyPairId;
  Data data;
  String movieUrl;

  MoviePlayMeta(
      {this.status,
      this.statusCode,
      this.message,
      this.movieUrl,
      this.cloudFrontPolicy,
      this.cloudFrontSignature,
      this.cloudFrontKeyPairId,
      this.data});

  MoviePlayMeta.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['statusCode'];
    message = json['message'];
    // cloudFrontPolicy = json['cloudFrontPolicy'];
    // cloudFrontSignature = json['cloudFrontSignature'];
    // cloudFrontKeyPairId = json['cloudFrontKeyPairId'];    
    // data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    // data['cloudFrontPolicy'] = this.cloudFrontPolicy;
    // data['cloudFrontSignature'] = this.cloudFrontSignature;
    // data['cloudFrontKeyPairId'] = this.cloudFrontKeyPairId;
    // data['movieUrl'] = this.movieUrl;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  String uRL;

  Data({this.uRL});

  Data.fromJson(Map<String, dynamic> json) {
    uRL = json['URL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['URL'] = this.uRL;
    return data;
  }
}
