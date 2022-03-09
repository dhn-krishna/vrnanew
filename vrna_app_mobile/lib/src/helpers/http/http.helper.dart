import 'package:vrna_app_mobile/src/helpers/storage/storage.helper.dart';
import 'package:vrna_app_mobile/src/helpers/storage/storage.keys.dart';
import 'package:dio/dio.dart';
import 'dart:developer';

class HttpHelper {
  static Dio _client;

  static Future<Dio> _getInstance() async {
    final storageToken = await StorageHelper.get(StorageKeys.token);

    if (_client == null) _client = Dio();

    Map<String, dynamic> headers = {};
    // headers['userName'] = 'anand.v@vrnaplex.com';
    // headers['macAddress'] = '00-AD-24-48-AC-F5';
    // headers['Content-Type'] = 'application/json';
    if (storageToken != null) headers['Authorization'] = 'Bearer $storageToken';

    _client.options.headers = headers;
    return _client;
  }

  static Future<Response> get(String url) async {
    final instance = await _getInstance();
    return instance.get(url);
  }

  static Future<Response> post(String url, {dynamic body}) async {
    final instance = await _getInstance();
    log('data: $body');
    return instance.post(url, data: body);
  }

  static Future<Response> put(String url, {dynamic body}) async {
    final instance = await _getInstance();
    return instance.put(url, data: body);
  }

  static Future<Response> delete(String url, {dynamic body}) async {
    final instance = await _getInstance();
    return instance.delete(url);
  }
}
