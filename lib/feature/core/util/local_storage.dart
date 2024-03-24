import '../../../export.dart';

abstract interface class LocalStorage {
  Future<void> remove(String key);
  Future<void> setString(String key, String value);
  String? getString(String key);
  Future<void> setBool(String key, bool value);
  bool? getBool(String key);
  Future<void> setInt(String key, int value);
  int? getInt(String key);
}

class SharedPreferencesLocalStorage implements LocalStorage {
  SharedPreferencesLocalStorage(SharedPreferences sharedPreferences)
      : _sp = sharedPreferences;
  final SharedPreferences _sp;

  @override
  Future<void> remove(String key) => _sp.remove(key);

  @override
  Future<void> setString(String key, String value) => _sp.setString(key, value);

  @override
  String? getString(String key) => _sp.getString(key);

  @override
  Future<void> setBool(String key, bool value) => _sp.setBool(key, value);

  @override
  bool? getBool(String key) => _sp.getBool(key);

  @override
  Future<void> setInt(String key, int value) => _sp.setInt(key, value);

  @override
  int? getInt(String key) => _sp.getInt(key);
}
