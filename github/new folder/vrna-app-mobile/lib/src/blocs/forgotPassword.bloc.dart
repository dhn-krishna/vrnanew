import 'package:flutter/material.dart';
import 'package:vrna_app_mobile/src/repositories/auth.repository.dart';
import 'package:vrna_app_mobile/src/pages/dashboard/dashboard.page.dart';
import 'package:vrna_app_mobile/src/widgets/toast.dart';
import 'package:rxdart/rxdart.dart';

class ForgotPasswordBloc {
  AuthRepository _repository = new AuthRepository();
  final String defaultErrorMessage = 'Something went wrong';

  final _loading = BehaviorSubject<bool>();
  final _login = BehaviorSubject<String>();

  Stream<bool> get loading => _loading.stream;
  void _setLoading(bool value) => _loading.sink.add(value);

  Stream<String> get login => _login.stream;
  void setLogin(String value) => _login.sink.add(value);

  void forgotPassword(context) async {
    _setLoading(true);

    final ret =
        await _repository.forgotpassword(context, _login.value.toString());

    _setLoading(false);

    if (ret.status == 200) {
      if (ret.statusResult == 'Success') {
        Route route = MaterialPageRoute(builder: (context) => DashboardPage());
        Navigator.push(context, route);
      } else {
        print(ret.toString());
        CustomToast.show(ret.message.toString());
      }
    } else {
      CustomToast.show(ret.message ?? defaultErrorMessage);
    }
  }

  void dispose() {
    _loading.close();
    _login.close();
    // _password.close();
  }
}
