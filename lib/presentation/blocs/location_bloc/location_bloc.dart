import 'package:bus_ellide_mobile/data/services/location_service.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationBloc extends ChangeNotifier {
  final LocationService _locationService = LocationService();
  Position? _position;
  String? _error;
  bool _isLoading = false;

  Position? get position => _position;
  String? get error => _error;
  bool get isLoading => _isLoading;

  LocationBloc() {
    getLocation(); // fetch on startup
  }

  Future<void> getLocation() async {
    _isLoading = true;
    notifyListeners();

    try {
      final pos = await _locationService.getCurrentLocation();
      _position = pos;
      _error = null;
    } catch (e) {
      _error = e.toString();
      _position = null;
    }

    _isLoading = false;
    notifyListeners();
  }
}
