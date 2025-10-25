import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesStorage {
  static const _key = 'favorite_routes';
  final SharedPreferences prefs;

  FavoritesStorage._(this.prefs);

  static Future<FavoritesStorage> getInstance() async {
    final prefs = await SharedPreferences.getInstance();
    return FavoritesStorage._(prefs);
  }

  List<String> getFavorites() {
    final raw = prefs.getString(_key);
    if (raw == null) return [];
    final list = json.decode(raw) as List<dynamic>;
    return list.map((e) => e.toString()).toList();
  }

  Future<void> saveFavorites(List<String> ids) async {
    await prefs.setString(_key, json.encode(ids));
  }
}
