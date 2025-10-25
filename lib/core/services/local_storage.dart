import 'package:shared_preferences/shared_preferences.dart';

/// Tiny wrapper around SharedPreferences for simple key/value storage.
class LocalStorage {
  final SharedPreferences prefs;

  LocalStorage._(this.prefs);

  static Future<LocalStorage> getInstance() async {
    final prefs = await SharedPreferences.getInstance();
    return LocalStorage._(prefs);
  }

  Future<bool> setString(String key, String value) async =>
      prefs.setString(key, value);
  String? getString(String key) => prefs.getString(key);
  Future<bool> remove(String key) async => prefs.remove(key);
}
