import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ProfileBloc extends ChangeNotifier {
  ProfileBloc() {
    init();
  }
  static const _boxName = 'favorites';
  static const _key = 'routeNumbers';

  late Box _box;
  Map<String, String> _favorites = <String, String>{};

  Map<String, String> get favorites => _favorites;
  List<MapEntry<String, String>> get entries => _favorites.entries.toList();

  Future<void> init() async {
    if (!Hive.isBoxOpen(_boxName)) {
      await Hive.openBox<Map>(_boxName);
    }
    _box = Hive.box<Map>(_boxName);
    final saved = _box.get(_key);
    _favorites = saved?.cast<String, String>() ?? <String, String>{};
    debugPrint("toggle_fav $saved ");

    notifyListeners();
  }

  Future<void> toggleFavorite(String routeNo, String routeId) async {
    debugPrint("toggle_fav $routeNo : $routeId");
    if (_favorites.containsKey(routeId)) {
      _favorites.remove(routeId);
    } else {
      _favorites.addAll({routeId: routeNo});
    }
    notifyListeners();

    await _box.put(_key, _favorites);
  }

  bool isFavourite(String routeNo) {
    return _favorites.containsKey(routeNo);
  }
}
