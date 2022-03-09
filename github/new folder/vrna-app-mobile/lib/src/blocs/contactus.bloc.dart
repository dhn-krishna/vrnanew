import 'package:flutter/material.dart';
import 'package:vrna_app_mobile/src/pages/login/login.page.dart';
import 'package:vrna_app_mobile/src/repositories/contactus.repository.dart';
import 'package:vrna_app_mobile/src/widgets/toast.dart';
import 'package:rxdart/rxdart.dart';

class ContactUsBloc {
  ContactUsRepository _repository = new ContactUsRepository();

  final _loading = BehaviorSubject<bool>();
  final _name = BehaviorSubject<String>();
  final _email = BehaviorSubject<String>();
  final _category = BehaviorSubject<String>();
  final _message = BehaviorSubject<String>();
  final String defaultErrorMessage = 'Something went wrong';

  Stream<bool> get loading => _loading.stream;
  void _setLoading(bool value) => _loading.sink.add(value);

  Stream<String> get username => _name.stream;
  void setName(String value) => _name.sink.add(value);

  Stream<String> get email => _email.stream;
  void setEmail(String value) => _email.sink.add(value);

  Stream<String> get category => _category.stream;
  void setCategory(String value) => _category.sink.add(value);

  Stream<String> get message => _message.stream;
  void setMessage(String value) => _message.sink.add(value);

  void raiseSupportTicket(context) async {
    _setLoading(true);
    final ret = await _repository.raiseSupportTicket(
        context,
        _name.value.toString(),
        _email.value.toString(),
        _category.value.toString(),
        _message.value.toString());
    _setLoading(false);
    print('Respone @bloc : ${ret.status} ${ret.statusResult} ${ret.message}');
    if (ret.status == 200) {
      if (ret.statusResult == 'Success' || ret.statusResult == 'SUCCESS') {
        CustomToast.show(
            ret.message);
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return LoginPage();
        }));
      } else {
        CustomToast.show(ret.message.toString());
      }
    } else {
      CustomToast.show(ret.message ?? defaultErrorMessage);
    }
  }

  void dispose() {
    _loading.close();
    _name.close();
    _email.close();
    _message.close();
    _category.close();
  }
}
