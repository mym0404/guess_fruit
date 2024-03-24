import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  LocalStorage(this._sp);
  final SharedPreferences _sp;

  void remove(String key) => _sp.remove(key);

  Future<void> setString(String key, String value) => _sp.setString(key, value);
  String? getString(String key) => _sp.getString(key);

  Future<void> setBool(String key, bool value) => _sp.setBool(key, value);
  bool? getBool(String key) => _sp.getBool(key);

  Future<void> setInt(String key, int value) => _sp.setInt(key, value);
  int? getInt(String key) => _sp.getInt(key);
}
