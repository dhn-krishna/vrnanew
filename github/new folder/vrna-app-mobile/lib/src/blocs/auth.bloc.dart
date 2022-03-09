import 'package:flutter/material.dart';
import 'package:vrna_app_mobile/src/helpers/social_auth_helper.dart';
import 'package:vrna_app_mobile/src/pages/login/login.page.dart';
import 'package:vrna_app_mobile/src/pages/resetpass/reset.page.dart';
import 'package:vrna_app_mobile/src/repositories/auth.repository.dart';
import 'package:vrna_app_mobile/src/repositories/signup.repository.dart';
import 'package:vrna_app_mobile/src/pages/dashboard/dashboard.page.dart';
import 'package:vrna_app_mobile/src/widgets/toast.dart';
import 'package:rxdart/rxdart.dart';

class AuthBloc {
  AuthRepository _repository = new AuthRepository();
  SignupRepository signupRepository = new SignupRepository();
  SocialAuthHelper _socialAuthHelper = new SocialAuthHelper();

  final _loading = BehaviorSubject<bool>();
  final _forgotEmail = BehaviorSubject<String>.seeded('');
  final _login = BehaviorSubject<String>.seeded('');
  final _password = BehaviorSubject<String>.seeded('');
  final _tempPassword = BehaviorSubject<String>.seeded('');

  Stream<bool> get loading => _loading.stream;
  void _setLoading(bool value) => _loading.sink.add(value);

  Stream<String> get login => _login.stream;
  void setLogin(String value) => _login.sink.add(value);

  Stream<String> get forgotEmail => _forgotEmail.stream;
  void setForgotEmail(String value) => _forgotEmail.sink.add(value);

  Stream<String> get password => _password.stream;
  void setPassword(String value) => _password.sink.add(value);

  Stream<String> get tempPassword => _tempPassword.stream;
  void setTempPassword(String value) => _tempPassword.sink.add(value);

  void signIn(context) async {
    _setLoading(true);

    final ret = await _repository.login(
        context, _login.value.toString(), _password.value.toString());
    _setLoading(false);
    if (ret.status == 200) {
      if (ret.statusResult == 'Success') {
        Route route = MaterialPageRoute(builder: (context) => DashboardPage());
        Navigator.push(context, route);
      } else {
        print(ret.toString());
        CustomToast.show('Incorrect username or password');
      }
    } else {
      CustomToast.show(
          'Incorrect username or password' ?? 'Something went wrong');
    }
  }

  void googleSignIn(BuildContext context) async {
    _setLoading(true);
    // call and get response from social auth helper
    var socialAccount = await _socialAuthHelper.signInWithGoogle();
    var email = socialAccount.email;
    final ret = await signupRepository.signup(context, email, 'NA', '', true, 'GOOGLE');
    _setLoading(false);
    if (ret.status == 200 || ret.status == 202) {
      if (ret.statusResult == 'Success' || ret.statusResult == 'SUCCESS') {
        Route route = MaterialPageRoute(builder: (context) => DashboardPage());
        Navigator.push(context, route);
      } else {
        print(ret.toString());
        CustomToast.show(ret.message.toString());
      }
    } else {
      CustomToast.show(ret.message ?? '');
    }
  }

  void facebookSignIn(BuildContext context) async {
    _setLoading(true);
    // call and get response from social auth helper
    var socialAccount = await _socialAuthHelper.signInWithFacebook();
    var email = socialAccount.email;
    final ret = await signupRepository.signup(context, email, 'NA', '', true, 'FACEBOOK');;
    _setLoading(false);
    if (ret.status == 200 || ret.status == 202) {
      if (ret.statusResult == 'Success' || ret.statusResult == 'SUCCESS') {
        Route route = MaterialPageRoute(builder: (context) => DashboardPage());
        Navigator.push(context, route);
      } else {
        print(ret.toString());
        CustomToast.show(ret.message.toString());
      }
    } else {
      CustomToast.show(ret.message ?? '');
    }
  }

  void forgotPassword(context) async {
    _setLoading(true);
    final ret = await _repository.forgotpassword(
        context, _forgotEmail.value.toString());
    _setLoading(false);
    if (ret.status == 200) {
      if (ret.statusResult == 'Success' || ret.statusResult == 'SUCCESS') {
        CustomToast.show("Password reset link has been sent");
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => ResetPasswordPage(),
            ));
      } else {
        print(ret.toString());
        CustomToast.show(ret.message.toString());
      }
    } else {
      CustomToast.show(ret.message ?? '');
    }
  }

  void updatePassword(
    context,
  ) async {
    _setLoading(true);
    final ret = await _repository.updatePassword(
        context,
        _forgotEmail.value.toString(),
        _password.value.toString(),
        _tempPassword.value.toString());
    _setLoading(false);
    if (ret.status == 200) {
      if (ret.statusResult == 'Success' || ret.statusResult == 'SUCCESS') {
        CustomToast.show("Password has been successfully reset");
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginPage(),
            ));
      } else {
        print(ret.toString());
        CustomToast.show(ret.message.toString());
      }
    } else {
      CustomToast.show(ret.message ?? '');
    }
  }

  void dispose() {
    // _loading.close();
    _login.close();
    // _password.close();
    //  / _forgotEmail.close();
    // _tempPassword.close();
  }
}
