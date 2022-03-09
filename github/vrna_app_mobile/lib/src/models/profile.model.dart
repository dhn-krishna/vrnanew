class ProfileResponseModel {
  String status;
  String statusResult;
  String message;
  String firstName;
  String lastName;
  String middleName;
  String mobile;
  String address1;
  String address2;
  String country;
  String area;
  String state;
  String zipcode;
  String dob;
  String gender;
  String nationality;
  // List<ProfileDetails> data;
  ProfileResponseModel(
      {this.status,
      this.statusResult,
      this.message,
      this.firstName,
      this.lastName,
      this.middleName,
      this.mobile,
      this.address1,
      this.address2,
      this.country,
      this.area,
      this.state,
      this.zipcode,
      this.dob,
      this.gender,
      this.nationality});
  ProfileResponseModel.fromJson(Map<String, dynamic> json) {
    status = json["statusCode"];
    statusResult = json["status"];
    message = json["message"];
    firstName = json["firstName"] != null ? json["firstName"] : '';
    middleName = json["middleName"] != null ? json["middleName"] : '';
    lastName = json["lastName"] != null ? json["lastName"] : '';
    mobile = json["mobile"] != null ? json["mobile"] : '';
    address1 = json["address1"] != null ? json["address1"] : '';
    address2 = json["address2"] != null ? json["address2"] : '';
    country = json["country"] != null ? json["country"] : '';
    area = json["area"] != null ? json["area"] : '';
    state = json["state"] != null ? json["state"] : '';
    zipcode = json["zipcode"] != null ? json["zipcode"] : '';
    dob = json["dob"] != null ? json["dob"] : '';
    gender = json["gender"] != null ? json["gender"] : '';
    nationality = json["nationality"] != null ? json["nationality"] : '';
    // data = (json["data"] as List)
    //     .map((i) => new ProfileDetails.fromJson(i))
    //     .toList();
  }
}

class ProfileDetails {
  String firstName;
  String lastName;
  String middleName;
  String mobile;
  String address1;
  String address2;
  String country;
  String dob;
  String gender;
  String nationality;

  ProfileDetails(
      {this.firstName,
      this.lastName,
      this.middleName,
      this.mobile,
      this.address1,
      this.address2,
      this.country,
      this.dob,
      this.gender,
      this.nationality});

  ProfileDetails.fromJson(Map<String, dynamic> json) {
    firstName = json["firstName"] != null ? json["firstName"] : '';
    middleName = json["middleName"] != null ? json["middleName"] : '';
    lastName = json["lastName"] != null ? json["lastName"] : '';
    mobile = json["mobile"] != null ? json["mobile"] : '';
    address1 = json["address1"] != null ? json["address1"] : '';
    address2 = json["address2"] != null ? json["address2"] : '';
    country = json["country"] != null ? json["country"] : '';
    dob = json["dob"] != null ? json["dob"] : '';
    gender = json["gender"] != null ? json["gender"] : '';
    nationality = json["nationality"] != null ? json["nationality"] : '';
  }
}
