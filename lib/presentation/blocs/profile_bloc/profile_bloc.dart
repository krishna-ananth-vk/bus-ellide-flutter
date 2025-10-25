import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ProfileBloc extends ChangeNotifier {
  ProfileBloc() {
    init();
  }
  static const _boxName = 'favorites';
  static const _key = 'routeNumbers';

  late Box<List> _box;
  List<String> _favorites = [];

  List<String> get favorites => _favorites;

  Future<void> init() async {
    if (!Hive.isBoxOpen(_boxName)) {
      await Hive.openBox<List>(_boxName);
    }
    _box = Hive.box<List>(_boxName);
    final saved = _box.get(_key);
    _favorites = saved?.cast<String>() ?? [];

    notifyListeners();
  }

  Future<void> toggleFavorite(String routeNo) async {
    if (_favorites.contains(routeNo)) {
      _favorites.remove(routeNo);
    } else {
      _favorites.add(routeNo);
    }
    notifyListeners();
    await _box.put(_key, _favorites);
  }

  bool isFavourite(String routeNo) {
    return _favorites.contains(routeNo);
  }
}
