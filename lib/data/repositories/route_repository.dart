import 'package:bus_ellide_mobile/data/models/bus_route.dart';
import 'package:bus_ellide_mobile/data/models/route_point.dart';
import 'package:bus_ellide_mobile/data/models/route_search.dart';

import '../sources/remote/bmtc_api.dart';

class RouteRepository {
  final BmtcApi api;

  RouteRepository(this.api);

  Future<List<RouteSearch>> fetchRoutes(String searchText) async {
    final data = await api.searchRoute(searchText);
    if (data is List) {
      return data
          .map((e) => RouteSearch.fromJson(e as Map<String, dynamic>))
          .toList();
    }
  }

  Future<BusRoute> fetchRouteDetail(String searchText) async {
    final data = await api.getRouteDetails(searchText);
    return BusRoute.fromJson(data);
  }

  Future<List<RoutePoint>> fetchRoutePoints(String routeId) async {
    final data = await api.getRoutePoints(routeId);
    if (data is List) {
      return data
          .map((e) => RoutePoint.fromJson(e as Map<String, dynamic>))
          .toList();
    }
  }
}
