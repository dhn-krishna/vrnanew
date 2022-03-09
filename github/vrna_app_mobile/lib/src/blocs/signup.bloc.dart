import 'package:vrna_app_mobile/src/repositories/signup.repository.dart';
import 'package:vrna_app_mobile/src/widgets/toast.dart';
import 'package:rxdart/rxdart.dart';

class SignupBloc {
  SignupRepository _repository = new SignupRepository();

  final _loading = BehaviorSubject<bool>();
  final _email = BehaviorSubject<String>();
  final _phone = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();
  final _repassword = BehaviorSubject<String>();

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

  void signUp(context) async {
    _setLoading(true);

    final ret = await _repository.signup(context, _email.value.toString(),
        _password.value.toString(), _phone.value.toString());
    print(ret);

    _setLoading(false);

    if (ret.status == 200) {
      if (ret.statusResult == 'Success' || ret.statusResult == 'SUCCESS') {
        CustomToast.show(ret.message.toString());
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
    _email.close();
    _phone.close();
    _password.close();
    _repassword.close();
  }
}
