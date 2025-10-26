import '../../../core/constants/api_endpoints.dart';
import '../../../core/services/api_client.dart';

class BmtcApi {
  final ApiClient client;

  BmtcApi(this.client);

  Future<List<dynamic>> searchRoute(String text) async {
    final res = await client.get(
      ApiEndpoints.searchRoute,
      queryParameters: {'query': text},
    );
    return res.data['data'] ?? [];
  }

  Future<Map<String, dynamic>> getRouteDetails(String routeId) async {
    final res = await client.get("${ApiEndpoints.routeDetails}/$routeId");
    return res.data;
  }

  Future<List> getRoutePoints(String routeId) async {
    final res = await client.get("${ApiEndpoints.routePoints}/$routeId");
    return res.data['data'] ?? [];
  }
}
