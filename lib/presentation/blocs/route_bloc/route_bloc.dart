import 'package:bus_ellide_mobile/data/models/route_search.dart';
import 'package:bus_ellide_mobile/data/repositories/route_repository.dart';
import 'package:bus_ellide_mobile/injection_container.dart';
import 'package:bus_ellide_mobile/presentation/blocs/profile_bloc/profile_bloc.dart';
import 'package:flutter/material.dart';

class RouteBloc extends ChangeNotifier {
  final RouteRepository _repository = di<RouteRepository>();
  final ProfileBloc _profileBloc = di<ProfileBloc>();

  List<RouteSearch> _routes = [];
  List<RouteSearch> get routes => _routes;

  Map<String, String> _selectedRoutes = <String, String>{};
  Map<String, String> get selectedRoutes => _selectedRoutes;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> init() async {
    // _selectedRoutes = _profileBloc.favorites;
  }

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

  void selectItem(String routeNo, String routeId) {
    debugPrint('Selected route: ${routeNo}');
    if (routeNo != null && routeNo.isNotEmpty) {
      if (_selectedRoutes.containsKey(routeId)) {
        _selectedRoutes.remove(routeId);
      } else {
        _selectedRoutes.addAll({routeId: routeNo});
      }
      _profileBloc.toggleFavorite(routeNo, routeId);
    }
    _routes = []; // hide dropdown results after selection
    notifyListeners();
  }
}
