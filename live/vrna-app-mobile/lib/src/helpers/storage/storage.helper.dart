import 'package:localstorage/localstorage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageHelper {
  static SharedPreferences _prefs;
  static Future<dynamic> _getInstance() async => _prefs = await SharedPreferences.getInstance();

  static Future<String> get(String key) async {
    await _getInstance();
    return _prefs.getString(key);
  }

  static Future<dynamic> getValue(String key) async {
    await _getInstance();
    return _prefs.get(key);
  }

  static void set(String key, dynamic value) async {
    await _getInstance();
    _prefs.setString(key, value);
  }

  static void remove(String key) async {
    await _getInstance();
    _prefs.remove(key);
  }

  static void clear() async {
    await _getInstance();
    _prefs.clear();
  }


}

class StorageHelperV2 {
  static LocalStorage storage = new LocalStorage("vrna_app");

  static Future<String> get(String key) async {
    var isStorageReady = await storage.ready;
    if (isStorageReady)
      return storage.getItem(key);
    else
      throw new Exception("Storage Not Ready");
  }

  static void set(String key, dynamic value) async {
    var isStorageReady = await storage.ready;
    if (isStorageReady)
      await storage.setItem(key, value);
    else
      throw new Exception("Storage Not Ready");
  }

  static void remove(String key) async {}
}
