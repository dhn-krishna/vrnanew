import 'package:flutter/material.dart' hide Card;
import 'package:vrna_app_mobile/src/helpers/utils/commonutils.dart';
import 'package:vrna_app_mobile/src/models/payment/Card.dart';
import 'package:vrna_app_mobile/src/models/profile.model.dart';
import 'package:vrna_app_mobile/src/pages/profile/profile.page.dart';
import 'package:vrna_app_mobile/src/repositories/payment.repository.dart';
import 'package:vrna_app_mobile/src/repositories/profile.repository.dart';
import 'package:vrna_app_mobile/src/widgets/toast.dart';
import 'package:rxdart/rxdart.dart';

class ProfileBloc {
  ProfileRepository _repository = new ProfileRepository();
  PaymentRepository _paymentRepository = new PaymentRepository();

  final _loading = BehaviorSubject<bool>();
  final _userId = BehaviorSubject<int>();
  final _roleId = BehaviorSubject<int>();
  final _password = BehaviorSubject<String>();
  final _partner = BehaviorSubject<bool>();
  final _customer = BehaviorSubject<bool>();
  final _agent = BehaviorSubject<bool>();
  final _admin = BehaviorSubject<bool>();
  final _firstName = BehaviorSubject<String>();
  final _middleName = BehaviorSubject<String>();
  final _lastName = BehaviorSubject<String>();
  final _gender = BehaviorSubject<String>();
  final _dob = BehaviorSubject<String>();
  final _email = BehaviorSubject<String>();
  final _mobile = BehaviorSubject<String>();
  final _nationality = BehaviorSubject<String>();
  final _addressLine1 = BehaviorSubject<String>();
  final _addressLine2 = BehaviorSubject<String>();
  final _area = BehaviorSubject<String>();
  final _state = BehaviorSubject<String>();
  final _country = BehaviorSubject<String>();
  final _pinCode = BehaviorSubject<String>();
  final _preferredLanguage = BehaviorSubject<String>();
  final BehaviorSubject<List<Card>> _cardList = BehaviorSubject<List<Card>>();
  final _newCardNo = BehaviorSubject<String>();
  final _newCardExpMonth = BehaviorSubject<String>();
  final _newCardExpYear = BehaviorSubject<String>();
  final _newCardCVV = BehaviorSubject<String>();
  final String defaultErrorMesage = 'Something went wrong';

  Stream<bool> get loading => _loading.stream;
  void _setLoading(bool value) => _loading.sink.add(value);

  Stream<int> get userId => _userId.stream;
  void setUserId(int value) => _userId.sink.add(value);

  Stream<int> get roleId => _roleId.stream;
  void setRoleId(int value) => _roleId.sink.add(value);

  Stream<String> get firstName => _firstName.stream;
  void setFirstName(String value) => _firstName.sink.add(value);

  Stream<String> get middleName => _middleName.stream;
  void setMiddleName(String value) => _middleName.sink.add(value);

  Stream<String> get lastName => _lastName.stream;
  void setLastName(String value) => _lastName.sink.add(value);

  Stream<String> get gender => _gender.stream;
  void setGender(String value) => _gender.sink.add(value);

  Stream<String> get dob => _dob.stream;
  void setDob(String value) => _dob.sink.add(value);

  Stream<String> get email => _email.stream;
  void setEmail(String value) => _email.sink.add(value);

  Stream<String> get mobile => _mobile.stream;
  void setMobile(String value) => _mobile.sink.add(value);

  Stream<String> get nationality => _nationality.stream;
  void setNationality(String value) => _nationality.sink.add(value);

  Stream<String> get addressLine1 => _addressLine1.stream;
  void setAddressLine1(String value) => _addressLine1.sink.add(value);

  Stream<String> get addressLine2 => _addressLine2.stream;
  void setAddressLine2(String value) => _addressLine2.sink.add(value);

  Stream<String> get area => _area.stream;
  void setArea(String value) => _area.sink.add(value);

  Stream<String> get stateData => _state.stream;
  void setStateData(String value) => _state.sink.add(value);

