import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';
import 'src/app.dart';

// GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  runApp(
    App()
    // GraphQLProvider(
    //   client: graphQLConfiguration.client,
    //   child: CacheProvider(child: App()),
    // ),
  );
}
