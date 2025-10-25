import 'package:bus_ellide_mobile/data/models/route_search.dart';
import 'package:bus_ellide_mobile/data/repositories/route_repository.dart';
import 'package:bus_ellide_mobile/injection_container.dart';
import 'package:flutter/material.dart';

class RouteBloc extends ChangeNotifier {
  final RouteRepository _repository = di<RouteRepository>();

  List<RouteSearch> _routes = [];
  List<RouteSearch> get routes => _routes;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> searchRoutes(String searchText) async {
    if (searchText.isEmpty) {
      _routes = [];
      notifyListeners();
      return;
    }

    _isLoading = true;
    notifyListeners();

    try {
      _routes = await _repository.fetchRoutes(searchText);
    } catch (e) {
      _routes = [];
      debugPrint('Error fetching routes: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
