import 'package:vrna_app_mobile/src/models/payment/Card.dart';

class Profile {
  String status;
  String statusResult;
  String message;
  int userId;
  int roleId;
  String password;
  bool partner;
  bool admin;
  bool customer;
  bool agent;
  String firstName;
  String lastName;
  String middleName;
  String mobile;
  String email;
  String address1;
  String address2;
  String country;
  String area;
  String state;
  String zipcode;
  String dob;
  String gender;
  String nationality;
  String prefferedLanguages;
  List<Card> cardList;
  // List<ProfileDetails> data;
  Profile(
      {this.status,
      this.statusResult,
      this.message,
      this.userId,
      this.roleId,
      this.password,
      this.partner,
      this.admin,
      this.customer,
      this.agent,
      this.firstName,
      this.lastName,
      this.middleName,
      this.email,
      this.mobile,
      this.address1,
      this.address2,
      this.country,
      this.area,
      this.state,
      this.zipcode,
      this.dob,
      this.gender,
      this.nationality,
      this.prefferedLanguages,
      this.cardList});
  Profile.fromJson(Map<String, dynamic> json) {
    status = json["statusCode"];
    statusResult = json["status"];
    message = json["message"];
    userId = json["userId"] != null ? json["userId"] : "";
    roleId = json["roleId"] != null ? json["roleId"] : "";
    partner = json["partner"] != null ? json["partner"] : "";
    admin = json["admin"] != null ? json["admin"] : "";
    firstName = json["firstName"] != null ? json["firstName"] : '';
    middleName = json["middleName"] != null ? json["middleName"] : '';
    lastName = json["lastName"] != null ? json["lastName"] : '';
    email = json['email'] != null ? json['email'] : '';
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
    prefferedLanguages =
        json["prefferedLanguages"] != null ? json["prefferedLanguages"] : '';
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