  Stream<String> get country => _country.stream;
  void setCountry(String value) => _country.sink.add(value);

  Stream<String> get pinCode => _pinCode.stream;
  void setPinCode(String value) => _pinCode.sink.add(value);

  Stream<String> get preferredLanguage => _pinCode.stream;
  void setPreferredLanguage(String value) => _preferredLanguage.sink.add(value);

  Stream<List<Card>> get cardList => _cardList.stream;
  void setCardList(List<Card> value) => _cardList.sink.add(value);

  Stream<String> get newCardNo => _newCardNo.stream;
  void setNewCardNo(String value) => _newCardNo.sink.add(value);

  Stream<String> get newCardExpMonth => _newCardExpMonth.stream;
  void setNewCardExpMonth(String value) =>
      {print("@bloc $value"), _newCardExpMonth.sink.add(value)};

  Stream<String> get newCardExpYear => _newCardExpYear.stream;
  void setNewCardExpYear(String value) => _newCardExpYear.sink.add(value);

  Stream<String> get newCardCVV => _newCardCVV.stream;
  void setNewCardCVV(String value) => _newCardCVV.sink.add(value);

  void getProfile(context) async {
    _setLoading(true);
    final ret = await _repository.getProfile(context);
    _setLoading(false);
    if (ret.status == "200") {
      if (ret.statusResult == 'Success' || ret.statusResult == 'SUCCESS') {
        _firstName.sink.add(ret.firstName ?? '');
        _lastName.sink.add(ret.lastName ?? '');
        _middleName.sink.add(ret.middleName ?? '');
        _userId.sink.add(ret.userId);
        _roleId.sink.add(ret.roleId);
        _customer.sink.add(ret.customer);
        _agent.sink.add(ret.agent);
        _partner.sink.add(ret.partner);
        _admin.sink.add(ret.admin);
        _password.sink.add(ret.password ?? '');
        _dob.sink.add(ret.dob ?? '');
        _mobile.sink.add(ret.mobile ?? '');
        _email.sink.add(ret.email ?? '');
        _addressLine1.sink.add(ret.address1 ?? '');
        _addressLine2.sink.add(ret.address2 ?? '');
        _area.sink.add(ret.area ?? '');
        _country.sink.add(ret.country ?? 'india');
        _nationality.sink.add(ret.nationality ?? 'indian');
        _state.sink.add(ret.state ?? '');
        _pinCode.sink.add(ret.zipcode ?? '');
        _preferredLanguage.sink.add(ret.prefferedLanguages ?? 'english');
        _newCardCVV.sink.add('');
        var currentDate = DateTime.now();
        _newCardExpYear.sink.add('${currentDate.year}');
        _newCardExpMonth.sink.add(CommonUtils.months[currentDate.month - 1]);
        _newCardNo.sink.add('');
        _cardList.sink.add(ret.cardList);
        //_responsedata.sink.add(ret);
        // CustomToast.show(ret.message.toString());
      } else {
        CustomToast.show(ret.message.toString());
      }
    } else {
      CustomToast.show(ret.message ?? defaultErrorMesage);
    }
  }

  void updateProfile(context) async {
    _setLoading(true);
    Profile profile = new Profile(
        userId: _userId.valueWrapper.value,
        roleId: _roleId.valueWrapper.value,
        password: _password.valueWrapper.value,
        firstName: _firstName.valueWrapper.value,
        middleName: _middleName.valueWrapper.value,
        lastName: _lastName.valueWrapper.value,
        mobile: _mobile.valueWrapper.value,
        email: _email.valueWrapper.value,
        dob: _dob.valueWrapper.value,
        nationality: _nationality.valueWrapper.value,
        address1: _addressLine1.valueWrapper.value,
        address2: _addressLine2.valueWrapper.value,
        area: _area.valueWrapper.value,
        state: _state.valueWrapper.value,
        country: _country.valueWrapper.value,
        zipcode: _pinCode.valueWrapper.value,
        prefferedLanguages: _preferredLanguage.valueWrapper.value,
        customer: _customer.valueWrapper.value,
        agent: _agent.valueWrapper.value,
        partner: _partner.valueWrapper.value,
        admin: _admin.valueWrapper.value);
    final ret = await _repository.updateProfile(context, profile);
    _setLoading(false);
    if (ret.status == 'Success') {
      CustomToast.show('Profile has been successfully updated');
    } else {
      CustomToast.show(ret.message ?? defaultErrorMesage);
    }
  }

