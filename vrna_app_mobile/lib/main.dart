import 'package:flutter/material.dart';
import "package:graphql_flutter/graphql_flutter.dart";
import 'package:vrna_app_mobile/src/helpers/graphql/config.dart';
import 'src/app.dart';

GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    GraphQLProvider(
      client: graphQLConfiguration.client,
      child: CacheProvider(child: App()),
    ),
  );
}
