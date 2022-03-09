import 'package:flutter/material.dart';
import 'package:vrna_app_mobile/src/helpers/social_auth_helper.dart';
import 'package:vrna_app_mobile/src/helpers/utils/validationutils.dart';
import 'package:vrna_app_mobile/src/pages/login/login.page.dart';
import 'package:vrna_app_mobile/src/repositories/signup.repository.dart';
import 'package:vrna_app_mobile/src/widgets/toast.dart';
import 'package:rxdart/rxdart.dart';

class SignupBloc {
  SignupRepository _repository = new SignupRepository();
  SocialAuthHelper _socialAuthHelper = new SocialAuthHelper();

  final _loading = BehaviorSubject<bool>();
  final _email = BehaviorSubject<String>();
  final _phone = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();
  final _repassword = BehaviorSubject<String>();
  final String defaultErrorMessage = 'Something went wrong';

  Stream<bool> get loading => _loading.stream;
  void _setLoading(bool value) => _loading.sink.add(value);

  Stream<String> get email => _email.stream;
  void setEmail(String value) => _email.sink.add(value);

  Stream<String> get phone => _phone.stream;
  void setPhone(String value) => _phone.sink.add(value);

  Stream<String> get password => _password.stream;
  void setPassword(String value) => _password.sink.add(value);

  Stream<String> get repassword => _repassword.stream;
  void setRepassword(String value) => _repassword.sink.add(value);

  bool validate(context) {
    var email = _email.hasValue ? _email.value : '';
    var pwd = _password.hasValue ? _password.value : '';
    var confirmPwd = _repassword.hasValue ? _repassword.value : '';
    var mobile = _phone.hasValue ? _phone.value : '';
    if (!ValidationUtils.validateEmail(email)) {
      CustomToast.show(
        'Please enter a valid email',
      );
      return false;
    }
    if (!ValidationUtils.validateMobile(mobile)) {
      CustomToast.show('Please enter a valid mobile number');
      return false;
    }
    if (!ValidationUtils.validatePassword(pwd)) {
      CustomToast.show('Please enter a valid password');
      // TODO uncomment
      return false;
    }
    if (confirmPwd.isEmpty || confirmPwd != pwd) {
      CustomToast.show('Confirm password must be same as password');
      return false;
    }
    return true;
  }

  void signUp(context) async {
    _setLoading(true);
    final ret = await _repository.signup(context, _email.value.toString(),
        _password.value.toString(), _phone.value.toString(), false, '');
    _setLoading(false);
    if (ret.status == 200) {
      if (ret.statusResult == 'Success' || ret.statusResult == 'SUCCESS') {
        CustomToast.show(
            "Verification email has been sent. Kindly confirm your email");
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

  void socialAccountSignUp(context, socialAccount) async {
    var userCredentials;
    var loginVia;
    if (socialAccount == 'fb') {
      userCredentials = await _socialAuthHelper.signInWithFacebook();
      loginVia = 'FACEBOOK';
    } else if (socialAccount == 'google') {
      userCredentials = await _socialAuthHelper.signInWithGoogle();
      loginVia = 'GOOGLE';
    }
    // if(userCredentials){
    var email = userCredentials.user?.email;
    _setLoading(true);
    final ret =
        await _repository.signup(context, email, 'NA', '', true, loginVia);
    _setLoading(false);
    if (ret.status == 200) {
      if (ret.statusResult == 'Success' || ret.statusResult == 'SUCCESS') {
        CustomToast.show(
            "Verification email has been sent. Kindly confirm your email");
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
    // }
  }

  void dispose() {
    _loading.close();
    _email.close();
    _phone.close();
    _password.close();
    _repassword.close();
  }
}