  void updatePersonalInfo(context) async {
    _setLoading(true);
    final ret = await _repository.personalInfoUpdate(
        context,
        _firstName.value.toString(),
        _middleName.value.toString(),
        _lastName.value.toString());
    _setLoading(false);
    if (ret.status == "200") {
      if (ret.statusResult == 'Success' || ret.statusResult == 'SUCCESS') {
        CustomToast.show(ret.message.toString());
        _firstName.sink.add(ret.firstName);
        _lastName.sink.add(ret.lastName);
        _middleName.sink.add(ret.middleName);
      } else {
        CustomToast.show(ret.message.toString());
      }
    } else {
      CustomToast.show(ret.message ?? defaultErrorMesage);
    }
  }

  void updateAddress(context) async {
    _setLoading(true);
    final ret = await _repository.addressUpdate(
        context,
        _addressLine1.value.toString(),
        _addressLine2.value.toString(),
        _area.value.toString(),
        _state.value.toString(),
        _country.value.toString(),
        _pinCode.value.toString());
    _setLoading(false);
    if (ret.status == "200") {
      if (ret.statusResult == 'Success' || ret.statusResult == 'SUCCESS') {
        CustomToast.show(ret.message.toString());
        _addressLine1.sink.add(ret.address1);
        _addressLine2.sink.add(ret.address2);
        _area.sink.add(ret.area);
        _state.sink.add(ret.state);
        _country.sink.add(ret.country);
        _pinCode.sink.add(ret.zipcode);
      } else {
        CustomToast.show(ret.message.toString());
      }
    } else {
      CustomToast.show(ret.message ?? defaultErrorMesage);
    }
  }

  void addNewCard(context) async {
    _setLoading(true);
    Card card = Card(
      cardNo: _newCardNo.valueWrapper.value,
      expiryYear: _newCardExpYear.valueWrapper.value,
      expiryMonth: _newCardExpMonth.valueWrapper.value,
      secretPin: _newCardCVV.valueWrapper.value,
    );
    var ret = await _paymentRepository.addNewCard(context, card);
    _setLoading(false);
    if (ret.statusCode == "200") {
      if (ret.status == 'Success' || ret.status == 'SUCCESS') {
        CustomToast.show('Card has been successfully added');
        Route route = MaterialPageRoute(builder: (context) => ProfilePage());
        Navigator.pushReplacement(context, route);
      } else {
        CustomToast.show(ret.message ?? defaultErrorMesage);
      }
    } else {
      CustomToast.show(ret.message ?? defaultErrorMesage);
    }
  }

  void deleteSavedCard(context, Card card) async {
    _setLoading(true);
    var ret = await _paymentRepository.deleteSavedCard(context, card);
    _setLoading(false);
    if (ret.statusCode == "200") {
      if (ret.status == 'Success' || ret.status == 'SUCCESS') {
        CustomToast.show('Card has been successfully deleted');
        Route route = MaterialPageRoute(builder: (context) => ProfilePage());
        Navigator.pushReplacement(context, route);
      } else {
        CustomToast.show(ret.message ?? defaultErrorMesage);
      }
    } else {
      CustomToast.show(ret.message ?? defaultErrorMesage);
    }
  }

  void dispose() {
    // _loading.close();
    // _firstName.close();
    // _middleName.close();
    // _lastName.close();
    // _dob.close();
    // _gender.close();
    // _email.close();
    // _mobile.close();
    // _nationality.close();
    // _addressLine1.close();
    // _addressLine2.close();
    // _area.close();
    // _state.close();
    // _country.close();
    // _pinCode.close();
    // _newCardCVV.close();
    // _newCardExpYear.close();
    // _newCardExpMonth.close();
    // _newCardNo.close();
    // _cardList.close();
  }
}
