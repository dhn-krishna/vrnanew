import 'package:flutter/material.dart';
import 'package:vrna_app_mobile/src/helpers/http/http.helper.dart';
import 'package:vrna_app_mobile/src/helpers/storage/storage.helper.dart';
import 'package:vrna_app_mobile/src/helpers/storage/storage.keys.dart';
import 'package:vrna_app_mobile/src/models/response.model.dart';
import 'package:vrna_app_mobile/src/models/user.model.dart';
import 'package:unique_identifier/unique_identifier.dart';
import 'package:vrna_app_mobile/src/repositories/sources/graphql/authSchema.dart';
import 'package:vrna_app_mobile/src/helpers/graphql/config.dart';
import "package:graphql_flutter/graphql_flutter.dart";
import 'package:vrna_app_mobile/src/pages/dashboard/dashboard.page.dart';
import 'dart:developer';
import './base/endpoints.dart' as Endpoints;

class AuthService {
  Future<ResponseModel> login(
      BuildContext context, String username, String password) async {
    ResponseModel response = ResponseModel();
    UserModel user;

    final String url = Endpoints.login.auth;
    String identifier = await UniqueIdentifier.serial;
    String imeiNumber = identifier.toString();

    //final payload = {'email':'eve.holt@reqres.in','password':'cityslicka'};

    // final HttpLink httpLink = HttpLink(
    //   uri:
    //       "http://ec2-18-216-33-39.us-east-2.compute.amazonaws.com:8089/auth-service/user/validate",
    // );

    // GraphQLClient _client = GraphQLClient(
    //   cache: InMemoryCache(),
    //   link: httpLink,
    // );

    final payload = {
      'email': '$username',
      'password': '$password',
      'macaddress': '$imeiNumber'
    };
    log('identifie:$imeiNumber');
    // const String readRepositories = r'''
    //     query ReadRepositories($email: Int!,$password: Int!,$macaddress: Int!) {
    //       data {

    //       }
    //     }
    //   ''';

    // final MutationOptions options = MutationOptions(
    //   documentNode: gql(readRepositories),
    //   variables: <String, dynamic>{
    //     "email": "anand.v@vrnaplex.com",
    //     "password": "Anand123",
    //     "macaddress": "00-AD-24-48-AC-F5"
    //   },
    // );

    // final QueryResult result = await _client.mutate(options);

    // if (result.hasException) {
    //   print(result.exception.toString());
    // } else {
    //   print(result);
    // }

    // QueryResult result = await _client.mutate(
    //   MutationOptions(
    //     documentNode: gql(
    //         QueryMutationAuth.addAuth(username, password, '00-AD-24-48-AC-F5')),
    //   ),
    // );

    final retAuth = HttpHelper.post(url, body: payload);

    await retAuth.then((res) {
      String token = res.data["access_token"];
      StorageHelper.set(StorageKeys.token, token);
      StorageHelper.set(StorageKeys.username, username);
      StorageHelper.set(StorageKeys.password, password);

      user = UserModel.fromJson(res.data);
      log('response success:$res');
      log('user response success:$user');
      response.status = res.statusCode;
      response.data = user;
      response.message = 'success';
      Route route = MaterialPageRoute(builder: (context) => DashboardPage());
      Navigator.push(context, route);
    }).catchError((e) {
      StorageHelper.set(StorageKeys.token, "");
      StorageHelper.set(StorageKeys.username, "");
      StorageHelper.set(StorageKeys.password, "");

      response.status = 500;
      response.data = e;
      response.message = password;
    });

    return response;
  }
}
