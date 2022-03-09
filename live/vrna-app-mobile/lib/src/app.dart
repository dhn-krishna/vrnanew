import 'package:flutter/material.dart';
import 'package:vrna_app_mobile/src/blocs/base/bloc_provider.dart';
import 'package:vrna_app_mobile/src/values/theme.dart' as appTheme;
import 'package:vrna_app_mobile/src/pages/login/login.page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: appTheme.theme,
          home: LoginPage()),
    );
  }
}
