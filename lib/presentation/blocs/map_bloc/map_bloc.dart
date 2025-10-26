import 'package:bus_ellide_mobile/data/models/bus_route.dart';
import 'package:bus_ellide_mobile/data/models/route_point.dart';
import 'package:bus_ellide_mobile/data/repositories/route_repository.dart';
import 'package:bus_ellide_mobile/injection_container.dart';
import 'package:flutter/material.dart';

class MapBloc extends ChangeNotifier {
  final RouteRepository _repository = di<RouteRepository>();

  final List<String> _selected = [];
  final Map<String, List<RoutePoint>> _selectedRoutePoints =
      <String, List<RoutePoint>>{};

  List<String> get selected => _selected;
  Map<String, List<RoutePoint>> get selectedRoutePoints => _selectedRoutePoints;

  Future<void> toggleSelected(String routeNo) async {
    debugPrint("data_clicked______ $routeNo. $_selected");
    if (_selected.contains(routeNo)) {
      _selected.remove(routeNo);
      _selectedRoutePoints.remove(routeNo);
    } else {
      _selected.add(routeNo);

      BusRoute routeDetails = await _repository.fetchRouteDetail(routeNo);
      if (routeDetails.down != null &&
          routeDetails.down!.data != null &&
          routeDetails.down!.data!.isNotEmpty) {
        List<RoutePoint> routePoints = await _repository.fetchRoutePoints(
          "${routeDetails.down!.data![0].routeid}",
        );
        _selectedRoutePoints.addAll({routeNo: routePoints});
      }
    }

    notifyListeners();
  }
}
