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
    return [];
  }
}
