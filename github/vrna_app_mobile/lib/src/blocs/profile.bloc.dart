import 'package:vrna_app_mobile/src/repositories/profile.repository.dart';
import 'package:vrna_app_mobile/src/widgets/toast.dart';
import 'package:rxdart/rxdart.dart';

class ProfileBloc {
  ProfileRepository _repository = new ProfileRepository();

  final _loading = BehaviorSubject<bool>();
  final _firstName = BehaviorSubject<String>();
  final _middleName = BehaviorSubject<String>();
  final _lastName = BehaviorSubject<String>();
  final _gender = BehaviorSubject<String>();
  final _dob = BehaviorSubject<String>();
  final _mobile = BehaviorSubject<String>();
  final _nationality = BehaviorSubject<String>();
  final _addressLine1 = BehaviorSubject<String>();
  final _addressLine2 = BehaviorSubject<String>();
  final _area = BehaviorSubject<String>();
  final _state = BehaviorSubject<String>();
  final _country = BehaviorSubject<String>();
  final _pinCode = BehaviorSubject<String>();

  Stream<bool> get loading => _loading.stream;
  void _setLoading(bool value) => _loading.sink.add(value);

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

  void getProfile(context) async {
    _setLoading(true);
    final ret = await _repository.getProfile(context);
    print(ret);
    _setLoading(false);

    if (ret.status == "200") {
      if (ret.statusResult == 'Success' || ret.statusResult == 'SUCCESS') {
        _firstName.sink.add(ret.firstName);
        _lastName.sink.add(ret.lastName);
        _middleName.sink.add(ret.middleName);
        _addressLine1.sink.add(ret.address1);
        _addressLine2.sink.add(ret.address2);
        _area.sink.add(ret.area);
        _country.sink.add(ret.country);
        _state.sink.add(ret.state);
        _pinCode.sink.add(ret.zipcode);
        //_responsedata.sink.add(ret);
        // CustomToast.show(ret.message.toString());
      } else {
        print(ret.toString());
        CustomToast.show(ret.message.toString());
      }
    } else {
      CustomToast.show(ret.message);
    }
  }

  void updatePersonalInfo(context) async {
    _setLoading(true);
    final ret = await _repository.personalInfoUpdate(
        context,
        _firstName.value.toString(),
        _middleName.value.toString(),
        _lastName.value.toString());
    print(ret);
    _setLoading(false);
    if (ret.status == "200") {
      if (ret.statusResult == 'Success' || ret.statusResult == 'SUCCESS') {
        CustomToast.show(ret.message.toString());
        _firstName.sink.add(ret.firstName);
        _lastName.sink.add(ret.lastName);
        _middleName.sink.add(ret.middleName);
      } else {
        print(ret.toString());
        CustomToast.show(ret.message.toString());
      }
    } else {
      CustomToast.show(ret.message);
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
    print(ret);
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
        print(ret.toString());
        CustomToast.show(ret.message.toString());
      }
    } else {
      CustomToast.show(ret.message);
    }
  }

  void dispose() {
    _loading.close();
    _firstName.close();
    _middleName.close();
    _lastName.close();
    _dob.close();
    _gender.close();
    _mobile.close();
    _nationality.close();
    _addressLine1.close();
    _addressLine2.close();
    _area.close();
    _state.close();
    _country.close();
    _pinCode.close();
  }
}
