import 'package:flutter/material.dart';
import 'src/app.dart';

// GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    App()
    // GraphQLProvider(
    //   client: graphQLConfiguration.client,
    //   child: CacheProvider(child: App()),
    // ),
  );
}
