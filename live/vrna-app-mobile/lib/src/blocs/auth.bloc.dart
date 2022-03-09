import 'package:flutter/material.dart';
import 'package:vrna_app_mobile/src/helpers/social_auth_helper.dart';
import 'package:vrna_app_mobile/src/helpers/utils/validationutils.dart';
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

  final _showPassword = BehaviorSubject<bool>.seeded(false);

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

  Stream<bool> get showPassword => _showPassword.stream;
  void setShowPassword(bool value) => _showPassword.sink.add(value);

  bool validate(context) {
    var email = _login.value;
    var pwd = _password.value;
    if (!ValidationUtils.validateEmail(email)) {
      CustomToast.show(
        'Please enter a valid email',
      );
      return false;
    }
    if (pwd == null || pwd.isEmpty) {
      CustomToast.show('Please enter your password');
      return false;
    }
    return true;
  }

  void signIn(context) async {
    _setLoading(true);
    final ret = await _repository.login(
        context, _login.value.toString(), _password.value.toString());
    _setLoading(false);
    if (ret.status == 200) {
      if (ret.statusResult == 'Success') {
        Route route = MaterialPageRoute(builder: (context) => DashboardPage());
        Navigator.pushReplacement(context, route);
      } else {
        CustomToast.show('Incorrect username or password');
      }
    } else {
      CustomToast.show(
          'Incorrect username or password' ?? 'Something went wrong');
    }
  }

  void googleSignIn(BuildContext context) async {
    _setLoading(true);
    var ret;
    try {
      // call and get response from social auth helper
      var socialAccount = await _socialAuthHelper.signInWithGoogle();
      var email = socialAccount.email;
      ret = await signupRepository.signup(
          context, email, 'NA', '', true, 'GOOGLE');
    } catch (Exception) {
      CustomToast.show('Something went wrong');
      return;
    } finally {
      _setLoading(false);
    }
    if (ret.status == 200 || ret.status == 202) {
      if (ret.statusResult == 'Success' || ret.statusResult == 'SUCCESS') {
        Route route = MaterialPageRoute(builder: (context) => DashboardPage());
        Navigator.pushReplacement(context, route);
      } else {
        CustomToast.show(ret.message.toString());
      }
    } else {
      CustomToast.show(ret.message ?? '');
    }
  }

  void facebookSignIn(BuildContext context) async {
    _setLoading(true);
    var ret;
    try {
      // call and get response from social auth helper
      var socialAccount = await _socialAuthHelper.signInWithFacebook();
      var email = socialAccount.email;
      ret = await signupRepository.signup(
          context, email, 'NA', '', true, 'FACEBOOK');
    } catch (Exception) {
      CustomToast.show('Something went wrong');
      return;
    } finally {
      _setLoading(false);
    }
    if (ret.status == 200 || ret.status == 202) {
      if (ret.statusResult == 'Success' || ret.statusResult == 'SUCCESS') {
        Route route = MaterialPageRoute(builder: (context) => DashboardPage());
        Navigator.pushReplacement(context, route);
      } else {
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
        CustomToast.show(ret.message.toString());
      }
    } else {
      CustomToast.show(ret.message ?? '');
    }
  }

  void dispose() {
    _loading.close();
    _login.close();
    _password.close();
    _forgotEmail.close();
    _tempPassword.close();
  }
}
