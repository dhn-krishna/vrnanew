import 'package:vrna_app_mobile/src/repositories/auth.repository.dart';
import 'package:vrna_app_mobile/src/widgets/toast.dart';
import 'package:rxdart/rxdart.dart';

class AuthBloc {
  AuthRepository _repository = new AuthRepository();

  final _loading = BehaviorSubject<bool>();
  final _login = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  Stream<bool> get loading => _loading.stream;
  void _setLoading(bool value) => _loading.sink.add(value);

  Stream<String> get login => _login.stream;
  void setLogin(String value) => _login.sink.add(value);

  Stream<String> get password => _password.stream;
  void setPassword(String value) => _password.sink.add(value);

  void signIn(context) async {
    _setLoading(true);

    final ret = await _repository.login(
        context, _login.value.toString(), _password.value.toString());
    print(ret);

    _setLoading(false);

    if (ret.status == 200) {
      CustomToast.show("Success");
    }

    CustomToast.show(ret.message);
  }

  void dispose() {
    _loading.close();
    _login.close();
    _password.close();
  }
}
